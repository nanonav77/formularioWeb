package modelo.pruebas;

import java.sql.SQLException;
import java.text.ParseException;

import modelo.dto.DTO_Persona;
import modelo.enlaceDeDatos.MySQL_Query;

public class Prueba {

	public static void main(String[] args) throws ClassNotFoundException, SQLException, ParseException {
		// TODO Auto-generated method stub
		
		DTO_Persona n = new DTO_Persona();
		n.setCorreo("prueba@gmail.com");
		n.setContrasena("prueba");
		MySQL_Query p = new MySQL_Query();
		p.registrarUsuario(n);

	}

}
