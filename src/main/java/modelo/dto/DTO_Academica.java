package modelo.dto;

public class DTO_Academica {
	 
	private int id_titulo;
	private String grado;
	private String universidad;
	private int ano;
	private String pais;
	private String nombre;
	private int cedula;
	
	public int getId_titulo() {
		return id_titulo;
	}
	public void setId_titulo(int id_titulo) {
		this.id_titulo = id_titulo;
	}
	public String getGrado() {
		return grado;
	}
	public void setGrado(String grado) {
		this.grado = grado;
	}
	public String getUniversidad() {
		return universidad;
	}
	public void setUniversidad(String universidad) {
		this.universidad = universidad;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCedula() {
		return cedula;
	}
	public void setCedula(int cedula) {
		this.cedula = cedula;
	}
}
