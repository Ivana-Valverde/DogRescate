using System;
using System.IO;
using System.Web.Hosting;
using System.Web.Services;

namespace DogRescate
{
    public partial class capturaRostro : System.Web.UI.Page
    {
        [WebMethod]
        public static object GuardarBiometria(string fotoBase64, string vectorJson)
        {
            try
            {
                string ruta = HostingEnvironment.MapPath("~/capturas/");
                Directory.CreateDirectory(ruta); 
                string id = DateTime.Now.Ticks.ToString();
                string base64Limpio = fotoBase64.Substring(fotoBase64.IndexOf(',') + 1);
                byte[] bytesImagen = Convert.FromBase64String(base64Limpio);
                File.WriteAllBytes(Path.Combine(ruta, $"foto_{id}.jpg"), bytesImagen);
                File.WriteAllText(Path.Combine(ruta, $"vector_{id}.json"), vectorJson);

                return new { exito = true };
            }
            catch (Exception ex)
            {
                return new { exito = false, mensaje = ex.Message };
            }
        }
    }
}