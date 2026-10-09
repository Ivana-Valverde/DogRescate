using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Hosting;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace DogRescate
{
    public partial class validacionRostro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod(EnableSession = true)]
        public static object ObtenerVectores()
        {
            var lista = new List<object>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                string ruta = HostingEnvironment.MapPath("~/capturas/");

                if (Directory.Exists(ruta))
                {
                    string[] archivos = Directory.GetFiles(ruta, "vector_*.json");

                    foreach (string archivo in archivos)
                    {
                        string json = File.ReadAllText(archivo);
                        float[] vector = js.Deserialize<float[]>(json);
                        string nombre = Path.GetFileNameWithoutExtension(archivo);

                        if (vector != null && vector.Length == 128)
                        {
                            lista.Add(new { nombre = nombre, vector = vector });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }

            return lista;
        }

        [WebMethod(EnableSession = true)]
        public static object ProcesarVerificacion(string usuarioDetectado)
        {
            if (string.IsNullOrEmpty(usuarioDetectado) || usuarioDetectado.ToLower() == "unknown")
            {
                return new { ok = false, error = "Rostro no reconocido" };
            }

            HttpContext.Current.Session["rostroValidado"] = true;
            HttpContext.Current.Session["usuarioVerificado"] = usuarioDetectado;

            return new { ok = true, error = "" };
        }
    }
}