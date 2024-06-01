using Datos;
using Negocio.Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaMenuCafeteria.InterfacesDeUsuario
{
    public class MenuDelDia
    {
        private readonly cafeteria_ESIME_CulhuacanEntities context;

        public MenuDelDia()
        {
            context = new cafeteria_ESIME_CulhuacanEntities();
        }

        public void AgregarMenu(MENUS_DEL_DIA menu)
        {
            context.MENUS_DEL_DIA.Add(menu);
            context.SaveChanges();
        }

        public void EliminarMenu(MENUS_DEL_DIA menu)
        {
            context.MENUS_DEL_DIA.Remove(menu);
            context.SaveChanges();
        }

        public List<clsMENUS_DEL_DIA> GetListaMenu()
        {
            List<MENUS_DEL_DIA>  list = context.MENUS_DEL_DIA.Select(x => x).ToList();
            List<clsMENUS_DEL_DIA> newList = new List<clsMENUS_DEL_DIA>();
            foreach (MENUS_DEL_DIA menu in list)
            {
                newList.Add(
                    new clsMENUS_DEL_DIA() {
                        Menu_ID = menu.Menu_ID,
                        Descripcion = menu.Descripcion,
                        Precio = menu.Precio
                    }
                );
            }
            return newList;
        }

        public MENUS_DEL_DIA GetMenu(int idMenu)
        {
            return context.MENUS_DEL_DIA.Where(x => x.Menu_ID == idMenu).FirstOrDefault();
        }
    }
}
