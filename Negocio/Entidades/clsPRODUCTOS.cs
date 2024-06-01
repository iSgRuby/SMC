using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Entidades
{
    [Serializable]
    public class clsPRODUCTOS
    {
        public int ProductoID { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Categoria_ID { get; set; }
        public Nullable<int> Subcategoria_ID { get; set; }
        public Nullable<bool> Disponibilidad { get; set; }
    }
}
