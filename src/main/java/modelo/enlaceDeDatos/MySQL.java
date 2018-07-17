package modelo.enlaceDeDatos;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.swing.table.DefaultTableModel;

import modelo.dto.DTO_Academica;
import modelo.dto.DTO_Cientifico;
import modelo.dto.DTO_Profesional;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;



public class MySQL{
	
	private String driver = "com.mysql.jdbc.Driver";
	private String usuario = "root" ;
	private String contrasena = "jupiter070417";
	private String servidor = "jdbc:mysql://localhost:3306/micitt?characterEncoding=utf-8";
	private Connection conexion; 

	//hniekgjfkvnsdkjngksnjkfns
    
    private void abrirConexionBD() throws ClassNotFoundException, SQLException{

    	Class.forName(driver);
        conexion = DriverManager.getConnection(servidor , usuario, contrasena);
    }
    
    //------------------------------------------------ INSERT
    
    public int insertarUsuario(DTO_Cientifico pUsuario){
    	try{
    		abrirConexionBD();
    		String query = "insert into micitt.usuario (cedula, contrasena,correo) values(?,?,?)";

    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setInt(1, pUsuario.getCedula());
    		insert.setString(2, pUsuario.getContrasena());
    		insert.setString(3, pUsuario.getCorreo());
    		insert.execute();
    		conexion.close();
            		
    		return 1;
    		
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    		
    	}
    	
    }
    
    public int insertarRolAdministrador(int cedula){
    	try{
    		abrirConexionBD();
    		String query = "insert into micitt.usuario_rol(nombre_rol,cedula) value(?,?);";
    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setInt(2, cedula);
    		insert.setString(1, "ROLE_USER");
    		insert.execute(); 
    		conexion.close();
        
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    	
    }
    
    public int insertarCientifico(DTO_Cientifico cientifico){
    	try{
    		abrirConexionBD();
    		String query = "insert into cientifico(cedula,nombre,apellido1,apellido2,sexo,provincia,canton) value(?,?,?,?,?,?,?)";
    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setInt(1, cientifico.getCedula());
    		insert.setString(2, cientifico.getNombre());
    		insert.setString(3, cientifico.getApellido1());
    		insert.setString(4, cientifico.getApellido2());
    		insert.setString(5, cientifico.getSexo());
    		insert.setString(6, cientifico.getProvincia());
    		insert.setString(7, cientifico.getCanton());
    		insert.execute(); 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }
    public int completarInformacionAcademicaCientifico(String nombre_titulo, String grado_titulo, String universidad,String pais, int año_titulo, int cedula){
    	try{
    		abrirConexionBD();
    		String query = "insert into micitt.informacion_academica(grado,universidad,ano,pais,nombre,f_cedula) value(?,?,?,?,?,?)";
    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setString(1, grado_titulo);
    		insert.setString(2, universidad);
    		insert.setInt(3, año_titulo);
    		insert.setString(4, pais);
    		insert.setString(5, nombre_titulo);
    		insert.setInt(6,cedula);
    		insert.execute(); 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }
    public int completarInformacionProfesionalCientifico(String actividad, String areainvestigacion, String institucion,String departamento, int año_inicio, String pais,int cedula){
    	try{
    		abrirConexionBD();
    		String query = "insert into micitt.informacion_profesional(actividad,areainvestigacion,institucion,departamento,anoinicio,pais,f_cedula) value(?,?,?,?,?,?,?)";
    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setString(1, actividad);
    		insert.setString(2, areainvestigacion);
    		insert.setString(3, institucion);
    		insert.setString(4, departamento);
    		insert.setInt(5, año_inicio);
    		insert.setString(6, pais);
    		insert.setInt(7,cedula);
    		insert.execute(); 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }

    public int insertarInfoAcademicaCientifico(int cedula){
    	try{
    		abrirConexionBD();
    		String query = "insert into informacion_academica(f_cedula) value(?)";
    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setInt(1, cedula);
    		insert.execute(); 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }

    public int insertarInfoProfesional(int cedula){
    	try{
    		abrirConexionBD();
    		String query = "insert into informacion_profesional(f_cedula) value(?)";
    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setInt(1, cedula);
    		insert.execute(); 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }
    
    public int insertarFoto(InputStream foto){
    	try{
    		abrirConexionBD();
    		String query = "INSERT INTO micitt.cientifico (foto) VALUES(?)";
    		PreparedStatement insert = (PreparedStatement) conexion.prepareStatement(query);
    		insert.setBlob(1, foto);
    		insert.execute(); 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }
    
    // ---------------------------- SELECT
    public String consultarRol(int cedula){
    	
    	String rol = null;
    	
    	try{
    		abrirConexionBD();
    		String query = "SELECT nombre_rol FROM micitt.usuario_rol where cedula ="+cedula;
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			rol = resultado.getString("nombre_rol");
   	    	  
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return rol;
    	
    	
    }
    public DTO_Cientifico consultarCientifico(int cedula){
    	DTO_Cientifico cientifico = new DTO_Cientifico();
    	try{
    		abrirConexionBD();
    		String query = "SELECT cedula,nombre, apellido1,apellido2,DATE_FORMAT(fecha_nacimiento, '%d-%m-%Y') as fecha_nacimiento ,sexo,provincia,canton, teltrabajo,celular,id_orcid,descripcion FROM cientifico where cedula ="+cedula;
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			    cientifico.setCedula(resultado.getInt("cedula"));
    				cientifico.setNombre(resultado.getString("nombre"));
        			cientifico.setApellido1(resultado.getString("apellido1"));
        			cientifico.setApellido2(resultado.getString("apellido2"));
        			cientifico.setFecha_nacimiento(resultado.getString("fecha_nacimiento"));
        			cientifico.setSexo(resultado.getString("sexo"));
        			cientifico.setProvincia(resultado.getString("provincia"));
        			cientifico.setCanton(resultado.getString("canton"));
        			cientifico.setTeltrabajo(resultado.getInt("teltrabajo"));
        			cientifico.setCelular(resultado.getInt("celular"));
        			cientifico.setOrcid(resultado.getString("id_orcid"));
        			cientifico.setDescripcion(resultado.getString("descripcion"));
    	    	
    			
   	    	  
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return cientifico;
    	
    	
    }
    public ArrayList consultarCientificoXNombre(String dato){
    	
    	ArrayList<String> listaCientificos = new ArrayList<String>();
    	
    	try{
    		abrirConexionBD();
    		String query = "SELECT cedula,nombre,apellido1,apellido2 FROM micitt.cientifico where apellido1 LIKE '%"+dato+"%' or apellido2 LIKE '%"+dato+"%' or nombre LIKE '%"+dato+"%'";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			if (consultarRol(resultado.getInt("cedula")).equals("ROLE_USER")){
    				listaCientificos.add(resultado.getInt("cedula")+" - "+resultado.getString("nombre")+" "+resultado.getString("apellido1")+" "+resultado.getString("apellido2"));	
    			}		
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return listaCientificos;
    	
    	
    }
    
 public ArrayList consultarCientificoLibre(){
    	
    	ArrayList<String> listaCientificos = new ArrayList<String>();
    	
    	try{
    		abrirConexionBD();
    		String query = "SELECT cedula,nombre,apellido1,apellido2 FROM micitt.cientifico where terminado=0";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			if (consultarRol(resultado.getInt("cedula")).equals("ROLE_USER")){
    				listaCientificos.add(resultado.getInt("cedula")+" - "+resultado.getString("nombre")+" "+resultado.getString("apellido1")+" "+resultado.getString("apellido2"));
    			}
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return listaCientificos;
    	
    	
    }
    
    public DTO_Cientifico consultarDatosPersonaTSE(int cedula){
    	DTO_Cientifico cientifico = new DTO_Cientifico();
    	cientifico.setCedula(cedula);
    	try{
    		abrirConexionBD();
    		String query = "select nombre, apellido1,apellido2,sexo,provincia,canton from PERSONA where cedula ="+cedula;
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			cientifico.setNombre(resultado.getString("nombre"));
    			cientifico.setApellido1(resultado.getString("apellido1"));
    			cientifico.setApellido2(resultado.getString("apellido2"));
    		    cientifico.setSexo(resultado.getString("sexo"));
    			cientifico.setProvincia(resultado.getString("provincia"));
    			cientifico.setCanton(resultado.getString("canton"));
    			System.out.println();
   	    	  
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return cientifico;
    	
    	
    }
    public ArrayList<Integer> consultarIdTituloPersonas(int cedula){
    	
    	ArrayList<Integer> ids_titulos = new ArrayList<Integer>();
    	try{
    		abrirConexionBD();
    		String query = "select id_titulo from micitt.informacion_academica where f_cedula ="+cedula+"";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			ids_titulos.add(Integer.parseInt(resultado.getString("id_titulo")));
    			
   	    	  
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return ids_titulos;
    	
    	
    }
    public ArrayList<Integer> consultarIdProfesionesPersonas(int cedula){
    	
    	ArrayList<Integer> ids_profesiones = new ArrayList<Integer>();
    	try{
    		abrirConexionBD();
    		String query = "select id_profesion from micitt.informacion_profesional where f_cedula ="+cedula+"";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			ids_profesiones.add(Integer.parseInt(resultado.getString("id_profesion")));
    			
   	    	  
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return ids_profesiones;
    	
    	
    }
    public String consultarContrasenaOlvidada(int cedula, String correo){
    	
    	 
    	String contrasena = null;
    	try{
    		abrirConexionBD();
    		String query = "select contrasena from micitt.usuario where cedula="+cedula+" and correo='"+correo+"'";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			contrasena = resultado.getString("contrasena");
    			
   	    	  
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return contrasena;
    	
    	
    }
    public String consultarCorreoUsuario(int cedula){
    	
   	 
    	String correoActual = null;
    	try{
    		abrirConexionBD();
    		String query = "select correo from micitt.usuario where cedula="+cedula+"";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			correoActual = resultado.getString("correo");
    			
   	    	  
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return correoActual;
    	
    	
    }
    public DTO_Academica consultarTitulosPersonas(int id_titulo,int cedula){
    	
		
    	DTO_Academica dto_academica = new DTO_Academica();
    	dto_academica.setCedula(cedula);
    	dto_academica.setId_titulo(id_titulo);
    	
    	try{
    		abrirConexionBD();
    		String query = "select grado,universidad,ano,pais,nombre from informacion_academica where f_cedula ="+cedula+" and id_titulo="+id_titulo+"";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			dto_academica.setGrado(resultado.getString("grado"));
    			dto_academica.setUniversidad(resultado.getString("universidad"));
   	    	    dto_academica.setAno(resultado.getInt("ano"));
   	    	    dto_academica.setPais(resultado.getString("pais"));
   	    	    dto_academica.setNombre(resultado.getString("nombre"));
   	    	    
   	    	    
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return dto_academica;
    	
    	
    }
    public DTO_Profesional consultarProfesionesPersonas(int id_profesion,int cedula){
    	
		
    	DTO_Profesional dto_profesional = new DTO_Profesional();
    	dto_profesional.setCedula(cedula);
    	dto_profesional.setId_profesion(id_profesion);
    	
    	try{
    		abrirConexionBD();
    		String query = "select actividad,areainvestigacion,institucion,departamento,anoinicio,pais from informacion_profesional where f_cedula ="+cedula+" and id_profesion="+id_profesion+"";
    		
    		Statement consulta = (Statement) conexion.createStatement();
    		ResultSet resultado = consulta.executeQuery(query);
    	    
    		while (resultado.next())
    	    {
    			
    			dto_profesional.setActividad(resultado.getString("actividad"));
    			dto_profesional.setAreainvestigacion(resultado.getString("areainvestigacion"));
    			dto_profesional.setInstitucion(resultado.getString("institucion"));
    			dto_profesional.setDepartamento(resultado.getString("departamento"));
    			dto_profesional.setAnoinicio(resultado.getInt("anoinicio"));
    			dto_profesional.setPais(resultado.getString("pais"));	
    	    }

    	
		}catch(SQLException | ClassNotFoundException e ){
			return null;
		}
		return dto_profesional;
    	
    	
    }
    public void consultarFotoCientifico(int cedula) throws IOException{
    	
		System.out.println("entró");
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/micitt","root","pepe1196");
            
            File file=new File("src/main/webapp/WEB-INF/pages/images/image1.jpg");
            FileOutputStream fos=new FileOutputStream(file);
            byte b[];
            Blob blob;
            
            PreparedStatement ps=(PreparedStatement) con.prepareStatement("select foto from micitt.cientifico where cedula=304900948"); 
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                blob=rs.getBlob("foto");
                b=blob.getBytes(1,(int)blob.length());
                fos.write(b);
            }
            
            ps.close();
            fos.close();
            con.close();
    	
		}catch(SQLException | ClassNotFoundException e ){
			
		}
    	System.out.print("sale");
    }
    //------------------------------------------------ UPDATE
    public void marcarCompletado(int cedula){
    	try{
    		
    		abrirConexionBD();
    		Statement actualizacion = (Statement) conexion.createStatement();
    		String query = "UPDATE micitt.cientifico SET terminado =1 WHERE cedula ="+cedula+"";
    	    actualizacion.executeUpdate(query);
    		 
    		conexion.close();
    	
    	}catch(SQLException | ClassNotFoundException e ){
    	
    	}
    }
    public int actualizarContrasena(int cedula,String correo,String contrasenaActual,String contrasenaNueva){
    	try{
    		
    		abrirConexionBD();
    		Statement actualizacion = (Statement) conexion.createStatement();
    		String query = "UPDATE micitt.usuario SET contrasena ='"+contrasenaNueva+"' WHERE cedula ="+cedula+" and correo='"+correo+"' and contrasena='"+contrasenaActual+"'";
    	    actualizacion.executeUpdate(query);
    		 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }
    
    public int actualizarCientifico(DTO_Cientifico cientifico){
    	try{
    		
    		abrirConexionBD();
    		Statement actualizacion = (Statement) conexion.createStatement();
    		String query= ""; 
    		
    		
        	if(cientifico.getFecha_nacimiento() != "")
        		query= "UPDATE micitt.cientifico SET nombre ='"+cientifico.getNombre()+"',apellido1='"+cientifico.getApellido1()+"',apellido2='"+cientifico.getApellido2()+"',fecha_nacimiento=DATE(STR_TO_DATE('"+cientifico.getFecha_nacimiento()+"', '%d-%m-%Y')),sexo='"+cientifico.getSexo()+"',provincia='"+cientifico.getProvincia()+"',canton='"+cientifico.getCanton()+"',teltrabajo="+cientifico.getTeltrabajo()+",celular="+cientifico.getCelular()+",id_orcid='"+cientifico.getOrcid()+"',descripcion='"+cientifico.getDescripcion()+"' WHERE cedula="+cientifico.getCedula()+"";
        	else
        		query= "UPDATE micitt.cientifico SET nombre ='"+cientifico.getNombre()+"',apellido1='"+cientifico.getApellido1()+"',apellido2='"+cientifico.getApellido2()+"',fecha_nacimiento=DATE(STR_TO_DATE(NULL, '%d-%m-%Y')),sexo='"+cientifico.getSexo()+"',provincia='"+cientifico.getProvincia()+"',canton='"+cientifico.getCanton()+"',teltrabajo="+cientifico.getTeltrabajo()+",celular="+cientifico.getCelular()+",id_orcid='"+cientifico.getOrcid()+"',descripcion='"+cientifico.getDescripcion()+"' WHERE cedula="+cientifico.getCedula()+"";
    		
    	    actualizacion.executeUpdate(query);
    		 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		System.out.print(e);
    		return 0;
    	}
    }
    public int actualizarInfoAcademica(int id_titulo,String nombre_titulo, String grado_titulo, String universidad,String pais, int año_titulo){
    	try{
    		
    		abrirConexionBD();
    		Statement actualizacion = (Statement) conexion.createStatement();
    		String query = "UPDATE micitt.informacion_academica  SET grado ='"+grado_titulo+"',universidad='"+universidad+"',pais='"+pais+"',nombre='"+nombre_titulo+"',ano="+año_titulo+" WHERE id_titulo="+id_titulo+"";
    		
    		actualizacion.executeUpdate(query);
    		 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		System.out.println(e);
    		return 0;
    	}
    }
    public int actualizarInfoProfesional(int id_profesion,String actividad, String areainvestigacion, String institucion,String departamento, int añoinicio,String pais){
    	try{
    		abrirConexionBD();
    		Statement actualizacion = (Statement) conexion.createStatement();
    		String query = "UPDATE micitt.informacion_profesional  SET actividad ='"+decode(actividad)+"',areainvestigacion='"+decode(areainvestigacion)+"',institucion='"+institucion+"',departamento='"+departamento+"',anoinicio="+añoinicio+",pais='"+decode(pais)+"' WHERE id_profesion="+id_profesion+"";
 
    		actualizacion.executeUpdate(query);
    		 
    		conexion.close();
    		return 1;	
    	}catch(SQLException | ClassNotFoundException e ){
    		return 0;
    	}
    }
    public String decode(String texto){
    
		try {
			String out = new String(texto.getBytes("ISO-8859-1"), "UTF-8");
			return out;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
    }
    
    public int cantidadInfoPersonal() throws ClassNotFoundException, SQLException{
    	// Creamos el Statement
    	abrirConexionBD();
    	 java.sql.Statement statement = conexion.createStatement();
    	 ResultSet resultSet = statement.executeQuery("select * from cientifico");
    	 int count = 0;
    	 while (resultSet.next()) {
    	 count++;
    	 } 
    	 return count;
    	
    	 }
    
    public int cantidadInfoAcademica() throws ClassNotFoundException, SQLException{
    	// Creamos el Statement
    	abrirConexionBD();
    	 java.sql.Statement statement = conexion.createStatement();
    	 ResultSet resultSet = statement.executeQuery("select * from informacion_academica");
    	 int count = 0;
    	 while (resultSet.next()) {
    	 count++;
    	 } 
    	 return count;
    	
    	 }  
    
    public DefaultTableModel getPersonal(DefaultTableModel dm) throws ClassNotFoundException, SQLException{
    	abrirConexionBD();
		dm.addColumn("Cedula");
		dm.addColumn("Nombre");
		dm.addColumn("Apellido 1");
		dm.addColumn("Apellido 2");
		dm.addColumn("Fecha de nacimiento");
		dm.addColumn("Sexo");
		dm.addColumn("Provicia");
		dm.addColumn("Canton");
		dm.addColumn("Telefono de trabajo");
		dm.addColumn("Celular");
		dm.addColumn("id Orcid");
		
		String sql = "SELECT cedula, nombre, apellido1,apellido2,DATE_FORMAT(fecha_nacimiento, '%d-%m-%Y') as fecha_nacimiento ,sexo,provincia,canton, teltrabajo,celular,id_orcid,descripcion FROM cientifico";
		
		Statement consulta = (Statement) conexion.createStatement();
		ResultSet resultado = consulta.executeQuery(sql);
		while(resultado.next()){
			String cedula = resultado.getString(1);
			String nombre = resultado.getString(2);
			String apellido1 = resultado.getString(3);
			String apellido2 = resultado.getString(4);
			String fecha = resultado.getString(5);
			String sexo = resultado.getString(6);
			String provincia = resultado.getString(7);
			String canton = resultado.getString(8);
			String telefono = resultado.getString(9);
			String celular = resultado.getString(10);
			String idorcid = resultado.getString(11);
			
			String[] rowdata = {cedula, nombre, apellido1, apellido2, fecha, sexo, provincia, canton, telefono, celular
					,idorcid}; 
			dm.addRow(rowdata);
			
		}
		return dm;
		
		
	}
    
    public DefaultTableModel getInfoAcademica(DefaultTableModel dm2) throws ClassNotFoundException, SQLException{
    	abrirConexionBD();
		dm2.addColumn("Cedula");
		dm2.addColumn("grado");
		dm2.addColumn("universidad");
		dm2.addColumn("ano");
		dm2.addColumn("nombre");
		
		String sql = "SELECT f_cedula, grado, universidad,ano, nombre FROM informacion_academica";
		
		Statement consulta = (Statement) conexion.createStatement();
		ResultSet resultado = consulta.executeQuery(sql);
		while(resultado.next()){
			String cedula = resultado.getString(1);
			String grado = resultado.getString(2);
			String universidad = resultado.getString(3);
			String ano = resultado.getString(4);
			String nombre = resultado.getString(5);
			
			
			String[] rowdata1 = {cedula, grado, universidad, ano, nombre}; 
			dm2.addRow(rowdata1);
			
		}
		return dm2;
		
		
	}
    
    public DefaultTableModel getInfoProfesional(DefaultTableModel dm2) throws ClassNotFoundException, SQLException{
    	abrirConexionBD();
		dm2.addColumn("Cedula");
		dm2.addColumn("actividad");
		dm2.addColumn("areainvestigacion");
		dm2.addColumn("institucion");
		dm2.addColumn("departamento");
		dm2.addColumn("ano");
		dm2.addColumn("pais");
		
		String sql = "SELECT f_cedula, actividad, areainvestigacion, institucion, departamento, anoinicio, pais FROM informacion_profesional";
		
		Statement consulta = (Statement) conexion.createStatement();
		ResultSet resultado = consulta.executeQuery(sql);
		while(resultado.next()){
			String cedula = resultado.getString(1);
			String actividad = resultado.getString(2);
			String area = resultado.getString(3);
			String institucion = resultado.getString(4);
			String departamento = resultado.getString(5);
			String ano = resultado.getString(6);
			String pais = resultado.getString(7);

					
			
			String[] rowdata1 = {cedula, actividad, area, institucion, departamento, ano, pais}; 
			dm2.addRow(rowdata1);
			
		}
		return dm2;
		
		
	}
    
}