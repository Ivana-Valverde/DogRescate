using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace perros
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Si ya está logueado, no tiene sentido mostrar el login
            if (!IsPostBack && Session["usuario"] != null)
            {
                Response.Redirect(Convert.ToString(Session["rol"]) == "admin"
                    ? "~/formAdmin.aspx"
                    : "~/formUser.aspx");
            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            string user = txtUsuario.Text.Trim();
            string pass = txtContrasena.Text;

            if (user == "admin" && pass == "123")
            {
                Session["usuario"] = "Administrador";
                Session["email"] = "admin@dogrescate.com";
                Session["telefono"] = "";
                Session["rol"] = "admin";

                Response.Redirect("~/formAdmin.aspx");
            }
            else if (user == "usuario" && pass == "123")
            {
                Session["usuario"] = "Juan Pérez";
                Session["email"] = "usuario@email.com";
                Session["telefono"] = "+51 987654321";
                Session["rol"] = "user";

                // Si venía de adoptar a un perro, lo regresa ahí; si no, a su perfil
                string ret = Request.QueryString["returnUrl"];
                if (EsRutaLocal(ret))
                    Response.Redirect("~/" + ret.TrimStart('/'));
                else
                    Response.Redirect("~/formUser.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "err",
                    "alert('Usuario o contraseña incorrectos.');", true);
            }
        }

        // Evita que alguien use ?returnUrl=http://sitio-malo.com
        private bool EsRutaLocal(string url)
        {
            return !string.IsNullOrEmpty(url)
                && !url.Contains("://")
                && !url.StartsWith("//")
                && !url.StartsWith("\\");
        }
    }
}