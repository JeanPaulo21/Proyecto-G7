namespace EcommerceApp.Models
{
    public class Carrito
    {
        public int Id { get; set; }
        public int ProductoId { get; set; }
        public int Cantidad { get; set; }

        public Producto Producto { get; set; }
    }
}
