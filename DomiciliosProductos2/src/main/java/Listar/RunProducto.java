/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Listar;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author aceve
 */
public class RunProducto {
    public static void main(String[] args) {
        
        ArrayList<DatosProducto> array = new ArrayList<DatosProducto>();
        // Llame al método de inicialización del producto y pase la colección
        init(array);
        while (true) {
            // Llama al método del menú
            mainMenu();
            // Llame al usuario para seleccionar el método del número de serie
            int choose = chooseFunction();
            switch (choose) {
                case 1:
                    // Llamada 1: lista de carga
                    showFruitList(array);
                    break;

                case 2:
                    // Llamada 2: Agregar productos
                    addFruit(array);
                    break;

                case 3:
                    // Llamada 3: eliminar los bienes
                    deleteFruit(array);
                    break;

                case 4:
                    // Llamada 4: modificar los bienes
                    updataFruit(array);
                    break;

                case 5:
                    // Llamada 5: Salir
                    return;

                default:
                    System.out.println("No existe tal característica");
                    break;
            }
        }

    }

    public static void updataFruit(ArrayList<DatosProducto> array) {
        System.out.println("La función de modificación está seleccionada");
        System.out.println("Ingrese el número de artículo");

        Scanner sc = new Scanner(System.in);
        int ID = sc.nextInt();

        // Iterar a través de la colección y obtener cada variable Fruitproducto
        for (int i = 0; i < array.size(); i++) {
            DatosProducto producto = array.get(i);
            
            if (producto.ID == ID) {
                System.out.println("Ingrese un nuevo número de producto");
                producto.ID = sc.nextInt();

                System.out.println("Ingrese un nuevo nombre de producto");
                producto.nombre = sc.next();

                System.out.println("Ingrese un nuevo precio de Venta del producto");
                producto.precioDeVenta = sc.nextDouble();
                
                System.out.println("Ingrese un nuevo precio de Compra del producto");
                producto.precioDeCompra = sc.nextDouble();

                System.out.println("¡Modificado con éxito!");

                return;
            }
        }
        System.out.println("El número que ingresó no existe");
    }

    public static void deleteFruit(ArrayList<DatosProducto> array) {
        System.out.println("La función de eliminación está seleccionada");
        System.out.println("Ingrese el número del elemento que se va a eliminar");
        Scanner sc = new Scanner(System.in);

        int ID = sc.nextInt();
        for (int i = 0; i < array.size(); i++) {
            DatosProducto producto = array.get(i);
            if (producto.ID == ID) {
                array.remove(i);
                System.out.println("Eliminar con éxito");
                return;
            }
        }
        System.out.println("El número que ingresó no existe");

    }

    
    public static void addFruit(ArrayList<DatosProducto> array) {
        System.out.println("La opción es agregar características del producto");
        // Crear variable de escáner
        Scanner sc = new Scanner(System.in);
        System.out.println("Ingrese el número de artículo");
        // Ingrese el número de producto
        int ID = sc.nextInt();
        System.out.println("Ingrese el nombre del producto");
        // Ingrese el nombre del producto
        String nombre = sc.next();
        System.out.println("Ingrese el precio unitario de venta del producto");
        // Ingrese el precio unitario del producto
        double precioDeVenta = sc.nextDouble();
        // Ingrese el precio unitario de compra del producto
        System.out.println("Ingrese el precio unitario de compra del producto");
        double precioDeCompra = sc.nextDouble();
        // Crear variable Fruitproducto
        DatosProducto producto = new DatosProducto();
        // elemento. valor de atributo	
        producto.ID = ID;
        producto.nombre = nombre;
        producto.precioDeVenta = precioDeVenta;
        producto.precioDeCompra = precioDeCompra;
        array.add(producto);
        System.out.println("Agregado correctamente");
    }

    
    public static void showFruitList(ArrayList<DatosProducto> array) {
        System.out.println();
        System.out.println("---------------- Lista de inventario de productos ----------------");
        System.out.println("Codigo de producto Nombre del producto Precio unitario de venta del producto Precio unitario de compra del producto");
        // atraviesa la colección
        for (int i = 0; i < array.size(); i++) {
            // Método get de la colección, obtén cada variable Fruitproducto, puedes usar Fruitproducto para obtener el resultado
            DatosProducto producto = array.get(i);
            System.out.println("Id: " + producto.ID + "  " + "producto: " + producto.nombre + "  " + "precio de venta: " + producto.precioDeVenta + " " + "precio de compra: " + producto.precioDeCompra);
        }
    }

    public static int chooseFunction() {
        Scanner sc = new Scanner(System.in);
        return sc.nextInt();
    }

    public static void mainMenu() {
        System.out.println("---------------- Bienvenido al Testeo ----------------");
        System.out.println("1. Lista de productos 2. Agregar productos 3. Eliminar productos 4. Modificar productos 5. Salir");
        System.out.println("Ingrese el número de la función que desea operar:");
    }

    private static void init(ArrayList<DatosProducto> array) {
        
        DatosProducto producto1 = new DatosProducto();
        DatosProducto producto2 = new DatosProducto();
        DatosProducto producto3 = new DatosProducto();

        producto1.ID = 1;
        producto1.nombre = "Camisa";
        producto1.precioDeVenta = 30;
        producto1.precioDeCompra = 20;
        

        producto2.ID = 2;
        producto2.nombre = "Pantalon";
        producto2.precioDeVenta = 100;
        producto2.precioDeCompra = 70;
        
        
        producto3.ID = 3;
        producto3.nombre = "Mocasin";
        producto3.precioDeVenta = 75;
        producto3.precioDeCompra = 55;
        
        array.add(producto1);
        array.add(producto2);
        array.add(producto3);
    }
}
