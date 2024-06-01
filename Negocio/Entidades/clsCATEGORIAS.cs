
namespace Negocio.Entidades
{
    using Datos;
    using System;
    using System.Collections.Generic;

    [Serializable]
    public partial class clsCATEGORIAS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public clsCATEGORIAS()
        {
            this.SUBCATEGORIAS = new HashSet<clsSUBCATEGORIAS>();
        }

        public int Id_Categoria { get; set; }
        public string Nombre_Categoria { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsSUBCATEGORIAS> SUBCATEGORIAS { get; set; }
    }
}
