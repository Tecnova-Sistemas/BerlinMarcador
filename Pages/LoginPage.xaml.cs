using BerlinMarcador.Services;

namespace BerlinMarcador.Pages;

public partial class LoginPage : ContentPage
{
    private readonly DatabaseService _db = new();

    public LoginPage()
    {
        InitializeComponent();
    }

    private async void OnLoginClicked(object sender, EventArgs e)
    {
        var usuario = TxtUsuario.Text?.Trim() ?? "";
        var clave = TxtClave.Text ?? "";

        if (string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(clave))
        {
            ShowError("Ingrese usuario y contrasena");
            return;
        }

        BtnLogin.IsEnabled = false;
        try
        {
            var (ok, msg) = await _db.ValidarUsuarioAsync(usuario, clave);
            if (ok)
            {
                Application.Current!.MainPage = new NavigationPage(new MarcacionPage());
            }
            else
            {
                ShowError(msg);
            }
        }
        catch (Exception ex)
        {
            ShowError("Error de conexion: " + ex.Message);
        }
        finally
        {
            BtnLogin.IsEnabled = true;
        }
    }

    private void ShowError(string msg)
    {
        LblError.Text = msg;
        LblError.IsVisible = true;
    }
}
