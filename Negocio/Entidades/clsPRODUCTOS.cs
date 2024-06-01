using Datos;
using System;
namespace Negocio.Entidades
{
    [Serializable]
    public partial class clsPRODUCTOS
    {
        public int Id_Producto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public bool Disponibilidad { get; set; }
        public int Id_Subcategoria { get; set; }
        public decimal Precio { get; set; }

        public virtual clsSUBCATEGORIAS SUBCATEGORIAS { get; set; }
    }
}
