using BerlinMarcador.Services;

namespace BerlinMarcador.Pages;

public partial class MarcacionPage : ContentPage
{
    private readonly DatabaseService _db = new();
    private string _tipo = "E";
    private bool _busy;

    public MarcacionPage()
    {
        InitializeComponent();
        UpdateModeButtons();
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
        _busy = true;

        try
        {
            var (status, msg) = await _db.MarcarAsync(cedula, _tipo);
            ShowResult(msg, status);
        }
        catch (Exception ex)
        {
            ShowResult("Error de conexion: " + ex.Message, false);
        }
        finally
        {
            _busy = false;
            TxtCedula.Text = "";
            TxtCedula.Focus();
        }
    }

    private void ShowResult(string msg, bool ok)
    {
        LblResult.Text = msg;
        LblResult.TextColor = ok ? Color.FromArgb("#0f5132") : Color.FromArgb("#842029");
        FrameResult.BackgroundColor = ok ? Color.FromArgb("#d1e7dd") : Color.FromArgb("#f8d7da");
        FrameResult.BorderColor = ok ? Color.FromArgb("#badbcc") : Color.FromArgb("#f5c2c7");
        FrameResult.IsVisible = true;
    }

    private void OnLogoutTapped(object sender, TappedEventArgs e)
    {
        Application.Current!.MainPage = new NavigationPage(new LoginPage());
    }
}
