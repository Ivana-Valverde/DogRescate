using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto
{
    public partial class formAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
               

        protected void btnGestionarUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("gestionarUsuarios.aspx");
        }

        protected void btnGestionarSolicitudes_Click(object sender, EventArgs e)
        {
            Response.Redirect("gestionarSolicitudes.aspx");
        }

        protected void btnRegistrarMascota_Click(object sender, EventArgs e)
        {
            Response.Redirect("registrarMascota.aspx");
        }
    }
}