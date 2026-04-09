using System.Text.Json;

namespace BerlinMarcador.Services;

public class ApiService
{
    private const string BaseUrl = "https://webapps.boschecuador.com/berlinMarcador/";
    private readonly HttpClient _http;

    public ApiService()
    {
        var handler = new SocketsHttpHandler
        {
            SslOptions = new System.Net.Security.SslClientAuthenticationOptions
            {
                RemoteCertificateValidationCallback = (_, _, _, _) => true
            }
        };
        _http = new HttpClient(handler) { Timeout = TimeSpan.FromSeconds(10) };
    }

    public async Task<(bool ok, string msg)> LoginAsync(string usuario, string clave)
    {
        var form = new FormUrlEncodedContent(new[]
        {
            new KeyValuePair<string, string>("user", usuario),
            new KeyValuePair<string, string>("pass", clave),
        });

        var resp = await _http.PostAsync(BaseUrl + "api_login.php", form);
        var json = await resp.Content.ReadAsStringAsync();
        var doc = JsonDocument.Parse(json);

        var ok = doc.RootElement.GetProperty("ok").GetBoolean();
        var msg = doc.RootElement.GetProperty("msg").GetString() ?? "";
        return (ok, msg);
    }

    public async Task<(bool status, string msg)> MarcarAsync(string cedula, string tipo)
    {
        var form = new FormUrlEncodedContent(new[]
        {
            new KeyValuePair<string, string>("cedula", cedula),
            new KeyValuePair<string, string>("tipo", tipo),
        });

        var resp = await _http.PostAsync(BaseUrl + "api_marcar.php", form);
        var json = await resp.Content.ReadAsStringAsync();
        var doc = JsonDocument.Parse(json);

        var status = doc.RootElement.GetProperty("status").GetBoolean();
        var msg = doc.RootElement.GetProperty("msg").GetString() ?? "";
        return (status, msg);
    }
}
