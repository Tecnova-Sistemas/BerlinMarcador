using Microsoft.Data.SqlClient;

namespace BerlinMarcador.Services;

public class DatabaseService
{
    private const string ConnectionString =
        "Server=192.168.1.150,1433;Database=Garita;User Id=Garita;Password=garitaBerliN1;TrustServerCertificate=True;Connect Timeout=5;";

    private SqlConnection GetConnection() => new(ConnectionString);

    public async Task<(bool ok, string nombre)> ValidarUsuarioAsync(string usuario, string clave)
    {
        await using var conn = GetConnection();
        await conn.OpenAsync();

        await using var cmd = new SqlCommand(
            "SELECT usu_codigo, usu_descripcion, usu_clave, usu_clave_hash FROM usuario WHERE usu_descripcion = @u", conn);
        cmd.Parameters.AddWithValue("@u", usuario);

        await using var reader = await cmd.ExecuteReaderAsync();
        if (!await reader.ReadAsync())
            return (false, "Usuario no encontrado");

        var hash = (reader["usu_clave_hash"]?.ToString() ?? "").Trim();
        var stored = (reader["usu_clave"]?.ToString() ?? "").Trim();
        var nombre = (reader["usu_descripcion"]?.ToString() ?? "").Trim();

        bool valid;
        if (hash.Length > 0)
        {
            valid = BCrypt.Net.BCrypt.Verify(clave, hash);
        }
        else
        {
            valid = stored == clave;
            if (!valid)
            {
                try { valid = BCrypt.Net.BCrypt.Verify(clave, stored); } catch { }
            }
        }

        return valid ? (true, nombre) : (false, "Contrasena incorrecta");
    }

    public async Task<(bool status, string msg)> MarcarAsync(string cedula, string tipo)
    {
        await using var conn = GetConnection();
        await conn.OpenAsync();

        // Check employee exists
        await using var cmdCheck = new SqlCommand(
            "SELECT codigo, CONCAT(apellidos, ' ', nombres) as empleado FROM empleados WHERE cedula = @c AND activo = 1", conn);
        cmdCheck.Parameters.AddWithValue("@c", cedula);

        await using var rdr = await cmdCheck.ExecuteReaderAsync();
        if (!await rdr.ReadAsync())
            return (false, "No existe ningun empleado con la cedula ingresada.");

        var empleadoID = rdr.GetInt32(0);
        var nombre = rdr.GetString(1).Trim();
        await rdr.CloseAsync();

        var now = DateTime.Now;
        var fecha = now.ToString("yyyy-MM-dd");
        var hora = now.ToString("HH:mm:ss");
        var dt = now.ToString("yyyy-MM-dd HH:mm:ss");

        if (tipo == "E")
        {
            // Check not already in
            await using var cmdIn = new SqlCommand(
                "SELECT TOP 1 fecha_marcacion_entrada FROM empleado_marcaciones WHERE empleado = @e AND fecha_marcacion_entrada >= @f AND fecha_marcacion_salida IS NULL", conn);
            cmdIn.Parameters.AddWithValue("@e", empleadoID);
            cmdIn.Parameters.AddWithValue("@f", fecha);

            var exists = await cmdIn.ExecuteScalarAsync();
            if (exists != null)
                return (false, "Ya existe una marcacion de entrada en el presente dia.");

            await using var cmdIns = new SqlCommand(
                "INSERT INTO empleado_marcaciones (empleado, created_date_time, fecha_marcacion_entrada, hora_marcacion_entrada, vigente) VALUES (@e, @dt, @f, @h, 1)", conn);
            cmdIns.Parameters.AddWithValue("@e", empleadoID);
            cmdIns.Parameters.AddWithValue("@dt", dt);
            cmdIns.Parameters.AddWithValue("@f", fecha);
            cmdIns.Parameters.AddWithValue("@h", hora);

            var rows = await cmdIns.ExecuteNonQueryAsync();
            return rows > 0
                ? (true, $"Entrada - {cedula} - {nombre}")
                : (false, "Error al realizar la marcacion.");
        }

        if (tipo == "S")
        {
            // Find open entry
            await using var cmdOpen = new SqlCommand(
                "SELECT TOP 1 empleado FROM empleado_marcaciones WHERE empleado = @e AND fecha_marcacion_salida IS NULL AND hora_marcacion_salida IS NULL AND mar_estado = 'A' ORDER BY created_date_time DESC", conn);
            cmdOpen.Parameters.AddWithValue("@e", empleadoID);

            var hasOpen = await cmdOpen.ExecuteScalarAsync();
            if (hasOpen == null)
                return (false, "No existe una marcacion de entrada abierta para registrar salida.");

            // Update exit
            await using var cmdUpd = new SqlCommand(
                "WITH EM AS (SELECT TOP 1 * FROM empleado_marcaciones WHERE empleado = @e AND fecha_marcacion_salida IS NULL AND hora_marcacion_salida IS NULL ORDER BY created_date_time DESC) UPDATE EM SET fecha_marcacion_salida = @f, hora_marcacion_salida = @h, mar_estado = 'C'", conn);
            cmdUpd.Parameters.AddWithValue("@e", empleadoID);
            cmdUpd.Parameters.AddWithValue("@f", fecha);
            cmdUpd.Parameters.AddWithValue("@h", hora);
            await cmdUpd.ExecuteNonQueryAsync();

            // Mark stale
            await using var cmdStale = new SqlCommand(
                "WITH EM AS (SELECT TOP 5 * FROM empleado_marcaciones WHERE empleado = @e AND mar_estado = 'A' AND fecha_marcacion_salida IS NULL AND hora_marcacion_salida IS NULL ORDER BY created_date_time DESC) UPDATE EM SET mar_estado = 'F'", conn);
            cmdStale.Parameters.AddWithValue("@e", empleadoID);
            await cmdStale.ExecuteNonQueryAsync();

            return (true, $"Salida - {cedula} - {nombre}");
        }

        return (false, "Tipo de marcacion invalido.");
    }
}
