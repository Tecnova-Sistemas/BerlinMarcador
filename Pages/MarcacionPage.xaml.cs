using BerlinMarcador.Services;

namespace BerlinMarcador.Pages;

public partial class MarcacionPage : ContentPage
{
    private readonly ApiService _api = new();
    private string _tipo = "E";
    private bool _busy;

    public MarcacionPage()
    {
        InitializeComponent();
        UpdateModeButtons();
        LblDebug.Text = "Modo diagnostico activo. Esperando intento de marcacion...";
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        TxtCedula.Focus();
    }

    private void OnEntradaClicked(object sender, EventArgs e)
    {
        _tipo = "E";
        UpdateModeButtons();
        TxtCedula.Text = "";
        TxtCedula.Focus();
    }

    private void OnSalidaClicked(object sender, EventArgs e)
    {
        _tipo = "S";
        UpdateModeButtons();
        TxtCedula.Text = "";
        TxtCedula.Focus();
    }

    private void UpdateModeButtons()
    {
        if (_tipo == "E")
        {
            BtnEntrada.BackgroundColor = Color.FromArgb("#198754");
            BtnEntrada.TextColor = Colors.White;
            BtnEntrada.BorderColor = Color.FromArgb("#146c43");
            BtnSalida.BackgroundColor = Colors.White;
            BtnSalida.TextColor = Color.FromArgb("#6c757d");
            BtnSalida.BorderColor = Color.FromArgb("#ced4da");
        }
        else
        {
            BtnSalida.BackgroundColor = Color.FromArgb("#dc3545");
            BtnSalida.TextColor = Colors.White;
            BtnSalida.BorderColor = Color.FromArgb("#b02a37");
            BtnEntrada.BackgroundColor = Colors.White;
            BtnEntrada.TextColor = Color.FromArgb("#6c757d");
            BtnEntrada.BorderColor = Color.FromArgb("#ced4da");
        }
    }

    private void OnCedulaTextChanged(object sender, TextChangedEventArgs e)
    {
        if (TxtCedula.Text?.Length == 10)
        {
            _ = DoMarcar(TxtCedula.Text);
        }
    }

    private async void OnMarcarClicked(object sender, EventArgs e)
    {
        var ced = TxtCedula.Text?.Trim() ?? "";
        if (ced.Length > 0)
            await DoMarcar(ced);
    }

    private void OnLimpiarClicked(object sender, EventArgs e)
    {
        TxtCedula.Text = "";
        TxtCedula.Focus();
    }

    private async Task DoMarcar(string cedula)
    {
        if (_busy) return;

        if (!ValidarCedula(cedula))
        {
            ShowResult(new MarcacionResponse(false, $"Cedula {cedula} no valida", "", cedula, "Validacion local: la cedula no paso la regla del digito verificador."));
            TxtCedula.Text = "";
            TxtCedula.Focus();
            return;
        }

        LblDebug.Text = $"Enviando solicitud al backend. Cedula: {cedula}, Tipo: {_tipo}";
        FrameDebug.IsVisible = true;
        _busy = true;

        try
        {
            var result = await _api.MarcarAsync(cedula, _tipo);
            ShowResult(result);
        }
        catch (Exception ex)
        {
            ShowResult(new MarcacionResponse(false, "Error de conexion: " + ex.Message, "", cedula, ex.ToString()));
        }
        finally
        {
            _busy = false;
            TxtCedula.Text = "";
            TxtCedula.Focus();
        }
    }

    private void ShowResult(MarcacionResponse result)
    {
        LblResult.Text = result.Msg;
        LblResult.TextColor = result.Status ? Color.FromArgb("#0f5132") : Color.FromArgb("#842029");
        FrameResult.BackgroundColor = result.Status ? Color.FromArgb("#d1e7dd") : Color.FromArgb("#f8d7da");
        FrameResult.BorderColor = result.Status ? Color.FromArgb("#badbcc") : Color.FromArgb("#f5c2c7");
        FrameResult.IsVisible = true;

        var shouldShowEmployee = ShouldShowEmployeeData(result.Msg);
        var cedula = string.IsNullOrWhiteSpace(result.Cedula) ? TxtCedula.Text?.Trim() ?? "" : result.Cedula.Trim();
        var nombre = result.Nombre.Trim();

        if (shouldShowEmployee && (!string.IsNullOrWhiteSpace(nombre) || !string.IsNullOrWhiteSpace(cedula)))
        {
            var parts = new List<string>();
            if (!string.IsNullOrWhiteSpace(nombre))
                parts.Add(nombre);
            if (!string.IsNullOrWhiteSpace(cedula))
                parts.Add($"CI: {cedula}");

            LblNombre.Text = string.Join(" - ", parts);
            LblNombre.IsVisible = true;
        }
        else
        {
            LblNombre.Text = "";
            LblNombre.IsVisible = false;
        }

        LblDebug.Text = string.IsNullOrWhiteSpace(result.RawResponse) ? "Sin detalle adicional" : result.RawResponse;
        FrameDebug.IsVisible = true;
    }

    private static bool ShouldShowEmployeeData(string msg)
    {
        var normalized = msg.ToLowerInvariant();

        return normalized.Contains("no existe una marcacion de entrada") ||
               normalized.Contains("no existe una marcacion de salida") ||
               normalized.Contains("ya hay una entrada") ||
               normalized.Contains("ya hay una salida");
    }

    private static bool ValidarCedula(string id)
    {
        if (id.Length != 10 || !id.All(char.IsDigit))
            return false;

        var provincia = int.Parse(id[..2]);
        if (!((provincia >= 1 && provincia <= 24) || provincia == 30))
            return false;

        var suma = 0;
        for (var i = 0; i < 9; i++)
        {
            var digito = id[i] - '0';
            if (i % 2 == 0)
            {
                digito *= 2;
                if (digito > 9)
                    digito -= 9;
            }

            suma += digito;
        }

        var residuo = suma % 10;
        var verificador = residuo == 0 ? 0 : 10 - residuo;
        return (id[9] - '0') == verificador;
    }

    private void OnLogoutTapped(object sender, TappedEventArgs e)
    {
        Application.Current!.MainPage = new NavigationPage(new LoginPage());
    }
}
