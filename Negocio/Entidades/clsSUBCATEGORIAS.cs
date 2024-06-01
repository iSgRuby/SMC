using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Entidades
{
    public class clsSUBCATEGORIAS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public clsSUBCATEGORIAS()
        {
            this.PRODUCTOS = new HashSet<clsPRODUCTOS>();
            this.PRODUCTOS1 = new HashSet<clsPRODUCTOS>();
        }

        public int Subcategoria_ID { get; set; }
        public string Nombre_Subcategoria { get; set; }
        public int Categoria_ID { get; set; }

        public virtual clsCATEGORIAS CATEGORIAS { get; set; }
        public virtual clsCATEGORIAS CATEGORIAS1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsPRODUCTOS> PRODUCTOS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsPRODUCTOS> PRODUCTOS1 { get; set; }
    }
}
