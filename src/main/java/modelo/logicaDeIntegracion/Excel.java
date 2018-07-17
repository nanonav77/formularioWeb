package modelo.logicaDeIntegracion;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;
import java.util.TreeMap;

import javax.swing.table.DefaultTableModel;

import modelo.enlaceDeDatos.MySQL;
import modelo.enlaceDeDatos.Singleton_MySQL;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.sl.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;

public class Excel {
	
	private HSSFWorkbook wb;
	private HSSFSheet InfoPersonal;
	private HSSFSheet InfoAcademica;
	private HSSFSheet InfoProfesional;
	private int cantidadInfoPersonal;
	private int cantidadInfoAcademica;
	DefaultTableModel dm;
	DefaultTableModel ac;
	DefaultTableModel ap;
	
	public Excel() throws ClassNotFoundException, SQLException{
		
		 wb = new HSSFWorkbook();
	     InfoPersonal = wb.createSheet("Info personal");
	     InfoAcademica = wb.createSheet("Info academica");
	     InfoProfesional = wb.createSheet("Info Profesional");
	     this.ac = this.getAcademica();
	     this.dm = this.getPersonal();
	     this.ap = this.getProfesional();
	}
	
	public HSSFWorkbook getWb() {
		return wb;
	}

	public void setWb(HSSFWorkbook wb) {
		this.wb = wb;
	}

	public HSSFSheet getInfoPersonal() {
		return InfoPersonal;
	}

	public void setInfoPersonal(HSSFSheet infoPersonal) {
		InfoPersonal = infoPersonal;
	}

	public void crearFilaPrincipal(){
		HSSFRow row = this.InfoPersonal.createRow(0);
		row.createCell(0).setCellValue("Cedula");
		row.createCell(1).setCellValue("Nombre");
		row.createCell(2).setCellValue("Apellido 1");
		row.createCell(3).setCellValue("Apellido 2");
		row.createCell(4).setCellValue("Fecha de nacimiento");
		row.createCell(5).setCellValue("Sexo");
		row.createCell(6).setCellValue("Provincia");
		row.createCell(7).setCellValue("Canton");
		row.createCell(8).setCellValue("Telefono de trabajo");
		row.createCell(9).setCellValue("Celular");
		row.createCell(10).setCellValue("Id.Orcid");
	}
	
	
	public void insertarInfoPersonal() throws ClassNotFoundException, SQLException{
		int fila = 1;
		for(int i =0; i<=this.cantidadInfoPersonal;i++){
			
		}
		
	}
	//String query = "SELECT nombre, apellido1,apellido2,DATE_FORMAT(fecha_nacimiento, '%d-%m-%Y') as fecha_nacimiento ,
	//sexo,provincia,canton, teltrabajo,celular,id_orcid,descripcion FROM cientifico where cedula ="+cedula;

	public DefaultTableModel getPersonal() throws ClassNotFoundException, SQLException{
		MySQL instancia = Singleton_MySQL.getInstancia();
		return instancia.getPersonal(new DefaultTableModel());
		
		
	}
	
	public DefaultTableModel getAcademica() throws ClassNotFoundException, SQLException{
		MySQL instancia = Singleton_MySQL.getInstancia();
		return instancia.getInfoAcademica(new DefaultTableModel());
		
		
	}
	
	public DefaultTableModel getProfesional() throws ClassNotFoundException, SQLException{
		MySQL instancia = Singleton_MySQL.getInstancia();
		return instancia.getInfoProfesional(new DefaultTableModel());
		
		
	}
	
	/*private int cantidadInfoPersonal() throws ClassNotFoundException, SQLException{
		MySQL instancia = Singleton_MySQL.getInstancia();
		
		return instancia.cantidadInfoPersonal();
	}*/
	
	/*private int cantidadInfoAcademica() throws ClassNotFoundException, SQLException{
		MySQL instancia = Singleton_MySQL.getInstancia();
		
		return instancia.cantidadInfoAcademica();
	}*/
	
	private String getCellValue(int x,int y) throws ClassNotFoundException, SQLException{
		try{
		return dm.getValueAt(x, y).toString();
		}
		catch(NullPointerException e){
			return "";
		}
	}
	
	private String getCellValueIP(int x,int y) throws ClassNotFoundException, SQLException{
		try{
		return ac.getValueAt(x, y).toString();
		}
		catch(NullPointerException e){
			return "";
		}
	}
	
	private String getCellValueProfecional(int x,int y) throws ClassNotFoundException, SQLException{
		try{
		return ap.getValueAt(x, y).toString();
		}
		catch(NullPointerException e){
			return "";
		}
	}
	
	public void escribirExcel() throws ClassNotFoundException, SQLException{
		 
		TreeMap<String, Object[]> data = new TreeMap<String, Object[]>();
		data.put("-1", new Object[]{dm.getColumnName(0), dm.getColumnName(1),dm.getColumnName(2),dm.getColumnName(3),dm.getColumnName(4),
				dm.getColumnName(5),dm.getColumnName(6),dm.getColumnName(7),dm.getColumnName(8),dm.getColumnName(9),dm.getColumnName(10)});
		
		for(int i =0; i<dm.getRowCount(); i++){
			data.put(Integer.toString(i), new Object[]{getCellValue(i,0),getCellValue(i,1),getCellValue(i,2), getCellValue(i,3), getCellValue(i,4),
					getCellValue(i,5), getCellValue(i,6), getCellValue(i,7),getCellValue(i,8), getCellValue(i,9), getCellValue(i,10)});
		}
		
		Set<String> ids = data.keySet();
		HSSFRow row;
		int rowID = 0;
		
		for(String key: ids){
			row = this.InfoPersonal.createRow(rowID++);
			Object[] values = data.get(key);
			
			int celID = 0;
			
			for(Object o: values){
				Cell cell = row.createCell(celID++);
				cell.setCellValue(o.toString());
			}
		}
	}
	
	public void escribirExcelAcademica() throws ClassNotFoundException, SQLException{
		 
		TreeMap<String, Object[]> data = new TreeMap<String, Object[]>();
		data.put("-1", new Object[]{ac.getColumnName(0), ac.getColumnName(1),ac.getColumnName(2),ac.getColumnName(3),ac.getColumnName(4)});
		
		for(int i =0; i<ac.getRowCount(); i++){
			data.put(Integer.toString(i), new Object[]{getCellValueIP(i,0),getCellValueIP(i,1),getCellValueIP(i,2), getCellValueIP(i,3), getCellValueIP(i,4)});
		}
		
		Set<String> ids = data.keySet();
		HSSFRow row;
		int rowID = 0;
		
		for(String key: ids){
			row = this.InfoAcademica.createRow(rowID++);
			Object[] values = data.get(key);
			
			int celID = 0;
			
			for(Object o: values){
				Cell cell = row.createCell(celID++);
				cell.setCellValue(o.toString());
			}
		}
	}
	
	public void escribirExcelProfesional() throws ClassNotFoundException, SQLException{
		 
		TreeMap<String, Object[]> data = new TreeMap<String, Object[]>();
		data.put("-1", new Object[]{ap.getColumnName(0), ap.getColumnName(1),ap.getColumnName(2),ap.getColumnName(3),ap.getColumnName(4), ap.getColumnName(5), ap.getColumnName(6)});
		
		for(int i =0; i<ap.getRowCount(); i++){
			data.put(Integer.toString(i), new Object[]{getCellValueProfecional(i,0),getCellValueProfecional(i,1),getCellValueProfecional(i,2), getCellValueProfecional(i,3), getCellValueProfecional(i,4), getCellValueProfecional(i,5), getCellValueProfecional(i,6)});
		}
		
		Set<String> ids = data.keySet();
		HSSFRow row;
		int rowID = 0;
		
		for(String key: ids){
			row = this.InfoProfesional.createRow(rowID++);
			Object[] values = data.get(key);
			
			int celID = 0;
			
			for(Object o: values){
				Cell cell = row.createCell(celID++);
				cell.setCellValue(o.toString());
			}
		}
	}
	
	public static void main (String [ ] args) throws IOException, ClassNotFoundException, SQLException {
		
		Excel ex = new Excel();
		ex.escribirExcelProfesional();
		//ex.escribirExcelProfesional();
		//ex.escribirExcel();
		//ex.escribirExcelAcademica();
		//System.out.println(ex.cantidadInfoAcademica);
		System.out.println(ex.getCellValueProfecional(0, 0).toString());



}

}
