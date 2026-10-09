using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Proyecto
{
    public partial class gestionarSolicitudes : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.GridView gvSolicitudes;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TablaSolicitudes"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("Codigo", typeof(string));
                    dt.Columns.Add("NombreAdoptante", typeof(string));
                    dt.Columns.Add("UsuarioAdoptante", typeof(string));
                    dt.Columns.Add("DNI", typeof(string));
                    dt.Columns.Add("NombreMascota", typeof(string));
                    dt.Columns.Add("Vivienda", typeof(string));
                    dt.Columns.Add("HorasSolo", typeof(string));
                    dt.Columns.Add("Identidad", typeof(bool));
                    dt.Columns.Add("Contrato", typeof(bool));
                    dt.Columns.Add("Estado", typeof(string));
                    dt.Columns.Add("Fecha", typeof(string));
                    dt.Columns.Add("Acciones", typeof(string));

                    
                    dt.Rows.Add("#AD-0009", "Thifany", "@teffa", "74989654", "Coco", "Casa", "10h", false, false, "Pendiente de Escaneo", "04/08/2026 21:45", "—");
                    dt.Rows.Add("#AD-0008", "Fernanda", "@Fer", "123345678", "Lola", "Casa", "2h", true, true, "Aprobado", "04/08/2026 20:22", "—");
                    dt.Rows.Add("#AD-0001", "Ana Torres", "@ana123", "45678912", "Rex", "Casa", "4h", true, false, "Verificado", "04/08/2026 17:34", "Falta firmar contrato");

                    Session["TablaSolicitudes"] = dt;
                }

                CargarSolicitudes();
            }
        }
        private void CargarSolicitudes()
        {
            DataTable dt = (DataTable)Session["TablaSolicitudes"];
            gvSolicitudes.DataSource = dt;
            gvSolicitudes.DataBind();
        }

        public string GetCssEstado(string estado)
        {
            switch (estado)
            {
                case "Pendiente de Escaneo":
                    return "badge-estado badge-pendiente";
                case "Aprobado":
                    return "badge-estado badge-aprobado";
                case "Verificado":
                    return "badge-estado badge-verificado";
                default:
                    return "badge-estado";
            }
        }

     
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("formAdmin.aspx");
        }
    }
}