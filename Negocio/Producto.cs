using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Negocio.Entidades;

namespace Negocio
{
    public class Producto
    {
        private readonly cafeteria_ESIME_CulhuacanEntities context;

        public Producto()
        {
            context = new cafeteria_ESIME_CulhuacanEntities();
        }

        public void AgregarProducto(clsPRODUCTOS productoNuevo)
        {
            context.PRODUCTOS.Add(
                new PRODUCTOS()
                {
                    Nombre = productoNuevo.Nombre,
                    Descripcion = productoNuevo.Descripcion,
                    Disponibilidad = true,
                    Id_Subcategoria = productoNuevo.Id_Subcategoria,
                    Precio = productoNuevo.Precio
                }
            );
            context.SaveChanges();
        }

        public void EliminarProducto(clsPRODUCTOS producto)
        {
            PRODUCTOS productoAEliminar = context.PRODUCTOS.Where(x => x.Id_Producto == producto.Id_Producto).FirstOrDefault();
            if (productoAEliminar != null)
            {
                context.PRODUCTOS.Remove(productoAEliminar);
                context.SaveChanges();
            }
        }

        public void ActualizarEstado(clsPRODUCTOS producto)
        {
            PRODUCTOS productoACambiar = context.PRODUCTOS.Where(x => x.Id_Producto == producto.Id_Producto).FirstOrDefault();
            if (productoACambiar != null)
            {
                productoACambiar.Disponibilidad = producto.Disponibilidad;
                context.SaveChanges();
            }
        }

        public List<clsPRODUCTOS> GetListaProductosByIdSubCategoria(int idSubcategoria)
        {
            List<clsPRODUCTOS> newlistaProductos = new List<clsPRODUCTOS>();
            List<PRODUCTOS> listaProductos = context.PRODUCTOS.Where(x => x.Id_Subcategoria == idSubcategoria).ToList();
            foreach (PRODUCTOS producto in listaProductos)
            {
                newlistaProductos.Add(
                    new clsPRODUCTOS()
                    {
                        Id_Producto = producto.Id_Producto,
                        Precio = producto.Precio,
                        Nombre = producto.Nombre,
                        Descripcion = producto.Descripcion,
                        Id_Subcategoria = producto.Id_Subcategoria,
                        Disponibilidad = producto.Disponibilidad
                    }
                );
            }
            return newlistaProductos;
        }

        public List<clsPRODUCTOS> GetListaProductos()
        {
            List<clsPRODUCTOS> newlistaProductos = new List<clsPRODUCTOS>();
            List<PRODUCTOS> listaProductos = context.PRODUCTOS.Select(x => x).ToList();
            foreach (PRODUCTOS producto in listaProductos)
            {
                newlistaProductos.Add(
                    new clsPRODUCTOS()
                    {
                        Id_Producto = producto.Id_Producto,
                        Precio = producto.Precio,
                        Nombre = producto.Nombre,
                        Descripcion = producto.Descripcion,
                        Id_Subcategoria = producto.Id_Subcategoria,
                        Disponibilidad = producto.Disponibilidad
                    }
                );
            }
            return newlistaProductos;
        }

        public List<clsVw_Productos> GetListaVwProductos()
        {
            return (from x in context.vw_Productos
                    select new clsVw_Productos()
                    {
                        Id_Producto = x.Id_Producto,
                        Nombre = x.Nombre,
                        Descripcion = x.Descripcion,
                        Disponibilidad = x.Disponibilidad,
                        Nombre_Categoria = x.Nombre_Categoria,
                        Nombre_Subcategoria = x.Nombre_Subcategoria,
                        Precio = x.Precio,
                    }).ToList();
        }
        public clsPRODUCTOS GetProducto(int idProducto)
        {
            PRODUCTOS productoObtenido = context.PRODUCTOS.Where(x => x.Id_Producto == idProducto).FirstOrDefault();
            return new clsPRODUCTOS()
            {
                Id_Producto = productoObtenido.Id_Producto,
                Nombre = productoObtenido.Nombre,
                Descripcion = productoObtenido.Descripcion,
                Precio = productoObtenido.Precio,
                Id_Subcategoria = productoObtenido.Id_Subcategoria,
                Disponibilidad = productoObtenido.Disponibilidad,
            };
        }
    }
}
