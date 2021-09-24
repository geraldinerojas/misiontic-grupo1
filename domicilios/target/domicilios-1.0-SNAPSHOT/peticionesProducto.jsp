<%-- 
    Document   : peticionesProducto
    Created on : 22/09/2021, 9:21:06 p. m.
    Author     : aceve
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.DatosProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String respuesta = "{";
    String proceso = request.getParameter("proceso");
    DatosProducto prod = new DatosProducto();
    switch (proceso) {
        case "guardarProducto":
            System.out.println("Entro a guardar contacto");
            prod.setID(Integer.parseInt(request.getParameter("idProducto")));
            prod.setNombre(request.getParameter("nombre"));
            prod.setPrecioDeVenta(Double.parseDouble(request.getParameter("precioDeVenta")));
            prod.setPrecioDeCompra(Double.parseDouble(request.getParameter("precioDeCompra")));
            prod.setStock(Integer.parseInt(request.getParameter("stock")));
            if (prod.guardarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "actualizarProducto":
            System.out.println("Entro a actualizar contacto");
            int ID = Integer.parseInt(request.getParameter("idProducto"));
            if(prod.actualizarProducto()) {
                prod.setNombre(request.getParameter("nombre"));
                prod.setPrecioDeVenta(Double.parseDouble(request.getParameter("precioDeVenta")));
                prod.setPrecioDeCompra(Double.parseDouble(request.getParameter("precioDeCompra")));
                prod.setStock(Integer.parseInt(request.getParameter("stock")));
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

            break;
        case "borrarProducto":
            System.out.println("Entro a eliminar contacto");
            ID = Integer.parseInt(request.getParameter("idProducto"));
            if (prod.borrarProducto(ID)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

            break;
        case "listarProducto":
            System.out.println("Listar Contactos");
            List<DatosProducto> listaProducto = prod.listarProducto();
            if (listaProducto.isEmpty()) {
                respuesta += "\"" + proceso + "\": true,\"Contactos\":[]"; //genera una lista vacía en el json
            } else {
                respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(listaProducto); //guarda la lista en el json

            }

            break;
        default:

            respuesta += "\"ok\": false,";
            respuesta += "\"error\": \"INVALID\",";
            respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                    + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";

    }
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);


%>
