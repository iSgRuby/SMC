using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Entidades
{
    [Serializable]
    public class clsSUBCATEGORIAS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public clsSUBCATEGORIAS()
        {
            this.PRODUCTOS = new HashSet<clsPRODUCTOS>();
        }

        public int Id_Subcategoria { get; set; }
        public string Nombre_Subcategoria { get; set; }
        public int Id_Categoria { get; set; }

        public virtual clsCATEGORIAS CATEGORIAS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<clsPRODUCTOS> PRODUCTOS { get; set; }
    }
}
