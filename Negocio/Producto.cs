﻿using System;
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

        public void AgregarProducto(PRODUCTOS producto)
        {
            List<PRODUCTOS> productos = context.PRODUCTOS.Select(x => x).ToList();
            productos.Add(producto);
            context.SaveChanges();
        }

        public void EliminarProducto(PRODUCTOS producto)
        {
            PRODUCTOS productoAEliminar = context.PRODUCTOS.Where(x => x.ProductoID == producto.ProductoID).FirstOrDefault();
            if (productoAEliminar != null)
            {
                context.PRODUCTOS.Remove(productoAEliminar);
                context.SaveChanges();
            }
        }

        public List<clsPRODUCTOS> GetListaProductosByIdSubCategoria(int idSubcategoria)
        {
            List<clsPRODUCTOS> newlistaProductos = new List<clsPRODUCTOS>();
            List<PRODUCTOS> listaProductos = context.PRODUCTOS.Where(x => x.Subcategoria_ID == idSubcategoria).ToList();
            foreach (PRODUCTOS producto in listaProductos)
            {
                newlistaProductos.Add(
                    new clsPRODUCTOS()
                    {
                        ProductoID = producto.ProductoID,
                        Precio = producto.Precio,
                        Nombre = producto.Nombre,
                        Categoria_ID = producto.Categoria_ID,
                        Subcategoria_ID = producto.Subcategoria_ID,
                        Disponibilidad = producto.Disponibilidad
                    }    
                );
            }
            return newlistaProductos;
        }

        public List<clsPRODUCTOS> GetListaProductos()
        {
            List<clsPRODUCTOS> newlistaProductos = new List<clsPRODUCTOS>();
            List<PRODUCTOS> listaProductos = context.PRODUCTOS.Select(x=>x).ToList();
            foreach (PRODUCTOS producto in listaProductos)
            {
                newlistaProductos.Add(
                    new clsPRODUCTOS()
                    {
                        ProductoID = producto.ProductoID,
                        Precio = producto.Precio,
                        Nombre = producto.Nombre,
                        Categoria_ID = producto.Categoria_ID,
                        Subcategoria_ID = producto.Subcategoria_ID,
                        Disponibilidad = producto.Disponibilidad
                    }
                );
            }
            return newlistaProductos;
        }
        public PRODUCTOS GetProducto(int idProducto)
        {
            PRODUCTOS productoObtenido = context.PRODUCTOS.Where(x => x.ProductoID == idProducto).FirstOrDefault();
            return productoObtenido;
        }
    }
}