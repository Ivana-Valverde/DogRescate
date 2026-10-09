using System;
using System.IO;
using System.Web.Services;

namespace perros
{
    public partial class formUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Debe estar logueado
            if (Session["usuario"] == null)
            {
                Response.Redirect("~/Login.aspx?returnUrl=formUser.aspx");
                return;
            }

            var s = Session["Solicitud"] as Solicitud;
            pnlSeguimiento.Visible = (s != null);
            pnlSinSolicitud.Visible = (s == null);

            // Sin solicitud: mostrar la lista de mascotas para elegir
            if (s == null)
            {
                rptElegir.DataSource = CatalogoPerros.Todos();
                rptElegir.DataBind();
                lblSubtitulo.Text = (s != null)
            ? "Este es el estado actual de tu proceso de adopción."
            : "Aún no tienes ninguna solicitud en curso.";
            }

            if (!IsPostBack)
            {
                lblNombreUsuario.Text = Convert.ToString(Session["usuario"]);
                txtEmail.Text = Convert.ToString(Session["email"]);
                txtTelefono.Text = Convert.ToString(Session["telefono"]);
                txtDireccion.Text = Convert.ToString(Session["direccion"]);

                if (s != null)
                {
                    lblMascotaSolicitud.Text = s.Mascota;
                    lblIdSolicitud.Text = s.Id;
                    lblFechaSolicitud.Text = s.Fecha.ToString("dd/MM/yyyy");
                }
            }

            // Si ya había verificado su rostro, pinta los pasos completados
            if (Session["IdentidadVerificada"] != null && (bool)Session["IdentidadVerificada"])
            {
                ClientScript.RegisterStartupScript(GetType(), "ver", "aplicarVerificado();", true);
            }
        }

        // Llamado desde JavaScript al completar el escaneo
        [WebMethod(EnableSession = true)]
        public static void MarcarVerificado()
        {
            System.Web.HttpContext.Current.Session["IdentidadVerificada"] = true;
        }

        protected void btnGuardarDatos_Click(object sender, EventArgs e)
        {
            Session["email"] = txtEmail.Text.Trim();
            Session["telefono"] = txtTelefono.Text.Trim();
            Session["direccion"] = txtDireccion.Text.Trim();
            Aviso("Tus datos se guardaron correctamente.");
        }

        protected void btnCancelarSolicitud_Click(object sender, EventArgs e)
        {
            Session.Remove("Solicitud");
            Response.Redirect("~/formUser.aspx");
        }

        protected void btnRegistrarMascota_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombreMascota.Text))
            {
                Aviso("Escribe el nombre del perrito.");
                return;
            }

            // Foto (opcional)
            string rutaFoto = "img/perro golden.jpg"; // imagen por defecto si no suben una
            if (fileFotoMascota.HasFile)
            {
                string ext = Path.GetExtension(fileFotoMascota.FileName).ToLowerInvariant();
                if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".webp")
                {
                    Aviso("La foto debe ser JPG, PNG o WEBP.");
                    return;
                }

                string carpeta = Server.MapPath("~/img/mascotas/");
                Directory.CreateDirectory(carpeta);

                string nombreArchivo = Guid.NewGuid().ToString("N") + ext;
                fileFotoMascota.SaveAs(Path.Combine(carpeta, nombreArchivo));
                rutaFoto = "img/mascotas/" + nombreArchivo;
            }

            CatalogoPerros.Agregar(new Perro
            {
                Nombre = txtNombreMascota.Text.Trim(),
                Raza = txtRazaMascota.Text.Trim(),
                Edad = txtEdadMascota.Text.Trim(),
                Tamano = ddlTamanoMascota.SelectedValue,
                Genero = ddlGeneroMascota.SelectedValue,
                Descripcion = txtDescripcionMascota.Text.Trim(),
                Foto = rutaFoto
            });

            txtNombreMascota.Text = txtRazaMascota.Text = txtEdadMascota.Text = txtDescripcionMascota.Text = "";

            // Refresca la lista de "Elige a quién adoptar" si está visible
            if (pnlSinSolicitud.Visible)
            {
                rptElegir.DataSource = CatalogoPerros.Todos();
                rptElegir.DataBind();
            }

            Aviso("¡Mascota publicada! Ya forma parte del catálogo.");
        }

        private void Aviso(string mensaje)
        {
            string js = "alert('" + mensaje.Replace("'", "\\'") + "');";
            ClientScript.RegisterStartupScript(GetType(), "aviso", js, true);
        }
    }
}