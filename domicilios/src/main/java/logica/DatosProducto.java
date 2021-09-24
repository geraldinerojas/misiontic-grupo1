/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author aceve
 */
public class DatosProducto {
    // Número de producto

    private int ID;
    // nombre del producto
    private String nombre;
    // precio de los productos básicos
    private double precioDeVenta;
    //precio de compra 
    private double precioDeCompra;
    // número de productos
    private int stock;

    public DatosProducto() {  
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecioDeVenta() {
        return precioDeVenta;
    }

    public void setPrecioDeVenta(double precioDeVenta) {
        this.precioDeVenta = precioDeVenta;
    }

    public double getPrecioDeCompra() {
        return precioDeCompra;
    }

    public void setPrecioDeCompra(double precioDeCompra) {
        this.precioDeCompra = precioDeCompra;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public boolean guardarProducto() {
        ConexionBD conexion = new ConexionBD();

        String sentencia = "INSERT INTO inventariodpt(idProducto, nombre, precioDeVenta, precioDeCompra, stock)"
                + " VALUES ( '" + this.ID + "','" + this.nombre + "',"
                + "'" + this.precioDeVenta + "','" + this.precioDeCompra + "','" + this.stock + "');  ";
        if (conexion.setAutocommitBD(false)) {
            if (conexion.insertarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public boolean borrarProducto(int ID) {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "Delete FROM inventariodpt WHERE idProducto ='" + ID + "'";
        if (conexion.setAutocommitBD(false)) {
            if (conexion.borrarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public boolean actualizarProducto() {
        ConexionBD conexion = new ConexionBD();
        String Sentencia = "UPDATE `inventariodpt` SET nombre='" + this.nombre + "',precioDeVenta='" + this.precioDeVenta + "',precioDeCompra='" + this.precioDeCompra
                + "',stock='" + this.stock + "' WHERE idProducto=" + this.ID + ";";
        if (conexion.setAutocommitBD(false)) {
            if (conexion.actualizarBD(Sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public List<DatosProducto> listarProducto() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM inventariodpt";
        List<DatosProducto> listaProducto = new ArrayList<>();
        ResultSet rs = conexion.consultarBD(sentencia);
        while (rs.next()) {
            DatosProducto prod = new DatosProducto();
            prod.setID(rs.getInt("idProducto"));
            prod.setNombre(rs.getString("nombre"));
            prod.setPrecioDeVenta(rs.getDouble("precioDeVenta"));
            prod.setPrecioDeCompra(rs.getDouble("precioDeCompra"));
            prod.setStock(rs.getInt("stock"));
            listaProducto.add(prod);
        }
        return listaProducto;
    }

    public DatosProducto obtenerProducto(int identificacion) throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM inventariodpt WHERE idProducto = '" + ID + "'";
        ResultSet rs = conexion.consultarBD(sentencia);
        if (rs.next()) {
            DatosProducto prod = new DatosProducto();
            prod.setID(rs.getInt("Idproducto"));
            prod.setNombre(rs.getString("nombre"));
            prod.setPrecioDeVenta(rs.getDouble("precioDeVenta"));
            prod.setPrecioDeCompra(rs.getDouble("precioDeCompra"));
            prod.setStock(rs.getInt("stock"));
            return prod;
        } else {
            return null;
        }
    }

}
