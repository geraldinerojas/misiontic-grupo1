package mx.com.gm.ventas.test;

import mx.com.gm.ventas.*;

public class VentasTest {
    public static void main(String[] args) {
        Producto producto1 = new Producto("Camisa", 50.00, 30.00,5,true);
        Producto producto2 = new Producto("Pantalon", 100.00,50.00,4,true);
        Producto producto3 = new Producto("Mocasin",75.00,37.50,0,false);
        
        Orden orden1 = new Orden();
        orden1.agregarProducto(producto1);
        orden1.agregarProducto(producto2);
        orden1.mostrarOrden();
        
        Orden orden2 = new Orden();
        orden2.agregarProducto(producto1);
        orden2.agregarProducto(producto1);
        orden2.agregarProducto(producto2);
        orden2.agregarProducto(producto2);
        orden2.agregarProducto(producto2);
        orden2.agregarProducto(producto3);
        orden2.mostrarOrden();
    }
}
