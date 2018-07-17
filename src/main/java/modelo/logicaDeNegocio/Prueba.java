package modelo.logicaDeNegocio;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class Prueba {

	private static String driver = "com.mysql.jdbc.Driver";
	private static String usuario = "root" ;
	private static String contrasena = "pepe1196";
	private static String servidor = "jdbc:mysql://localhost:3306/micitt?characterEncoding=utf-8";
	private static Connection conexion; 

    
    private static void abrirConexionBD() throws ClassNotFoundException, SQLException{

    	Class.forName(driver);
        conexion = DriverManager.getConnection(servidor , usuario, contrasena);
    }
	public static void main(String[] args) throws FileNotFoundException {
		// TODO Auto-generated method stub

		String filePath = "/home/jose/Pictures/ka.jpg";
		
		try{
    		abrirConexionBD();
    		String sql = "Update micitt.cientifico set foto = ? where cedula = 304900948";
            PreparedStatement statement = (PreparedStatement) conexion.prepareStatement(sql);
           
            InputStream inputStream = new FileInputStream(new File(filePath));
 
            statement.setBlob(1, inputStream);
 
            int row = statement.executeUpdate();
            if (row > 0) {
            	System.out.println("A contact was inserted with photo image.");
            }
            conexion.close();
    		
    	}catch(SQLException | ClassNotFoundException e ){
    		;
    		
    	}
		
		
	}

}