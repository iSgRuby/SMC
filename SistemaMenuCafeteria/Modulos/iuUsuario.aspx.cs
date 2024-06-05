using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Negocio;
using Negocio.Entidades;

namespace SistemaMenuCafeteria.InterfacesDeUsuario
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        private MenuDelDia _objMenuDelDia = new MenuDelDia();
        private Categoria _objCategoria = new Categoria();
        private Subcategoria _objSubcategoria = new Subcategoria();
        private Producto _objProducto = new Producto();
        private static readonly Random random = new Random();


        private List<Category> Categories
        {
            get { return (List<Category>)ViewState["Categories"]; }
            set { ViewState["Categories"] = value; }
        }

        private int CurrentPage
        {
            get { return (int)(ViewState["CurrentPage"] ?? 0); }
            set { ViewState["CurrentPage"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<clsCATEGORIAS> listaCategorias = _objCategoria.GetListaCategorias();
                Categories = GetCategorias(listaCategorias);
                rptCategories.DataSource = listaCategorias;
                rptCategories.DataBind();

                BindCategories();
                BindMenusDelDia();
            }
        }

        private bool RightScrollEnabled
        {
            get { return (bool)(ViewState["RightScrollEnabled"] ?? true); }
            set { ViewState["RightScrollEnabled"] = value; }
        }

        protected void FlechaDerBarra_Click(object sender, EventArgs e)
        {
            if (!RightScrollEnabled)
            {
                // No hacer nada si el desplazamiento a la derecha ya está deshabilitado
                return;
            }

            // Permitir el desplazamiento hacia la derecha solo si CurrentPage es 0
            if (CurrentPage + 1 >= ((_objCategoria.GetListaCategorias().Count() + 1) / 3) - 1)
            {
                CurrentPage++;
                RightScrollEnabled = false;
                BindCategories();
            }
            else
            {
                CurrentPage++;
                BindCategories();
            }
        }

        protected void FlechaIzqBarra_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 0)
            {
                CurrentPage--;
                RightScrollEnabled = true; // Habilitar el desplazamiento hacia la derecha nuevamente si regresas a la izquierda
                BindCategories();
            }
        }

        protected void Categoria_Click(object sender, EventArgs e)
        {
            var button = (LinkButton)sender;
            var category = Categories.Find(c => c.Text == button.Text);
            if (category != null)
            {
                // Redirigir a la URL de la categoría
                Response.Redirect(category.NavigateUrl);
            }
        }


        private void BindMenusDelDia()
        {
            List<clsMENUS_DEL_DIA> listaMenus = _objMenuDelDia.GetListaMenu();
            MenuDelDia1.Text = listaMenus[0].Descripcion;
            precioMenuDelDia1.Text = listaMenus[0].Precio.ToString();

            MenuDelDia2.Text = listaMenus[1].Descripcion;
            precioMenuDelDia2.Text = listaMenus[1].Precio.ToString();

        }
        private void BindCategories()
        {
            int CategoriesPerPage = 3;
            var pagedCategories = Categories.GetRange(CurrentPage * CategoriesPerPage, Math.Min(CategoriesPerPage, Categories.Count - (CurrentPage * CategoriesPerPage)));
            CategoryRepeater.DataSource = pagedCategories;
            CategoryRepeater.DataBind();
        }



        protected void txtBusqueda_OnTextChanged(object sender, EventArgs e)
        {
            // Aquí se maneja el evento onkeyup (TextChanged)
            string input = txtBusqueda.Text;

        }


        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                clsCATEGORIAS categoria = (clsCATEGORIAS)e.Item.DataItem;
                categoria.SUBCATEGORIAS = _objSubcategoria.GetListaSubcategoriasByIdCategoria(categoria.Id_Categoria);
                Repeater rptSubcategories = (Repeater)e.Item.FindControl("rptSubcategories");
                rptSubcategories.DataSource = categoria.SUBCATEGORIAS;
                rptSubcategories.DataBind();
            }
        }

        protected void rptSubcategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                clsSUBCATEGORIAS subcategoria = (clsSUBCATEGORIAS)e.Item.DataItem;
                subcategoria.PRODUCTOS = _objProducto.GetListaProductosByIdSubCategoria(subcategoria.Id_Subcategoria);
                Repeater rptProducts = (Repeater)e.Item.FindControl("rptProducts");
                ViewState["Productos"] = subcategoria.PRODUCTOS;
                rptProducts.DataSource = ViewState["Productos"] as List<clsPRODUCTOS>;
                rptProducts.DataBind();
            }
        }

        protected void rptProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnDisponibilidad = e.Item.FindControl("btnDisponibilidad") as Button;

                HtmlGenericControl div = e.Item.FindControl("divProducto") as HtmlGenericControl;
                if (div != null)
                {
                    div.Attributes["class"] += (" bg-" + random.Next(1, 4));
                }
                int index = e.Item.ItemIndex;
                List<clsPRODUCTOS> listaProductos = ViewState["Productos"] as List<clsPRODUCTOS>;
                if (bool.Parse(listaProductos[index].Disponibilidad.ToString()))
                {
                    btnDisponibilidad.CssClass += " btnDisponibilidad-true";
                }
                else
                {
                    btnDisponibilidad.CssClass += " btnDisponibilidad-false";
                }

            }
        }

        private List<Category> GetCategorias(List<clsCATEGORIAS> clsCategorias)
        {
            List<Category> categorias = new List<Category>
            {
                new Category { Text = "Menus del dia", NavigateUrl = "#menuDelDiaContainer" }
            };
            foreach (clsCATEGORIAS categoria in clsCategorias)
            {
                categorias.Add(
                    new Category()
                    {
                        Text = categoria.Nombre_Categoria,
                        NavigateUrl = "#" + categoria.Id_Categoria
                    }
                );
            }
            return categorias;
        }
    }



    [Serializable]
    public class Category
    {
        public string Text { get; set; }
        public string NavigateUrl { get; set; }
    }
}