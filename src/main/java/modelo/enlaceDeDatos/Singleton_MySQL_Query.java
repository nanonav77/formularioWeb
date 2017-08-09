package modelo.enlaceDeDatos;

public class Singleton_MySQL_Query {
	
	private static MySQL_Query instanciaBDMySQL = null;
	
	public static synchronized MySQL_Query getInstancia(){
		
		if(instanciaBDMySQL == null){
			instanciaBDMySQL = new MySQL_Query();
		}
		return instanciaBDMySQL;
	}
	
	

}