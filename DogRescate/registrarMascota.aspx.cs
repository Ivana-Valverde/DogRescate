using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Proyecto
{
    public partial class registrarMascota : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["TablaMascotas"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("ID", typeof(int));
                    dt.Columns.Add("FotoUrl", typeof(string));
                    dt.Columns.Add("Nombre", typeof(string));
                    dt.Columns.Add("Raza", typeof(string));
                    dt.Columns.Add("Edad", typeof(string));
                    dt.Columns.Add("Tamaño", typeof(string));
                    dt.Columns.Add("Energia", typeof(string));
                    dt.Columns.Add("Estado", typeof(string));

                   
                    dt.Rows.Add(1, "https://via.placeholder.com/150", "Luna", "Mestiza", "5", "Mediano", "Bajo", "Disponible");
                    dt.Rows.Add(2, "https://via.placeholder.com/150", "Rex", "Pastor Alemán", "3", "Grande", "Alto", "En Proceso");

                    Session["TablaMascotas"] = dt;
                }

                CargarTabla();
            }
        }
        private void CargarTabla()
        {
            DataTable dt = (DataTable)Session["TablaMascotas"];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            Response.Redirect("formAdmin.aspx");
            
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["TablaMascotas"];

            int nuevoID = dt.Rows.Count > 0 ? Convert.ToInt32(dt.Compute("MAX(ID)", string.Empty)) + 1 : 1;
            string foto = string.IsNullOrWhiteSpace(txtURL.Text) ? "https://via.placeholder.com/150" : txtURL.Text;

            dt.Rows.Add(nuevoID, foto, txtNombre.Text, txtRaza.Text, txtEdad.Text, ddlTamaño.SelectedValue, ddlNivel.SelectedValue, "Disponible");

            Session["TablaMascotas"] = dt;
            CargarTabla();
            LimpiarCampos();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtID.Text, out int id))
            {
                DataTable dt = (DataTable)Session["TablaMascotas"];
                DataRow row = dt.AsEnumerable().FirstOrDefault(r => r.Field<int>("ID") == id);

                if (row != null)
                {
                    row["Nombre"] = txtNombre.Text;
                    row["Raza"] = txtRaza.Text;
                    row["Edad"] = txtEdad.Text;
                    row["Tamaño"] = ddlTamaño.SelectedValue;
                    row["Energia"] = ddlNivel.SelectedValue;
                    if (!string.IsNullOrWhiteSpace(txtURL.Text))
                    {
                        row["FotoUrl"] = txtURL.Text;
                    }

                    Session["TablaMascotas"] = dt;
                    CargarTabla();
                    LimpiarCampos();
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtID.Text, out int id))
            {
                DataTable dt = (DataTable)Session["TablaMascotas"];
                DataRow row = dt.AsEnumerable().FirstOrDefault(r => r.Field<int>("ID") == id);

                if (row != null)
                {
                    dt.Rows.Remove(row);
                    Session["TablaMascotas"] = dt;
                    CargarTabla();
                    LimpiarCampos();
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["TablaMascotas"];
            string busqueda = txtBusqueda.Text.Trim().ToLower();

            if (!string.IsNullOrEmpty(busqueda))
            {
                var resultados = dt.AsEnumerable().Where(r =>
                    r.Field<int>("ID").ToString() == busqueda ||
                    r.Field<string>("Nombre").ToLower().Contains(busqueda)
                );

                if (resultados.Any())
                {
                    GridView1.DataSource = resultados.CopyToDataTable();
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
            }
            else
            {
                CargarTabla();
            }
        }
        private void LimpiarCampos()
        {
            txtID.Text = "";
            txtNombre.Text = "";
            txtRaza.Text = "";
            txtEdad.Text = "";
            txtDescripcion.Text = "";
            txtURL.Text = "";
            txtBusqueda.Text = "";
            ddlTamaño.SelectedIndex = 0;
            ddlNivel.SelectedIndex = 0;
            CargarTabla();
        }
    }
}