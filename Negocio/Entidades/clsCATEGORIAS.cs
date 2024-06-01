using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Entidades
{
    public class clsCATEGORIAS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public clsCATEGORIAS()
        {
            this.PRODUCTOS = new HashSet<clsPRODUCTOS>();
            this.SUBCATEGORIAS = new HashSet<clsSUBCATEGORIAS>();
            this.PRODUCTOS1 = new HashSet<clsPRODUCTOS>();
            this.SUBCATEGORIAS1 = new HashSet<clsSUBCATEGORIAS>();
        }

        public int Categoria_ID { get; set; }
        public string Nombre_Categoria { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsPRODUCTOS> PRODUCTOS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsSUBCATEGORIAS> SUBCATEGORIAS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsPRODUCTOS> PRODUCTOS1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsSUBCATEGORIAS> SUBCATEGORIAS1 { get; set; }
    }
}
