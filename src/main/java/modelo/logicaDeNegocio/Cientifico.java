package modelo.logicaDeNegocio;

import java.util.ArrayList;

import modelo.dto.DTO_Cientifico;
import modelo.enlaceDeDatos.Singleton_MySQL;

/**
 * 
 * @author Equipo vivo
 * Ernesto Brenes C.
 * David Ceciliano S.
 * José D Navarro 
 * @version 1.0
 * 
 * Clase científico se encarga de insertar los datos de un cientifico en la base de datos
 * 
 */

public class Cientifico {
	
	/**
	 * 
	 * @param nvoCientifico DTO con los datos del cientifico
	 * @return 1 si los datos se insertan correctamente, 0 en caso contrario.
	 * 
	 */
	public static int insertarCientifico(DTO_Cientifico nvoCientifico){
		
		int resultado_0 = Singleton_MySQL.getInstancia().insertarUsuario( nvoCientifico ); 
		
		if(resultado_0 ==1)
		{
			int resultado_1 = Singleton_MySQL.getInstancia().insertarRolAdministrador( nvoCientifico.getCedula() );
			int resultado_2 = Singleton_MySQL.getInstancia().insertarCientifico(Singleton_MySQL.getInstancia().consultarDatosPersonaTSE(nvoCientifico.getCedula()));
			int resultado_3 = Singleton_MySQL.getInstancia().insertarInfoAcademicaCientifico(nvoCientifico.getCedula());
			int resultado_4 = Singleton_MySQL.getInstancia().insertarInfoProfesional(nvoCientifico.getCedula());			
			if (resultado_1 == 1 && resultado_2 == 1 && resultado_3 == 1 && resultado_4 == 1 )
			return 1;
		}
		
		return 0;
	}
	
	public static DTO_Cientifico consultarCientifico(int cedula){
		DTO_Cientifico cientifico = new DTO_Cientifico();
		return cientifico;
	}
	public static int actualizarCientifico(DTO_Cientifico cientifico){
		
		return Singleton_MySQL.getInstancia().actualizarCientifico(cientifico);
	}
	public static ArrayList<Integer> consultarIdInformacionAcademica(int cedula){
		
		return Singleton_MySQL.getInstancia().consultarIdTituloPersonas(cedula);
	}
	public static ArrayList<Integer> consultarIdActividadesProfesionales(int cedula){
		
		return Singleton_MySQL.getInstancia().consultarIdProfesionesPersonas(cedula);
	}
 
    public static int actualizarInfoAcademica(int id_titulo,String nombre_titulo, String grado_titulo, String universidad,String pais, int ano_titulo){
		
		return Singleton_MySQL.getInstancia().actualizarInfoAcademica(id_titulo, nombre_titulo, grado_titulo, universidad, pais, ano_titulo);
	}
    public static int actualizarInfoProfesional(int id_profesion, String actividad, String areainvestigacion, String institucion,String departamento, int anoinicio,String pais){
		
		return Singleton_MySQL.getInstancia().actualizarInfoProfesional(id_profesion, actividad, areainvestigacion, institucion, departamento, anoinicio, pais);
	}
    public static int completarInformacionAcademicaCientifico(String nombre_titulo, String grado_titulo, String universidad,String pais, int ano_titulo, int cedula){
		
		return Singleton_MySQL.getInstancia().completarInformacionAcademicaCientifico(nombre_titulo, grado_titulo, universidad, pais,  ano_titulo,  cedula);
	}
    public static int completarInformacionProfesionalCientifico(String actividad,String areainvestigacion, String institucion, String departamento, int ano_inicio, String pais, int cedula){
		
		return Singleton_MySQL.getInstancia().completarInformacionProfesionalCientifico(actividad, areainvestigacion, institucion, departamento, ano_inicio, pais, cedula);
	}
}
