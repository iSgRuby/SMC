﻿using Negocio;
using Negocio.Entidades;
using SistemaMenuCafeteria.InterfacesDeUsuario;
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
        MenuDelDia _menuDelDia = new MenuDelDia();
        Subcategoria _subcategoria = new Subcategoria();
        Categoria _categoria = new Categoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargaGrid();
                PreLoadMenusDelDia();
                PreLoadDropDowns();
            }
        }

        private void CargaGrid()
        {
            gvProductos.DataSource = _producto.GetListaVwProductos();
            gvProductos.DataBind();
        }

        private void PreLoadMenusDelDia()
        {
            List<clsMENUS_DEL_DIA> listaMenus = _menuDelDia.GetListaMenu();
            txtNombreMenuDelDia1.Text = listaMenus[0].Descripcion;
            txtPrecioMenuDelDia1.Text = listaMenus[0].Precio.ToString();

            txtNombreMenuDelDia2.Text = listaMenus[1].Descripcion;
            txtPrecioMenuDelDia2.Text = listaMenus[1].Precio.ToString();
        }
        private void PreLoadDropDowns()
        {
            ddlSubcategoriaProducto.Items.Insert(0, new ListItem("-Subcategoria-", "-1"));

            ddlCategoriaProducto.DataSource = _categoria.GetListaCategorias();
            ddlCategoriaProducto.DataValueField = "Id_Categoria";
            ddlCategoriaProducto.DataTextField = "Nombre_Categoria";
            ddlCategoriaProducto.DataBind();
            ddlCategoriaProducto.Items.Insert(0, new ListItem("-Categoria-", "-1"));

        }
        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            if (ddlSubcategoriaProducto.SelectedValue != "-1" && ddlCategoriaProducto.SelectedValue != "-1")
            {
                _producto.AgregarProducto(
                    new clsPRODUCTOS()
                    {
                        Id_Producto = 0,
                        Nombre = txtNombreProducto.Text,
                        Descripcion = txtDescripcionProducto.Text,
                        Disponibilidad = true,
                        Id_Subcategoria = int.Parse(ddlSubcategoriaProducto.SelectedValue),
                        Precio = decimal.Parse(txtPrecioProducto.Text)
                    }
                 );
            }
        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblIdProducto = gvProductos.Rows[e.RowIndex].FindControl("lblIdProducto") as Label;
            clsPRODUCTOS productoAEliminar = _producto.GetProducto(int.Parse(lblIdProducto.Text));

            _producto.EliminarProducto(productoAEliminar);
            Response.Redirect("~/Modulos/iuAdministrador.aspx");
        }

        protected void gvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim().ToLower();
            List<clsVw_Productos> productos = _producto.GetListaVwProductos();
            List<clsVw_Productos> filteredProductos = productos
                .Where(p => p.Nombre.ToLower().Contains(searchTerm))
                .ToList();

            gvProductos.DataSource = filteredProductos;
            gvProductos.DataBind();
        }

        protected void btnEstado_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int productId = int.Parse(btn.CommandArgument);

            List<clsPRODUCTOS> productos = _producto.GetListaProductos();
            clsPRODUCTOS producto = productos.FirstOrDefault(p => p.Id_Producto == productId);
            if (producto != null)
            {
                producto.Disponibilidad = !producto.Disponibilidad;
                _producto.ActualizarEstado(producto);
            }

            gvProductos.DataSource = _producto.GetListaVwProductos();
            gvProductos.DataBind();


            Response.Redirect("/Modulos/iuAdministrador.aspx");
        }

        protected void btnActualizarMenu1_Click(object sender, EventArgs e)
        {
            clsMENUS_DEL_DIA newMenu = new clsMENUS_DEL_DIA()
            {
                Menu_ID = 1,
                Descripcion = txtNombreMenuDelDia1.Text,
                Precio = decimal.Parse(txtPrecioMenuDelDia1.Text)
            };

            _menuDelDia.ActualizarMenu(newMenu);
        }
        protected void btnActualizarMenu2_Click(object sender, EventArgs e)
        {
            clsMENUS_DEL_DIA newMenu = new clsMENUS_DEL_DIA()
            {
                Menu_ID = 2,
                Descripcion = txtNombreMenuDelDia2.Text,
                Precio = decimal.Parse(txtPrecioMenuDelDia2.Text)
            };
            _menuDelDia.ActualizarMenu(newMenu);
        }

        protected void ddlCategoriaProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoriaProducto.SelectedValue != "-1")
            {
                ddlSubcategoriaProducto.DataSource = _subcategoria.GetListaSubcategoriasByIdCategoria(int.Parse(ddlCategoriaProducto.SelectedValue));
                ddlSubcategoriaProducto.DataValueField = "Id_Subcategoria";
                ddlSubcategoriaProducto.DataTextField = "Nombre_Subcategoria";
                ddlSubcategoriaProducto.DataBind();
                ddlSubcategoriaProducto.Items.Insert(0, new ListItem("-Subcategoria-", "-1"));

                ddlSubcategoriaProducto.Enabled = true;
            }
            else
            {
                ddlSubcategoriaProducto.SelectedValue = "-1";
                ddlSubcategoriaProducto.Enabled = false;
            }
        }
    }
}