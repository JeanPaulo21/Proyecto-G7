using EcommerceApp.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace EcommerceApp.Controllers
{
    public class ProductosController : Controller
    {
        public IActionResult Index()
        {
            var productos = new List<Producto>
            {
                // Camisas Nike
                new Producto { Id = 1, Nombre = "Camisa Nike Air", Descripcion = "Camisa deportiva Nike Air", Precio = 29.99M, ImagenUrl = "/img/camisa_nike_air.jpg" },
                new Producto { Id = 2, Nombre = "Camisa Nike Dri-FIT", Descripcion = "Camisa Nike Dri-FIT para correr", Precio = 34.99M, ImagenUrl = "/img/camisa_nike_dri_fit.jpg" },
                new Producto { Id = 3, Nombre = "Camisa Nike Pro", Descripcion = "Camisa Nike Pro de entrenamiento", Precio = 39.99M, ImagenUrl = "/img/camisa_nike_pro.jpg" },
                new Producto { Id = 4, Nombre = "Camisa Nike Sportswear", Descripcion = "Camisa casual Nike Sportswear", Precio = 32.99M, ImagenUrl = "/img/camisa_nike_sportswear.jpg" },
                new Producto { Id = 5, Nombre = "Camisa Nike Running", Descripcion = "Camisa Nike Running para corredores", Precio = 28.99M, ImagenUrl = "/img/camisa_nike_running.jpg" },
                new Producto { Id = 6, Nombre = "Camisa Nike Academy", Descripcion = "Camisa Nike Academy de fútbol", Precio = 25.99M, ImagenUrl = "/img/camisa_nike_academy.jpg" },
                new Producto { Id = 7, Nombre = "Camisa Nike Therma-FIT", Descripcion = "Camisa Nike Therma-FIT para clima frío", Precio = 38.99M, ImagenUrl = "/img/camisa_nike_therma_fit.jpg" },
                new Producto { Id = 8, Nombre = "Camisa Nike Tech Pack", Descripcion = "Camisa avanzada Nike Tech Pack", Precio = 45.99M, ImagenUrl = "/img/camisa_nike_tech_pack.jpg" },
                new Producto { Id = 9, Nombre = "Camisa Nike Air Max", Descripcion = "Camisa inspirada en las Nike Air Max", Precio = 33.99M, ImagenUrl = "/img/camisa_nike_air_max.jpg" },
                new Producto { Id = 10, Nombre = "Camisa Nike Vapor", Descripcion = "Camisa Nike Vapor ligera", Precio = 37.99M, ImagenUrl = "/img/camisa_nike_vapor.jpg" },

                // Tenis Nike
                new Producto { Id = 11, Nombre = "Tenis Nike Air Max 270", Descripcion = "Tenis Nike Air Max 270 para deporte", Precio = 120.99M, ImagenUrl = "/img/tenis_nike_air_max_270.jpg" },
                new Producto { Id = 12, Nombre = "Tenis Nike React Infinity Run", Descripcion = "Tenis Nike React Infinity Run para correr", Precio = 140.99M, ImagenUrl = "/img/tenis_nike_react_infinity_run.jpg" },
                new Producto { Id = 13, Nombre = "Tenis Nike ZoomX Vaporfly", Descripcion = "Tenis Nike ZoomX Vaporfly de alto rendimiento", Precio = 250.99M, ImagenUrl = "/img/tenis_nike_zoomx_vaporfly.jpg" },
                new Producto { Id = 14, Nombre = "Tenis Nike Air Force 1", Descripcion = "Tenis clásicos Nike Air Force 1", Precio = 89.99M, ImagenUrl = "/img/tenis_nike_air_force_1.jpg" },
                new Producto { Id = 15, Nombre = "Tenis Nike SB Dunk", Descripcion = "Tenis Nike SB Dunk para skate", Precio = 110.99M, ImagenUrl = "/img/tenis_nike_sb_dunk.jpg" },
                new Producto { Id = 16, Nombre = "Tenis Nike Free RN 5.0", Descripcion = "Tenis Nike Free RN 5.0 para correr", Precio = 100.99M, ImagenUrl = "/img/tenis_nike_free_rn_5.jpg" },
                new Producto { Id = 17, Nombre = "Tenis Nike Zoom Fly", Descripcion = "Tenis Nike Zoom Fly para velocidad", Precio = 130.99M, ImagenUrl = "/img/tenis_nike_zoom_fly.jpg" },
                new Producto { Id = 18, Nombre = "Tenis Nike Pegasus 39", Descripcion = "Tenis Nike Pegasus 39 para corredores", Precio = 120.99M, ImagenUrl = "/img/tenis_nike_pegasus_39.jpg" },
                new Producto { Id = 19, Nombre = "Tenis Nike Air Zoom", Descripcion = "Tenis Nike Air Zoom para rendimiento", Precio = 125.99M, ImagenUrl = "/img/tenis_nike_air_zoom.jpg" },
                new Producto { Id = 20, Nombre = "Tenis Nike Joyride Run", Descripcion = "Tenis Nike Joyride Run con amortiguación", Precio = 150.99M, ImagenUrl = "/img/tenis_nike_joyride_run.jpg" }
            };

            return View(productos);
        }

        public IActionResult Detalle(int id)
        {
            var producto = new Producto
            {
                Id = id,
                Nombre = "Producto ejemplo",
                Descripcion = "Descripción del producto",
                Precio = 99.99M,
                ImagenUrl = "/img/ejemplo.jpg"
            };

            return View(producto);
        }
    }
}
