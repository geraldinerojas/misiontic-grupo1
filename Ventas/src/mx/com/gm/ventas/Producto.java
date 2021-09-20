package mx.com.gm.ventas;

public class Producto {
    private final int idProducto;
    private String nombre;
    private double precioDeCompra;
    private double precioDeVenta;
    private int cantStock;
    private boolean disponible = false;
    private static int contadorProductos;
    public static int dimensionArray;
    
    private Producto(){
        this.idProducto = ++Producto.contadorProductos;
    }
    
    public Producto(String nombre, double precio, double gasto, int stock, boolean disponible ){
        this();
        this.nombre = nombre;
        this.precioDeVenta = precio;
        this.precioDeCompra = gasto;
        this.cantStock = stock;
        this.disponible = disponible;
        
        dimensionArray++;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return this.precioDeVenta;
    }

    public void setPrecio(double precio) {
        this.precioDeVenta = precio;
    }

    public int getIdProducto() {
        return this.idProducto;
    }

    public double getPrecioDeCompra() {
        return precioDeCompra;
    }

    public void setPrecioDeCompra(double precioDeCompra) {
        this.precioDeCompra = precioDeCompra;
    }

    public int getCantStock() {
        return this.cantStock;
    }

    public void setCantStock(int cantStock) {
        this.cantStock = cantStock;
    }

    public boolean isDisponible() {
        if(getCantStock()>0){
            this.disponible = true;
        }
        return this.disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }
    
    
    
    

    @Override
    public String toString() {
        return "Producto{" + "idProducto = " + idProducto + ", nombre = " + nombre + ", precio de venta = " + precioDeVenta + ", gasto de compra = " + precioDeCompra + ",cantidad disponible = " + cantStock + '}';
    }
    
    
    
    
}
