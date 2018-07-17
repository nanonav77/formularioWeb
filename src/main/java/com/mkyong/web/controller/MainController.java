package com.mkyong.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dto.DTO_Academica;
import modelo.dto.DTO_Cientifico;
import modelo.dto.DTO_Profesional;
import modelo.enlaceDeDatos.Singleton_MySQL;
import modelo.logicaDeIntegracion.Email;
import modelo.logicaDeIntegracion.Excel;
import modelo.logicaDeNegocio.Cientifico;
import modelo.logicaDeNegocio.DatabaseImageExample;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.solr.client.solrj.SolrServerException;
import org.omg.CORBA.portable.InputStream;
import org.springframework.asm.commons.Method;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
 		
	
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");

		return model;
	
	}
	
	
	@RequestMapping(value = "/inicio**", method = RequestMethod.GET)
	public ModelAndView adminPage(HttpServletRequest request) throws IOException {
		request.getUserPrincipal().getName();
		ModelAndView model = new ModelAndView();
		if (request.getUserPrincipal().getName() != null){
			int cedula = Integer.parseInt(request.getUserPrincipal().getName());
			DTO_Cientifico datosCientifico = Singleton_MySQL.getInstancia().consultarCientifico(cedula);
			
			
			String rol = Singleton_MySQL.getInstancia().consultarRol(cedula);
			model.addObject("rol_auxi", rol);
			
			if(rol.equals("ROLE_ADMIN")){
				
			}
			else{
				model.addObject("cedula", cedula);
				model.addObject("nombre", datosCientifico.getNombre());
				model.addObject("apellido1", datosCientifico.getApellido1());
				model.addObject("apellido2", datosCientifico.getApellido2());
				model.addObject("sexo", datosCientifico.getSexo());
				model.addObject("fecha_nacimiento", datosCientifico.getFecha_nacimiento());
				model.addObject("provincia", datosCientifico.getProvincia());
				model.addObject("canton", datosCientifico.getCanton());
				model.addObject("correo_actual", Singleton_MySQL.getInstancia().consultarCorreoUsuario(cedula));
				
				if(datosCientifico.getTeltrabajo() == 0)
					model.addObject("telefono", null);
				else
					model.addObject("telefono", datosCientifico.getTeltrabajo());
				
				if(datosCientifico.getCelular() ==0)
					model.addObject("celular", null);
				else
					model.addObject("celular", datosCientifico.getCelular());
				
				model.addObject("orcid", datosCientifico.getOrcid());
				model.addObject("descripcion", datosCientifico.getDescripcion());
				
				if(Cientifico.consultarIdInformacionAcademica(cedula).size()!=0){
					
					DTO_Academica datosTitulo1 = Singleton_MySQL.getInstancia().consultarTitulosPersonas(Cientifico.consultarIdInformacionAcademica(cedula).get(0), cedula);
					model.addObject("nombre_tit1", datosTitulo1.getNombre());
					
					
					model.addObject("grado_tit1", datosTitulo1.getGrado());
					model.addObject("univ_tit1", datosTitulo1.getUniversidad());
					model.addObject("pais_tit1", datosTitulo1.getPais());
					
					if(datosTitulo1.getAno() ==0)
						model.addObject("ano_tit1", null);
					else
						model.addObject("ano_tit1", datosTitulo1.getAno());
					
				}
				
				if(Cientifico.consultarIdInformacionAcademica(cedula).size()>1){
					
					DTO_Academica datosTitulo2 = Singleton_MySQL.getInstancia().consultarTitulosPersonas(Cientifico.consultarIdInformacionAcademica(cedula).get(1), cedula);
					model.addObject("nombre_tit2", datosTitulo2.getNombre());
					model.addObject("grado_tit2", datosTitulo2.getGrado());
					model.addObject("univ_tit2", datosTitulo2.getUniversidad());
					model.addObject("pais_tit2", datosTitulo2.getPais());
					
					if(datosTitulo2.getAno() ==0)
						model.addObject("ano_tit2", null);
					else
						model.addObject("ano_tit2", datosTitulo2.getAno());
					
				}
				
				if(Cientifico.consultarIdInformacionAcademica(cedula).size()>2){
				
					DTO_Academica datosTitulo3 = Singleton_MySQL.getInstancia().consultarTitulosPersonas(Cientifico.consultarIdInformacionAcademica(cedula).get(2), cedula);
					model.addObject("nombre_tit3", datosTitulo3.getNombre());
					model.addObject("grado_tit3", datosTitulo3.getGrado());
					model.addObject("univ_tit3", datosTitulo3.getUniversidad());
					model.addObject("pais_tit3", datosTitulo3.getPais());
	
					if(datosTitulo3.getAno() ==0)
						model.addObject("ano_tit3", null);
					else
						model.addObject("ano_tit3", datosTitulo3.getAno());
					
				}
				
				if(Cientifico.consultarIdActividadesProfesionales(cedula).size()!=0){
					
					DTO_Profesional datosProfesional1 = Singleton_MySQL.getInstancia().consultarProfesionesPersonas(Cientifico.consultarIdActividadesProfesionales(cedula).get(0), cedula);
					model.addObject("nombre_act1", datosProfesional1.getActividad());
					model.addObject("area_act1", datosProfesional1.getAreainvestigacion());
					model.addObject("insti_act1", datosProfesional1.getInstitucion());
					model.addObject("depart_act1", datosProfesional1.getDepartamento());
					model.addObject("pais_act1", datosProfesional1.getPais());
					
					if(datosProfesional1.getAnoinicio() == 0)
						model.addObject("anoinicio_act1", null);
					else
						model.addObject("anoinicio_act1", datosProfesional1.getAnoinicio());
				}
				if(Cientifico.consultarIdActividadesProfesionales(cedula).size()>1){
					
					DTO_Profesional datosProfesional2 = Singleton_MySQL.getInstancia().consultarProfesionesPersonas(Cientifico.consultarIdActividadesProfesionales(cedula).get(1), cedula);
					model.addObject("nombre_act2", datosProfesional2.getActividad());
					model.addObject("area_act2", datosProfesional2.getAreainvestigacion());
					model.addObject("insti_act2", datosProfesional2.getInstitucion());
					model.addObject("depart_act2", datosProfesional2.getDepartamento());
					model.addObject("pais_act2", datosProfesional2.getPais());
					if(datosProfesional2.getAnoinicio() == 0)
						model.addObject("anoinicio_act2", null);
					else
						model.addObject("anoinicio_act2", datosProfesional2.getAnoinicio());				
				}
				if(Cientifico.consultarIdActividadesProfesionales(cedula).size()>2){
					
					DTO_Profesional datosProfesional3 = Singleton_MySQL.getInstancia().consultarProfesionesPersonas(Cientifico.consultarIdActividadesProfesionales(cedula).get(2), cedula);
					model.addObject("nombre_act3", datosProfesional3.getActividad());
					model.addObject("area_act3", datosProfesional3.getAreainvestigacion());
					model.addObject("insti_act3", datosProfesional3.getInstitucion());
					model.addObject("depart_act3", datosProfesional3.getDepartamento());
					if(datosProfesional3.getAnoinicio() == 0)
						model.addObject("anoinicio_act3", null);
					else
						model.addObject("anoinicio_act3", datosProfesional3.getAnoinicio());
					model.addObject("pais_act3", datosProfesional3.getPais());
				}
			}
			//DatabaseImageExample.fotino(); 
			model.setViewName("index");
			return model;			
		}

		//DatabaseImageExample.fotino(); 
		model.setViewName("index");
		return model;			


	}	
	@RequestMapping(value="/forgetForm", method = RequestMethod.POST)
    public ModelAndView recordarpassword(@RequestParam("cedulaE") int cedula,@RequestParam("correoE") String correo) throws MessagingException  {

    	ModelAndView model = new ModelAndView();
    	
    	String contrasena = Singleton_MySQL.getInstancia().consultarContrasenaOlvidada(cedula, correo);
       
    	
        if( contrasena == null){
        	model.addObject("error", "El correo o la cédula no son los correctos");
        }
        else {
			Email.enviarCorreo(correo, Integer.toString(cedula), contrasena,"Sus datos personales son los siguientes:","Recordar Contraseña");
			model.addObject("msg", "La contraseña ha sido enviada correctamente!.");
		}	
        		
        model.setViewName("login");
        return model;
    }
   
	
	
	@RequestMapping(value="/buscarTodos", method = RequestMethod.POST)
    public ModelAndView buscarTodos(@RequestParam("buscar_ced") String cedulaBuscada ,@RequestParam("buscar_nombre") String nombreBuscado,@RequestParam("determinarRol") String rolDeterminado,@RequestParam("determinarAccion") String accionDeterminada) throws MessagingException  {

		
    	ModelAndView model = new ModelAndView();
    	model.addObject("rol_auxi", rolDeterminado);
  
    	
    	if(accionDeterminada.equals("connombre")){
    		 
    		if(nombreBuscado.equals("")){ 
        		model.addObject("resultadoBusqueda","Debe ingresar un nombre o apellido");
        	}
    		else{
    			model.addObject("resultadoBusqueda",Singleton_MySQL.getInstancia().consultarCientificoXNombre(nombreBuscado));
    		}
    	}
    	
    	if(accionDeterminada.equals("concedula")){
    		
    		if(cedulaBuscada.equals("")){ 
        		cedulaBuscada = "0";
        	}
    		
    		DTO_Cientifico datosCientifico = Singleton_MySQL.getInstancia().consultarCientifico( Integer.parseInt(cedulaBuscada));
    		
    		if(datosCientifico.getCedula()==0 || datosCientifico.getNombre()==null || Singleton_MySQL.getInstancia().consultarRol(Integer.parseInt(cedulaBuscada)).equals("ROLE_ADMIN")){
    			model.addObject("resultadoBusqueda","La identificacion ingresada no corresponde con ningun usuario registrado");
    		}
    		else{
    			model.addObject("resultadoBusqueda", cedulaBuscada+" - "+datosCientifico.getNombre()+" "+datosCientifico.getApellido1()+" "+datosCientifico.getApellido2());
    		}
    	}
    	if(accionDeterminada.equals("consolicitud")){
    		
    			model.addObject("resultadoBusqueda",Singleton_MySQL.getInstancia().consultarCientificoLibre());
    		
    	}
        model.setViewName("index");
        return model;
    }
	
	@RequestMapping(value="/consultaAdministrador", method = RequestMethod.POST)
    public ModelAndView consultaAdministrador(@RequestParam("cientificoSeleccionado") String cientificoSeleccionado,@RequestParam("determinarRol2") String rolDeterminado) throws MessagingException  {

    	ModelAndView model = new ModelAndView();
    	model.addObject("rol_auxi", rolDeterminado);
        
    	if(!cientificoSeleccionado.equals("")){
    		
    		String cedula = cientificoSeleccionado.substring(0,9);
    		
	    	DTO_Cientifico datosCientifico = Singleton_MySQL.getInstancia().consultarCientifico(Integer.parseInt(cedula));
	    	
	    	model.addObject("cedula", cedula);
			model.addObject("nombre", datosCientifico.getNombre());
			model.addObject("apellido1", datosCientifico.getApellido1());
			model.addObject("apellido2", datosCientifico.getApellido2());
			model.addObject("sexo", datosCientifico.getSexo());
			model.addObject("fecha_nacimiento", datosCientifico.getFecha_nacimiento());
			model.addObject("provincia", datosCientifico.getProvincia());
			model.addObject("canton", datosCientifico.getCanton());
			model.addObject("correo_actual", Singleton_MySQL.getInstancia().consultarCorreoUsuario(Integer.parseInt(cedula)));
			
			if(datosCientifico.getTeltrabajo() == 0)
				model.addObject("telefono", null);
			else
				model.addObject("telefono", datosCientifico.getTeltrabajo());
			
			if(datosCientifico.getCelular() ==0)
				model.addObject("celular", null);
			else
				model.addObject("celular", datosCientifico.getCelular());
			
			model.addObject("orcid", datosCientifico.getOrcid());
			model.addObject("descripcion", datosCientifico.getDescripcion());
			
			if(Cientifico.consultarIdInformacionAcademica(Integer.parseInt(cedula)).size()!=0){
				
				DTO_Academica datosTitulo1 = Singleton_MySQL.getInstancia().consultarTitulosPersonas(Cientifico.consultarIdInformacionAcademica(Integer.parseInt(cedula)).get(0), Integer.parseInt(cedula));
				model.addObject("nombre_tit1", datosTitulo1.getNombre());
				
				
				model.addObject("grado_tit1", datosTitulo1.getGrado());
				model.addObject("univ_tit1", datosTitulo1.getUniversidad());
				model.addObject("pais_tit1", datosTitulo1.getPais());
				
				if(datosTitulo1.getAno() ==0)
					model.addObject("ano_tit1", null);
				else
					model.addObject("ano_tit1", datosTitulo1.getAno());
				
			}
			if(Cientifico.consultarIdInformacionAcademica(Integer.parseInt(cedula)).size()>1){
				
				DTO_Academica datosTitulo2 = Singleton_MySQL.getInstancia().consultarTitulosPersonas(Cientifico.consultarIdInformacionAcademica(Integer.parseInt(cedula)).get(1), Integer.parseInt(cedula));
				model.addObject("nombre_tit2", datosTitulo2.getNombre());
				model.addObject("grado_tit2", datosTitulo2.getGrado());
				model.addObject("univ_tit2", datosTitulo2.getUniversidad());
				model.addObject("pais_tit2", datosTitulo2.getPais());
				
				if(datosTitulo2.getAno() ==0)
					model.addObject("ano_tit2", null);
				else
					model.addObject("ano_tit2", datosTitulo2.getAno());
				
			}
			
			if(Cientifico.consultarIdInformacionAcademica(Integer.parseInt(cedula)).size()>2){
			
				DTO_Academica datosTitulo3 = Singleton_MySQL.getInstancia().consultarTitulosPersonas(Cientifico.consultarIdInformacionAcademica(Integer.parseInt(cedula)).get(2), Integer.parseInt(cedula));
				model.addObject("nombre_tit3", datosTitulo3.getNombre());
				model.addObject("grado_tit3", datosTitulo3.getGrado());
				model.addObject("univ_tit3", datosTitulo3.getUniversidad());
				model.addObject("pais_tit3", datosTitulo3.getPais());
	
				if(datosTitulo3.getAno() ==0)
					model.addObject("ano_tit3", null);
				else
					model.addObject("ano_tit3", datosTitulo3.getAno());
				
			}
			
			if(Cientifico.consultarIdActividadesProfesionales(Integer.parseInt(cedula)).size()!=0){
				
				DTO_Profesional datosProfesional1 = Singleton_MySQL.getInstancia().consultarProfesionesPersonas(Cientifico.consultarIdActividadesProfesionales(Integer.parseInt(cedula)).get(0),Integer.parseInt(cedula));
				model.addObject("nombre_act1", datosProfesional1.getActividad());
				model.addObject("area_act1", datosProfesional1.getAreainvestigacion());
				model.addObject("insti_act1", datosProfesional1.getInstitucion());
				model.addObject("depart_act1", datosProfesional1.getDepartamento());
				model.addObject("pais_act1", datosProfesional1.getPais());
				
				if(datosProfesional1.getAnoinicio() == 0)
					model.addObject("anoinicio_act1", null);
				else
					model.addObject("anoinicio_act1", datosProfesional1.getAnoinicio());
			}
			if(Cientifico.consultarIdActividadesProfesionales(Integer.parseInt(cedula)).size()>1){
				
				DTO_Profesional datosProfesional2 = Singleton_MySQL.getInstancia().consultarProfesionesPersonas(Cientifico.consultarIdActividadesProfesionales(Integer.parseInt(cedula)).get(1),Integer.parseInt(cedula));
				model.addObject("nombre_act2", datosProfesional2.getActividad());
				model.addObject("area_act2", datosProfesional2.getAreainvestigacion());
				model.addObject("insti_act2", datosProfesional2.getInstitucion());
				model.addObject("depart_act2", datosProfesional2.getDepartamento());
				model.addObject("pais_act2", datosProfesional2.getPais());
				if(datosProfesional2.getAnoinicio() == 0)
					model.addObject("anoinicio_act2", null);
				else
					model.addObject("anoinicio_act2", datosProfesional2.getAnoinicio());				
			}
			if(Cientifico.consultarIdActividadesProfesionales(Integer.parseInt(cedula)).size()>2){
				
				DTO_Profesional datosProfesional3 = Singleton_MySQL.getInstancia().consultarProfesionesPersonas(Cientifico.consultarIdActividadesProfesionales(Integer.parseInt(cedula)).get(2),Integer.parseInt(cedula));
				model.addObject("nombre_act3", datosProfesional3.getActividad());
				model.addObject("area_act3", datosProfesional3.getAreainvestigacion());
				model.addObject("insti_act3", datosProfesional3.getInstitucion());
				model.addObject("depart_act3", datosProfesional3.getDepartamento());
				if(datosProfesional3.getAnoinicio() == 0)
					model.addObject("anoinicio_act3", null);
				else
					model.addObject("anoinicio_act3", datosProfesional3.getAnoinicio());
				model.addObject("pais_act3", datosProfesional3.getPais());
			}
    	}
        model.setViewName("index");
        return model;
    }
	@RequestMapping(value="/registrar", method = RequestMethod.POST)
    public ModelAndView forgotpassword(@RequestParam("cedula") int cedula,@RequestParam("correo") String correo,@RequestParam("contrasena") String contrasena)  {

    	ModelAndView model = new ModelAndView();
    	
    	DTO_Cientifico nvoUsuario = new DTO_Cientifico();
    	nvoUsuario.setCedula(cedula);
    	nvoUsuario.setCorreo(correo);
    	nvoUsuario.setContrasena(contrasena);
        
        if(Cientifico.insertarCientifico(nvoUsuario) != 1)
        	model.addObject("error", "El número de cédula que intenta registrar ya esta en uso.");
        else
        	Email.enviarCorreo(nvoUsuario.getCorreo(), Integer.toString(nvoUsuario.getCedula()), nvoUsuario.getContrasena(),"El registro ha sido exitoso!!","Confirmación de Registro");
        	model.addObject("msg", "Te has registrado con Éxito.");
        
        model.setViewName("login");
        return model;
    }
	
	   @RequestMapping(value = "/foto", method = RequestMethod.POST)
	    public String handleFormUpload(
	            @RequestParam("file") MultipartFile file) throws IOException {

	        if (!file.isEmpty()) {
	        	System.out.println("entro ssdsdsd");
	        }

	        return "redirect:/inicio";
	    }	
	
	
	
    @RequestMapping(value="/guardar1", method = RequestMethod.POST)
    public String guardarSeccion1(@RequestParam("ced") int cedula,@RequestParam("nombre") String nombre,@RequestParam("apellido_1") String apellido1,@RequestParam("apellido_2") String apellido2,@RequestParam("fch-nacimiento") String fecha_nacimiento,@RequestParam("genero") String genero,@RequestParam("provincia") String provincia,@RequestParam("cantonElejido") String canton,@RequestParam("celular") String celular,@RequestParam("tel-trabajo") String tel_trabajo,@RequestParam("id-orcid") String id_orcid,@RequestParam("descripcion") String descripcion) throws IOException{
    	
            

    	ModelAndView model = new ModelAndView();
    	DTO_Cientifico actualizarUsuario = new DTO_Cientifico();
    	actualizarUsuario.setCedula(cedula);
    	actualizarUsuario.setNombre(new String(nombre.getBytes("ISO-8859-1"),"UTF-8"));
    	actualizarUsuario.setApellido1(new String(apellido1.getBytes("ISO-8859-1"),"UTF-8"));
    	actualizarUsuario.setApellido2(new String(apellido2.getBytes("ISO-8859-1"),"UTF-8"));
    	actualizarUsuario.setFecha_nacimiento(fecha_nacimiento);
    	actualizarUsuario.setSexo(genero);
 
    	actualizarUsuario.setProvincia(new String(provincia.getBytes("ISO-8859-1"),"UTF-8"));
    	actualizarUsuario.setCanton(new String(canton.getBytes("ISO-8859-1"),"UTF-8"));
    	actualizarUsuario.setOrcid(id_orcid);
    	actualizarUsuario.setDescripcion(new String(descripcion.getBytes("ISO-8859-1"),"UTF-8"));
    
    	//Singleton_MySQL.getInstancia().insertarFoto(file.getInputStream());
    	
    	
    	if(celular == "")
    	{
    		actualizarUsuario.setCelular(0);
    	}
    	else
    		actualizarUsuario.setCelular(Integer.parseInt(celular));
   

    	if(tel_trabajo == "")
    		actualizarUsuario.setTeltrabajo(0);
    	else
    		actualizarUsuario.setTeltrabajo(Integer.parseInt(tel_trabajo));	
    	
    	
        if(Cientifico.actualizarCientifico(actualizarUsuario) != 1){
        	System.out.println("error");
        	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
        }
        else
        	model.addObject("msg", "Se ha guardado con Éxito.");
        
        
        //Singleton_MySQL.getInstancia().consultarFotoCientifico(cedula);
        
        model.setViewName("index");
        return "redirect:/inicio";
    }
    
    @RequestMapping(value="/guardar_info_academica1", method = RequestMethod.POST)
    public String guardarInfoAcademica1(@RequestParam("ced_info1") int cedula,@RequestParam("ult-titulo1") String titulo_1,@RequestParam("grd-titulo1") String grado_titulo1,@RequestParam("univ-titulo1") String univ_titulo1,@RequestParam("pais-univ1") String pais_univ1,@RequestParam("ano-titulo1") String ano_titulo1) throws IOException{
    	
    	if (titulo_1.length()==0){
    		titulo_1 = "";
    	}
    	
    	if (univ_titulo1.length()==0){
    		univ_titulo1 = "";
    	}
    
    	if (ano_titulo1.length()==0){
    		ano_titulo1 = "0";
    	}
    	
    	
    	ModelAndView model = new ModelAndView();
    	
        int id_titulo_1 = Cientifico.consultarIdInformacionAcademica(cedula).get(0);
        String universidad = new String(univ_titulo1.getBytes("ISO-8859-1"),"UTF-8");
        String pais = new String(pais_univ1.getBytes("ISO-8859-1"),"UTF-8");
        String titulo = new String(titulo_1.getBytes("ISO-8859-1"),"UTF-8");
        
    	if(Cientifico.actualizarInfoAcademica(id_titulo_1, titulo, grado_titulo1, universidad, pais, Integer.parseInt(ano_titulo1)) != 1)
        	
    		model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
        else
        	model.addObject("msg", "Se ha guardado con Éxito.");
        

		
    	
        model.setViewName("index");
        return "redirect:/inicio";
    }
	
    @RequestMapping(value="/guardar_info_academica2", method = RequestMethod.POST)
    public String guardarInfoAcademica2(@RequestParam("ced_info2") int cedula,@RequestParam("ult-titulo2") String titulo_2,@RequestParam("grd-titulo2") String grado_titulo2,@RequestParam("univ-titulo2") String univ_titulo2,@RequestParam("pais-univ2") String pais_univ2,@RequestParam("ano-titulo2") String ano_titulo2) throws UnsupportedEncodingException{
    	
    	if (titulo_2.length()==0){
    		titulo_2 = "";
    	}
    	
    	if (univ_titulo2.length()==0){
    		univ_titulo2 = "";
    	}
    	if (ano_titulo2.length()==0){
    		ano_titulo2 = "0";
    	}
    	ModelAndView model = new ModelAndView();
    	
        String universidad = new String(univ_titulo2.getBytes("ISO-8859-1"),"UTF-8");
        String pais = new String(pais_univ2.getBytes("ISO-8859-1"),"UTF-8");
        String titulo = new String(titulo_2.getBytes("ISO-8859-1"),"UTF-8");
        
        if (Cientifico.consultarIdInformacionAcademica(cedula).size()==1){
        
        	if(Cientifico.completarInformacionAcademicaCientifico(titulo, grado_titulo2, universidad, pais, Integer.parseInt(ano_titulo2), cedula) != 1)
            	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
            else
            	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        else{
        	int id_titulo_2 = Cientifico.consultarIdInformacionAcademica(cedula).get(1);
	    	if(Cientifico.actualizarInfoAcademica(id_titulo_2, titulo, grado_titulo2, universidad, pais, Integer.parseInt(ano_titulo2)) != 1)
	        	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
	        else
	        	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        
        model.setViewName("index");
        return "redirect:/inicio";
    }
    @RequestMapping(value="/guardar_info_academica3", method = RequestMethod.POST)
    public String guardarInfoAcademica3(@RequestParam("ced_info3") int cedula,@RequestParam("ult-titulo3") String titulo_3,@RequestParam("grd-titulo3") String grado_titulo3,@RequestParam("univ-titulo3") String univ_titulo3,@RequestParam("pais-univ3") String pais_univ3,@RequestParam("ano-titulo3") String ano_titulo3) throws UnsupportedEncodingException{
    	
    	
    	if (titulo_3.length()==0){
    		titulo_3 = "";
    	}
    	
    	if (univ_titulo3.length()==0){
    		univ_titulo3 = "";
    	}
    	if (ano_titulo3.length()==0){
    		ano_titulo3 = "0";
    	}
    	ModelAndView model = new ModelAndView();
    	
        String universidad = new String(univ_titulo3.getBytes("ISO-8859-1"),"UTF-8");
        String pais = new String(pais_univ3.getBytes("ISO-8859-1"),"UTF-8");
        String titulo = new String(titulo_3.getBytes("ISO-8859-1"),"UTF-8");
    	
    	
        if (Cientifico.consultarIdInformacionAcademica(cedula).size()==2){
        
        	if(Cientifico.completarInformacionAcademicaCientifico(titulo, grado_titulo3, universidad, pais, Integer.parseInt(ano_titulo3), cedula) != 1)
            	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
            else
            	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        else{
        	int id_titulo_3 = Cientifico.consultarIdInformacionAcademica(cedula).get(2);
	    	if(Cientifico.actualizarInfoAcademica(id_titulo_3, titulo, grado_titulo3, universidad, pais, Integer.parseInt(ano_titulo3)) != 1)
	        	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
	        else
	        	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        
        model.setViewName("index");
        return "redirect:/inicio";
    }
    @RequestMapping(value="/guardar_info_prefesional1", method = RequestMethod.POST)
    public String guardarInfoPersonal1(@RequestParam("ced_info1") int cedula,@RequestParam("act1") String actividad1,@RequestParam("area-invest1") String areainvestigacion1,@RequestParam("insti1") String institucion1,@RequestParam("depart1") String departamento1,@RequestParam("ano-inicio-act1") String anoinicio1,@RequestParam("pais-insti1") String pais1) throws UnsupportedEncodingException{
    	
    	if (institucion1.length()==0){
    		institucion1 = "";
    	}
    	
    	if (departamento1.length()==0){
    		departamento1 = "";
    	}
    	if (anoinicio1.length() == 0){
    		anoinicio1 = "0";
    	}
    	
    	ModelAndView model = new ModelAndView();
    	
        int id_profesion_1 = Cientifico.consultarIdActividadesProfesionales(cedula).get(0);
        String institucion = new String(institucion1.getBytes("ISO-8859-1"),"UTF-8");
        String departamento = new String(departamento1.getBytes("ISO-8859-1"),"UTF-8");
        
        int r = Cientifico.actualizarInfoProfesional(id_profesion_1, actividad1, areainvestigacion1, institucion, departamento, Integer.parseInt(anoinicio1), pais1);
  
        model.setViewName("index");
        return "redirect:/inicio";
    }
    @RequestMapping(value="/guardar_info_prefesional2", method = RequestMethod.POST)
    public String guardarInfoPersonal2(@RequestParam("ced_info2") int cedula,@RequestParam("act2") String actividad2,@RequestParam("area-invest2") String areainvestigacion2,@RequestParam("insti2") String institucion2,@RequestParam("depart2") String departamento2,@RequestParam("ano-inicio-act2") String anoinicio2,@RequestParam("pais-insti2") String pais2) throws UnsupportedEncodingException{
    	
    	if (institucion2.length()==0){
    		institucion2 = "";
    	}
    	
    	if (departamento2.length()==0){
    		departamento2 = "";
    	}
    	if (anoinicio2.length() == 0){
    		anoinicio2 = "0";
    	}
    	ModelAndView model = new ModelAndView();
        String institucion = new String(institucion2.getBytes("ISO-8859-1"),"UTF-8");
        String departamento = new String(departamento2.getBytes("ISO-8859-1"),"UTF-8");
    	
        if (Cientifico.consultarIdActividadesProfesionales(cedula).size()==1){
        
        	if(Cientifico.completarInformacionProfesionalCientifico(actividad2, areainvestigacion2, institucion, departamento, Integer.parseInt(anoinicio2), pais2, cedula)!= 1)
            	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
            else
            	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        else{
        	int id_profesion_2 = Cientifico.consultarIdActividadesProfesionales(cedula).get(1);
	    	if(Cientifico.actualizarInfoProfesional(id_profesion_2, actividad2, areainvestigacion2, institucion, departamento, Integer.parseInt(anoinicio2), pais2) != 1)
	        	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
	        else
	        	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        
        model.setViewName("index");
        return "redirect:/inicio";
    }
    @RequestMapping(value="/guardar_info_prefesional3", method = RequestMethod.POST)
    public String guardarInfoPersonal3(@RequestParam("ced_info3") int cedula,@RequestParam("act3") String actividad3,@RequestParam("area-invest3") String areainvestigacion3,@RequestParam("insti3") String institucion3,@RequestParam("depart3") String departamento3,@RequestParam("ano-inicio-act3") String anoinicio3,@RequestParam("pais-insti3") String pais3) throws UnsupportedEncodingException{
    	
    	if (institucion3.length()==0){
    		institucion3 = "";
    	}
    	
    	if (departamento3.length()==0){
    		departamento3 = "";
    	}
    	if (anoinicio3.length() == 0){
    		anoinicio3 = "0";
    	}
    	ModelAndView model = new ModelAndView();
        String institucion = new String(institucion3.getBytes("ISO-8859-1"),"UTF-8");
        String departamento = new String(departamento3.getBytes("ISO-8859-1"),"UTF-8");
    	
        if (Cientifico.consultarIdActividadesProfesionales(cedula).size()==2){
        
        	if(Cientifico.completarInformacionProfesionalCientifico(actividad3, areainvestigacion3, institucion, departamento, Integer.parseInt(anoinicio3), pais3, cedula)!= 1)
            	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
            else
            	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        else{
        	int id_profesion_3 = Cientifico.consultarIdActividadesProfesionales(cedula).get(2);
	    	if(Cientifico.actualizarInfoProfesional(id_profesion_3, actividad3, areainvestigacion3, institucion, departamento, Integer.parseInt(anoinicio3), pais3) != 1)
	        	model.addObject("error", "No guardaron los datos correctamente, verifique que esten bien ingresados!!.");
	        else
	        	model.addObject("msg", "Se ha guardado con Éxito.");
        }
        
        model.setViewName("index");
        return "redirect:/inicio";
    }
    @RequestMapping(value="/accion_configuracion", method = RequestMethod.POST)
    public String modelConfiguration(@RequestParam("cedula_actual") int cedula,@RequestParam("correo_actual") String correoActual,@RequestParam("contrasena_actual") String contrasenaActual,@RequestParam("contrasena_nueva") String contrasenaNueva,@RequestParam("contrasena_nueva_confirmar") String contrasenaConfirmar){
    	
    	ModelAndView model = new ModelAndView();
    	
    	if(Singleton_MySQL.getInstancia().actualizarContrasena(cedula, correoActual, contrasenaActual, contrasenaNueva) != 1)
        	model.addObject("error", "No se ha completado la actualización de la contraseña!!.");
        else
        	Email.enviarCorreo(correoActual, Integer.toString(cedula), contrasenaNueva, "Actualización de Contraseña", "Configuración de Cuenta");
        	model.addObject("msg", "La contraseña se ha actualizado con Éxito!, Revise su Email!");
        
        model.setViewName("index");
        return "redirect:/inicio";
    }
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Cédula o contraseña incorrectos!");
		}

		if (logout != null) {
			model.addObject("msg", "Has salido con Éxito.");
		}
		model.setViewName("login");

		return model;

	}
	
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;

	}

	//for 403 access denied page
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public ModelAndView recursoInvalido() {

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			
		}
		
		model.setViewName("404");
		return model;

	}	
	
	 @RequestMapping(value="/downloadFile", method = RequestMethod.GET)
     public void downloadFile(@RequestParam("determinarTipoDes") String tipoDescarga,HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {             
		
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "inline; filename=\"Documento_Informativo.xls\"");
		
		if (tipoDescarga.equals("2")) {
			
			Excel ex = new Excel();
			ex.escribirExcel();
			ex.escribirExcelAcademica();
			ex.escribirExcelProfesional();
			 
			HSSFWorkbook wb = ex.getWb();
			OutputStream out = response.getOutputStream();
			wb.write(out);
			out.close();
		}
		
		 
	
  }
	 @RequestMapping(value="/marcarTerminado", method = RequestMethod.POST)
	 public String  marcarTerminado(@RequestParam("usuarioCompletar") String usuarioCompletar,@RequestParam("observacionesMarcarCompleto") String observacionesMarcarCompleto) throws IOException, ClassNotFoundException, SQLException {             
			
		 ModelAndView model = new ModelAndView();
		 
		 Singleton_MySQL.getInstancia().marcarCompletado(Integer.parseInt(usuarioCompletar.substring(0, 9)));
		 
		 System.out.println(observacionesMarcarCompleto);			
		 
		 model.setViewName("index");
	     return "redirect:/inicio";
	 } 
	
}