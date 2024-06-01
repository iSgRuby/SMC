using Datos;
using Negocio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Subcategoria
    {
        private readonly cafeteria_ESIME_CulhuacanEntities context;

        public Subcategoria()
        {
            context = new cafeteria_ESIME_CulhuacanEntities();
        }

        public clsSUBCATEGORIAS GetSubcategoria(int idSubcategoria)
        {
            SUBCATEGORIAS subcategoria = context.SUBCATEGORIAS.Where(x => x.Subcategoria_ID == idSubcategoria).Select(x => x).FirstOrDefault();
            return new clsSUBCATEGORIAS()
            {
                Subcategoria_ID = subcategoria.Subcategoria_ID,
                Categoria_ID = subcategoria.Categoria_ID,
                Nombre_Subcategoria = subcategoria.Nombre_Subcategoria
            };
        }

        public List<clsSUBCATEGORIAS> GetListaSubcategorias(int idCategoria)
        {
            List<SUBCATEGORIAS> listaSubcategorias = context.SUBCATEGORIAS.Where(x => x.Categoria_ID == idCategoria).ToList();
            List<clsSUBCATEGORIAS> newListaSubcategorias = new List<clsSUBCATEGORIAS>();
            foreach (SUBCATEGORIAS subcategoria in listaSubcategorias)
            {
                newListaSubcategorias.Add(
                    GetSubcategoria(subcategoria.Subcategoria_ID) 
                );
            }

            return newListaSubcategorias;
        }
    }
}
