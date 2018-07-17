package modelo.enlaceDeDatos;

public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println(Singleton_MySQL.getInstancia().consultarCientifico(304880360));
		//System.out.println(Singleton_MySQL.getInstancia());
		
		System.out.println(Singleton_MySQL.getInstancia().consultarCientificoXNombre("David"));


	}

}
