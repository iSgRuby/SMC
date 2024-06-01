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
            SUBCATEGORIAS subcategoria = context.SUBCATEGORIAS.Where(x => x.Id_Subcategoria == idSubcategoria).Select(x => x).FirstOrDefault();
            return new clsSUBCATEGORIAS()
            {
                Id_Subcategoria = subcategoria.Id_Subcategoria,
                Id_Categoria = subcategoria.Id_Categoria,
                Nombre_Subcategoria = subcategoria.Nombre_Subcategoria
            };
        }

        public List<clsSUBCATEGORIAS> GetListaSubcategorias()
        {
            List<SUBCATEGORIAS> listaSubcategorias = context.SUBCATEGORIAS.Select(x=>x).ToList();
            List<clsSUBCATEGORIAS> newListaSubcategorias = new List<clsSUBCATEGORIAS>();
            foreach (SUBCATEGORIAS subcategoria in listaSubcategorias)
            {
                newListaSubcategorias.Add(
                    GetSubcategoria(subcategoria.Id_Subcategoria)
                );
            }

            return newListaSubcategorias;
        }
        public List<clsSUBCATEGORIAS> GetListaSubcategoriasByIdCategoria(int idCategoria)
        {
            List<SUBCATEGORIAS> listaSubcategorias = context.SUBCATEGORIAS.Where(x => x.Id_Categoria == idCategoria).ToList();
            List<clsSUBCATEGORIAS> newListaSubcategorias = new List<clsSUBCATEGORIAS>();
            foreach (SUBCATEGORIAS subcategoria in listaSubcategorias)
            {
                newListaSubcategorias.Add(
                    GetSubcategoria(subcategoria.Id_Subcategoria) 
                );
            }

            return newListaSubcategorias;
        }
    }
}
