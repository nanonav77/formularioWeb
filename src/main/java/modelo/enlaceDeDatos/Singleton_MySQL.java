package modelo.enlaceDeDatos;

public class Singleton_MySQL {
	
	private static MySQL instanciaBDMySQL = null;
	
	public static synchronized MySQL  getInstancia(){
		
		if(instanciaBDMySQL == null){
			instanciaBDMySQL = new MySQL();
		}
		return instanciaBDMySQL;
	}
	
	

}