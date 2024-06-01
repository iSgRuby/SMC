using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Entidades
{
    [Serializable]
    public partial class clsMENUS_DEL_DIA
    {
        public int Menu_ID { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
    }
}
