using System;

namespace DogRescate.modelo
{
    public partial class Header : System.Web.UI.UserControl
    {
        // Nombre que se muestra junto a "Mi Perfil"
        protected string NombreUsuario
        {
            get { return Server.HtmlEncode(Convert.ToString(Session["usuario"])); }
        }

        // Admin va a su panel; el resto, a su perfil
        protected string UrlPerfil
        {
            get
            {
                return Convert.ToString(Session["rol"]) == "admin"
                    ? ResolveUrl("~/formAdmin.aspx")
                    : ResolveUrl("~/formUser.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Se evalúa en cada carga, para que siempre refleje la sesión actual
            bool logueado = Session["usuario"] != null;

            phInvitado.Visible = !logueado;
            phAdmin.Visible = logueado;
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Inicio.aspx");
        }
    }
}