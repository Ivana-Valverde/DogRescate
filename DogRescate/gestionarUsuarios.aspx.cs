using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Proyecto
{
    public partial class gestionarUsuarios : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.GridView gvUsuarios;
        protected global::System.Web.UI.WebControls.TextBox txtBuscar;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TablaUsuarios"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("FotoUrl", typeof(string));
                    dt.Columns.Add("Nombre", typeof(string));
                    dt.Columns.Add("Usuario", typeof(string));
                    dt.Columns.Add("DNI", typeof(string));
                    dt.Columns.Add("Rol", typeof(string));
                    dt.Columns.Add("FechaRegistro", typeof(string));
                    dt.Columns.Add("EsActual", typeof(bool));

                    
                    dt.Rows.Add("https://via.placeholder.com/150", "Thifany", "@teffa", "74989654", "USUARIO", "04/08/2026", false);
                    dt.Rows.Add("https://via.placeholder.com/150", "Fernanda", "@Fer", "123345678", "USUARIO", "04/08/2026", false);
                    dt.Rows.Add("https://via.placeholder.com/150", "Ana Torres", "@ana123", "45678912", "USUARIO", "04/08/2026", false);
                    dt.Rows.Add("https://via.placeholder.com/150", "Refugio Admin", "@admin", "00000000", "ADMIN", "04/08/2026", true);

                    Session["TablaUsuarios"] = dt;
                }

                CargarUsuarios();
            }
        }
        private void CargarUsuarios()
        {
            DataTable dt = (DataTable)Session["TablaUsuarios"];
            gvUsuarios.DataSource = dt;
            gvUsuarios.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["TablaUsuarios"];
            string filtro = txtBuscar.Text.Trim().ToLower();

            if (!string.IsNullOrEmpty(filtro))
            {
                var filasFiltradas = dt.AsEnumerable().Where(r =>
                    r.Field<string>("Nombre").ToLower().Contains(filtro) ||
                    r.Field<string>("Usuario").ToLower().Contains(filtro) ||
                    r.Field<string>("DNI").Contains(filtro)
                );

                if (filasFiltradas.Any())
                {
                    gvUsuarios.DataSource = filasFiltradas.CopyToDataTable();
                    gvUsuarios.DataBind();
                }
                else
                {
                    gvUsuarios.DataSource = null;
                    gvUsuarios.DataBind();
                }
            }
            else
            {
                CargarUsuarios();
            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("formAdmin.aspx");
        }
    }
}