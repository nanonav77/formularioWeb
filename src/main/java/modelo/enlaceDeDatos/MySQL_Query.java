package modelo.enlaceDeDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import modelo.dto.DTO_Persona;

import com.mysql.jdbc.PreparedStatement;



public class MySQL_Query{
	
	private String driver = "com.mysql.jdbc.Driver";
	private String usuario = "b0bdacceebc4b3" ;
	private String contrasena = "c3d524ff";
	private String servidor = "jdbc:mysql://us-cdbr-sl-dfw-01.cleardb.net:3306/ibmx_eccb62989e09acf";
	private Connection conexion; 

    
    private void abrirConexionBD() throws ClassNotFoundException, SQLException{

    	Class.forName(driver);

        // Establecer la conexion con la base de datos
        conexion = DriverManager.getConnection(servidor , usuario, contrasena);
    }
	
	
    public int registrarUsuario(DTO_Persona nvoRegistro) throws ParseException, ClassNotFoundException{
    	try{
    		abrirConexionBD();
    		
    		String query_1 = "insert into usuario (correo, contrasena) values (?,?)";
    		String query_2 = "insert into usuario_roles(correo,role)values (?,?)";

    		PreparedStatement insert_1 = (PreparedStatement) conexion.prepareStatement(query_1);
              
    		insert_1.setString(1, nvoRegistro.getCorreo());
    		insert_1.setString(2, nvoRegistro.getContrasena());    
        
    		insert_1.execute();
        
    		PreparedStatement insert_2 = (PreparedStatement) conexion.prepareStatement(query_2);
        
    		insert_2.setString(1, nvoRegistro.getCorreo());
    		insert_2.setString(2, "ROLE_ADMIN");
        
    		insert_2.execute();
        
    		conexion.close();
        
    		return 1;
    	
    		}catch(SQLException e){
    			return 0;
    		}

    }   	

}