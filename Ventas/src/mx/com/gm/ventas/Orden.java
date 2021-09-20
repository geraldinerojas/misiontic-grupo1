package mx.com.gm.ventas;

public class Orden {
    private int idOrden;
    private Producto productos[] = null;
    private static int contadorOrdenes;
    private int contadorProductos;
    private static final int MAX_PRODUCTOS = 10;

    
    public Orden(){
        this.idOrden = ++Orden.contadorOrdenes;
        this.productos = new Producto[Orden.MAX_PRODUCTOS];
    }
    
    public void agregarProducto(Producto producto) {
        if(producto != null){
        if (producto.getCantStock() > 0) {
                this.productos[this.contadorProductos++] = producto;
                producto.setCantStock(producto.getCantStock() - 1);
        } else {
                System.out.print("Sin stock");
            }
        }
    }
    
    public double calcularTotalVenta(){
        double total = 0;
        for (int i = 0; i < this.contadorProductos; i++) {
            Producto producto = this.productos[i];
            total += producto.getPrecio();
        }
        return total;
        
    }
    
        public double calcularTotalCompra(){
        double total = 0;
        for (int i = 0; i < this.contadorProductos; i++) {
            Producto producto = this.productos[i];
            total += producto.getPrecioDeCompra();
        }
        return total;   
    }
    
    public void mostrarOrden(){
        System.out.println("Id Orden: " + this.idOrden);
        double totalOrdenVenta = this.calcularTotalVenta();
        double totalOrdenCompra = this.calcularTotalCompra();
        System.out.println("Total de la venta: $" + totalOrdenVenta);
        System.out.println("Total costo: $" + totalOrdenCompra);
        System.out.println("Productos de la orden: ");
        for (int i = 0; i < this.contadorProductos; i++) {
            System.out.println(this.productos[i]);
        }
    }
    
    // Profe que pena, yo ya hice el examen de nivelación, que seguiría o como sigue el proceso?
    
}
