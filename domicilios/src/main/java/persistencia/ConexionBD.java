package persistencia;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ConexionBD {
    private String DB_driver = "";
    private String url = "";
    private String db = "";
    private String host = "";
    private String username = "";
    private String password = "";
    private ResultSet resultset = null;
    public Connection conexion = null;
    private Statement stmt = null;


    public ConexionBD() {
        DB_driver = "com.mysql.jdbc.Driver";
        host ="localhost:3306";
        db ="pruebas57";
        url = url = "jdbc:mysql://" + host + "/" + db;
        username = "root";
        password = "Graz45Huil90!";
        
        try {
            // Asignacion del Driver
            Class.forName(DB_driver);
        }catch(ClassNotFoundException ex){
            System.out.println("Error en la asignacion del driver");
        }
        
        try {
            //Crear conexion
            conexion = DriverManager.getConnection(url, username, password);
            System.out.println("Se conecto correctamente");
        }catch(SQLException ex){
            System.out.println("Error en la creacion de conexion");
        }
    }
    //Retornar Conexion
    public Connection getConnection() {
        return conexion;
    }
    
    //Cerrar Conexion
    public void closeConnection() {
        if(conexion != null) {
            try {
                conexion.close();
            }catch(SQLException ex){
                System.out.println("Error al cerrar conexion ");
            }
        }
    }
    
    //Consultar base de datos
    
    public ResultSet consultarBD(String sentencia){
        try {
            stmt = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = stmt.executeQuery(sentencia);
        }catch(SQLException ex){
            System.out.println("Error al consultar de la base de datos");
        }
        return resultset;
    }
    
    //Insertar Base de Datos
    
    public boolean insertarBD(String sentencia){
        try{
            stmt =conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al insertar de la base de datos");
            return false;
        }
    }
    
    //Borrar base de datos
    
    public boolean borrarBD(String sentencia){
        try{
            stmt =conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al borrar de la base de datos");
            return false;
        }
    }
    
    //Actualizar base de datos
    
    public boolean actualizarBD(String sentencia){
        try{
            stmt =conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al actualizar de la base de datos");
            return false;
        }
    }
    
    //commit base de datos
    
    public boolean setAutocommitBD(boolean commit){
        try{
            conexion.setAutoCommit(commit);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al realizar autocommit de la base de datos");
            return false;
        }
    }
    
    public boolean commitBD(){
         try{
            conexion.commit();
            return true;
        }catch(SQLException ex){
            System.out.println("Error al realizar commit en la base de datos");
            return false;
        }
    }
    
    //Rollback base de datos
    
    public boolean rollbackBD(){
         try{
            conexion.rollback();
            return true;
        }catch(SQLException ex){
            System.out.println("Error al realizar rollback en la base de datos");
            return false;
        }
    }
    
}
