using Negocio;
using Negocio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaMenuCafeteria.Modulos
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       Producto _producto = new Producto();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargaGrid();
            }
        }

        private void CargaGrid()
        {
            gvProductos.DataSource = _producto.GetListaProductos();
            gvProductos.DataBind();
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {

        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}