using Datos;
using System;
namespace Negocio.Entidades
{
    [Serializable]
    public partial class clsVw_Productos
    {
        public int Id_Producto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public bool Disponibilidad { get; set; }
        public string Nombre_Categoria { get; set; }
        public string Nombre_Subcategoria { get; set; }
        public decimal Precio { get; set; }
    }
}
