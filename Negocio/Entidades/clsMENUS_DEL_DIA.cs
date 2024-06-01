using System;

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
