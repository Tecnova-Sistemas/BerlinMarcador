using Microsoft.Maui.Networking;
using System.Net.Http;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using System.Text.Json;

namespace BerlinMarcador.Services;

public record MarcacionResponse(bool Status, string Msg, string Nombre, string Cedula, string RawResponse);

public class ApiService
{
    private static readonly Uri BaseUri = new("https://webapps.boschecuador.com/", UriKind.Absolute);
    private readonly HttpClient _http;

    public ApiService()
    {
        var handler = new HttpClientHandler();
        handler.ServerCertificateCustomValidationCallback =
            HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;

        _http = new HttpClient(handler)
        {
            BaseAddress = BaseUri,
            Timeout = TimeSpan.FromSeconds(10)
        };
    }

    public async Task<(bool ok, string msg)> LoginAsync(string usuario, string clave)
    {
        var form = new FormUrlEncodedContent(new[]
        {
            new KeyValuePair<string, string>("user", usuario),
            new KeyValuePair<string, string>("pass", clave),
        });

        var json = await PostFormAsync("berlinMarcador/api_login.php", form);
        var doc = JsonDocument.Parse(json);

        var ok = doc.RootElement.GetProperty("ok").GetBoolean();
        var msg = doc.RootElement.GetProperty("msg").GetString() ?? "";
        return (ok, msg);
    }

    public async Task<MarcacionResponse> MarcarAsync(string cedula, string tipo)
    {
        var endpoint = $"berlinGestion/empleados/marcacion/{Uri.EscapeDataString(cedula)}/{Uri.EscapeDataString(tipo)}";
        var json = await PostAsync(endpoint);
        var trimmed = json.TrimStart();

        if (trimmed.StartsWith("<", StringComparison.Ordinal))
        {
            var htmlPreview = NormalizeText(trimmed);
            var status = DetectHtmlSuccess(htmlPreview);
            var nombre = ExtractNombre(htmlPreview, cedula);
            var cedulaRespuesta = ExtractCedula(htmlPreview, cedula);
            var message = status
                ? BuildSuccessMessage(tipo, cedulaRespuesta, nombre, htmlPreview)
                : BuildHtmlErrorMessage(htmlPreview);

            return new MarcacionResponse(
                status,
                message,
                nombre,
                cedulaRespuesta,
                htmlPreview);
        }

        JsonDocument doc;
        try
        {
            doc = JsonDocument.Parse(json);
        }
        catch (JsonException)
        {
            return new MarcacionResponse(
                false,
                "El backend devolvio una respuesta no valida para JSON.",
                "",
                cedula,
                json);
        }

        using (doc)
        {
            var status = doc.RootElement.GetProperty("status").GetBoolean();
            var rawMsg = doc.RootElement.GetProperty("msg").GetString() ?? "";
            var msg = CleanMessage(rawMsg);
            var nombre = GetString(doc.RootElement, "nombre", "empleado", "nombres", "name");
            if (string.IsNullOrWhiteSpace(nombre))
                nombre = ExtractNombre(rawMsg, cedula);
            var cedulaRespuesta = GetString(doc.RootElement, "cedula", "identificacion", "documento");
            if (string.IsNullOrWhiteSpace(cedulaRespuesta))
                cedulaRespuesta = ExtractCedula(rawMsg, cedula);

            if (status)
                msg = BuildSuccessMessage(tipo, cedulaRespuesta, nombre, rawMsg);

            return new MarcacionResponse(
                status,
                msg,
                nombre,
                string.IsNullOrWhiteSpace(cedulaRespuesta) ? cedula : cedulaRespuesta,
                json);
        }
    }

    private async Task<string> PostFormAsync(string endpoint, FormUrlEncodedContent form)
    {
        return await SendAsync(() => _http.PostAsync(endpoint, form));
    }

    private async Task<string> PostAsync(string endpoint)
    {
        using var content = new StringContent(string.Empty);
        return await SendAsync(() => _http.PostAsync(endpoint, content));
    }

    private async Task<string> SendAsync(Func<Task<HttpResponseMessage>> request)
    {
        if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
        {
            throw new InvalidOperationException("El dispositivo no tiene acceso a Internet.");
        }

        try
        {
            using var response = await request();
            var body = await response.Content.ReadAsStringAsync();

            if (!response.IsSuccessStatusCode)
            {
                throw new InvalidOperationException(
                    $"El servidor respondio con codigo {(int)response.StatusCode}. {body}".Trim());
            }

            return body;
        }
        catch (TaskCanceledException)
        {
            throw new InvalidOperationException(
                $"Tiempo de espera agotado al conectar con {BaseUri.Host}. Verifique su red e intente de nuevo.");
        }
        catch (HttpRequestException ex) when (ex.InnerException is SocketException || ContainsNameResolutionError(ex))
        {
            throw new InvalidOperationException(
                $"No se pudo resolver el servidor {BaseUri.Host}. Revise la conexion a Internet, el DNS o la URL configurada.");
        }
    }

    private static bool ContainsNameResolutionError(HttpRequestException ex)
    {
        var message = ex.Message.ToLowerInvariant();
        return message.Contains("hostname nor servname provided") ||
               message.Contains("name or service not known") ||
               message.Contains("no such host is known");
    }

    private static string GetString(JsonElement element, params string[] propertyNames)
    {
        foreach (var propertyName in propertyNames)
        {
            if (element.TryGetProperty(propertyName, out var property) &&
                property.ValueKind == JsonValueKind.String)
            {
                return property.GetString() ?? "";
            }
        }

        return "";
    }

    private static string ExtractNombre(string rawMessage, string cedula)
    {
        if (string.IsNullOrWhiteSpace(rawMessage))
            return "";

        var normalized = NormalizeText(rawMessage);
        var empleadoMatch = Regex.Match(
            normalized,
            @"Marcaci[oó]n del empleado\s+(.*?)\s+con c[eé]dula",
            RegexOptions.IgnoreCase | RegexOptions.Singleline);

        if (empleadoMatch.Success)
        {
            var candidate = empleadoMatch.Groups[1].Value.Trim(' ', '-', ':');
            if (!string.IsNullOrWhiteSpace(candidate))
                return candidate;
        }

        return "";
    }

    private static string ExtractCedula(string rawMessage, string fallbackCedula)
    {
        if (string.IsNullOrWhiteSpace(rawMessage))
            return fallbackCedula;

        var normalized = NormalizeText(rawMessage);
        var cedulaMatch = Regex.Match(normalized, @"c[eé]dula\s+No\.?\s*(\d{10})", RegexOptions.IgnoreCase);
        return cedulaMatch.Success ? cedulaMatch.Groups[1].Value : fallbackCedula;
    }

    private static string BuildSuccessMessage(string tipo, string cedula, string nombre, string rawMessage)
    {
        var tipoLabel = string.Equals(tipo, "E", StringComparison.OrdinalIgnoreCase) ? "Entrada" : "Salida";
        var parts = new List<string> { tipoLabel };

        if (!string.IsNullOrWhiteSpace(cedula))
            parts.Add(cedula);
        if (!string.IsNullOrWhiteSpace(nombre))
            parts.Add(nombre);

        var message = string.Join(" - ", parts);
        var localidad = ExtractLocalidad(rawMessage);
        if (!string.IsNullOrWhiteSpace(localidad))
            message += Environment.NewLine + $"Localidad: {localidad}";

        return message;
    }

    private static string ExtractLocalidad(string rawMessage)
    {
        if (string.IsNullOrWhiteSpace(rawMessage))
            return "";

        var normalized = NormalizeText(rawMessage);
        var localidadMatch = Regex.Match(normalized, @"Localidad:\s*(.*)$", RegexOptions.IgnoreCase | RegexOptions.Singleline);
        return localidadMatch.Success ? localidadMatch.Groups[1].Value.Trim(' ', '.', ':') : "";
    }

    private static string CleanMessage(string rawMessage)
    {
        if (string.IsNullOrWhiteSpace(rawMessage))
            return "";

        return NormalizeText(rawMessage);
    }

    private static bool DetectHtmlSuccess(string htmlText)
    {
        var normalized = htmlText.ToLowerInvariant();
        return normalized.Contains("realizada de manera exitosa") ||
               normalized.Contains("marcacion del empleado");
    }

    private static string BuildHtmlErrorMessage(string htmlText)
    {
        if (string.IsNullOrWhiteSpace(htmlText))
            return "El backend devolvio HTML vacio.";

        return htmlText;
    }

    private static string NormalizeText(string value)
    {
        var withoutTags = Regex.Replace(value, "<.*?>", " ");
        var decoded = System.Net.WebUtility.HtmlDecode(withoutTags);
        var normalizedWhitespace = Regex.Replace(decoded, @"\s+", " ").Trim();
        return normalizedWhitespace;
    }
}
