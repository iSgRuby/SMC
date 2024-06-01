using Datos;
using Negocio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Categoria
    {
        private readonly cafeteria_ESIME_CulhuacanEntities context;

        public Categoria()
        {
            context = new cafeteria_ESIME_CulhuacanEntities();
        }

        public clsCATEGORIAS GetCategoria(int idCategoria)
        {
            CATEGORIAS categoria = context.CATEGORIAS.Where(x => x.Categoria_ID == idCategoria).FirstOrDefault();
            return new clsCATEGORIAS() 
            { 
                Categoria_ID = categoria.Categoria_ID,
                Nombre_Categoria = categoria.Nombre_Categoria
            };
             
        }

        public List<clsCATEGORIAS> GetListaCategorias()
        {
            List<CATEGORIAS> listaDeCategorias = context.CATEGORIAS.Select(x => x).ToList();
            List <clsCATEGORIAS> listaNueva = new List<clsCATEGORIAS>();

            foreach (CATEGORIAS categoria in listaDeCategorias)
            {
                listaNueva.Add(
                    new clsCATEGORIAS()
                    {
                        Categoria_ID = categoria.Categoria_ID,
                        Nombre_Categoria = categoria.Nombre_Categoria,
                    }    
                );
            }

            return listaNueva;
        }
    }
}
