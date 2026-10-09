using System;

namespace DogRescate
{
    public partial class FormularioAdopcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Debe haber iniciado sesión
            if (Session["usuario"] == null)
            {
                Response.Redirect("~/Login.aspx?returnUrl=" + Server.UrlEncode("FormularioAdopcion.aspx" + Request.Url.Query));
                return;
            }

            // 2. Solo una solicitud activa a la vez
            if (Session["Solicitud"] != null)
            {
                Response.Redirect("~/formUser.aspx");
                return;
            }

            if (IsPostBack) return;

            // 3. Perro elegido
            int id;
            Perro perro = int.TryParse(Request.QueryString["id"], out id) ? CatalogoPerros.Buscar(id) : null;

            if (perro == null)
            {
                Response.Redirect("~/Mascotas.aspx");
                return;
            }

            ViewState["perroId"] = perro.Id;
            lblNombrePerro.Text = perro.Nombre;
            lblIdPerro.Text = perro.Id.ToString("00");
            imgPerro.ImageUrl = "~/" + perro.Foto;
            imgPerro.AlternateText = perro.Nombre;

            // 4. Datos del solicitante (vienen del login / perfil)
            txtNombreUsuario.Text = Convert.ToString(Session["usuario"]);
            txtEmailUsuario.Text = Convert.ToString(Session["email"]);
            txtTelefonoUsuario.Text = Convert.ToString(Session["telefono"]);

            bool verificado = Session["IdentidadVerificada"] != null && (bool)Session["IdentidadVerificada"];
            txtEstadoFacial.Text = verificado ? "Verificado" : "Pendiente";
        }

        protected void btnEnviarSolicitud_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtMotivo.Text))
            {
                lblError.Text = "Cuéntanos por qué quieres adoptar a este perrito antes de enviar la solicitud.";
                lblError.Visible = true;
                return;
            }

            int perroId = (int)ViewState["perroId"];
            Perro perro = CatalogoPerros.Buscar(perroId);

            Session["Solicitud"] = new Solicitud
            {
                Id = "#AD-" + perroId.ToString("0000"),
                PerroId = perroId,
                Mascota = perro.Nombre,
                Fecha = DateTime.Now,
                Vivienda = ddlTipoVivienda.SelectedValue,
                OtrasMascotas = ddlOtrasMascotas.SelectedValue,
                Motivo = txtMotivo.Text.Trim()
            };

            Response.Redirect("~/formUser.aspx");
        }
    }
}