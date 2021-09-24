<%-- 
    Document   : peticionesContacto
    Created on : 22/09/2021, 8:12:52 p. m.
    Author     : aceve
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Contacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String respuesta = "{";
    String proceso = request.getParameter("proceso");
    Contacto c = new Contacto();
    switch(proceso){
        case "guardarContacto":
            System.out.println("Entro a guardar contacto");
            c.setIdentificacion(Integer.parseInt(request.getParameter("identificacion")));
            c.setNombre(request.getParameter("nombre"));
            c.setApellido(request.getParameter("apellido"));
            c.setGenero(request.getParameter("genero"));
            c.setTipoIdentificacion(request.getParameter("tipoIdentificacion"));
            c.setTelefono(request.getParameter("telefono"));
            c.setDireccion(request.getParameter("direccion"));
            c.setCorreo(request.getParameter("correo"));
            if (c.guardarContacto()){
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "actualizarContacto":
            System.out.println("Entro a actualizar contacto");
            break;
        case "eliminarContacto":
            System.out.println("Entro a eliminar contacto");
            int identificacion = Integer.parseInt(request.getParameter("identificacion"));
            if(c.borrarContacto(identificacion)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            
            
            break;
        case "listarContacto":
        System.out.println("Listar Contactos");
        List<Contacto> listaContactos = c.listarContacto();
        if(listaContactos.isEmpty()){
            respuesta += "\"" + proceso + "\": true,\"Contactos\":[]"; //genera una lista vacía en el json
        } else{
            respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(listaContactos); //guarda la lista en el json

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


