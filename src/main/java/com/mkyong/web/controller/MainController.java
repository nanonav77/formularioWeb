package com.mkyong.web.controller;

import java.text.ParseException;

import modelo.dto.DTO_Persona;
import modelo.enlaceDeDatos.Singleton_MySQL_Query;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
 		
	
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		System.out.print("login");
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	
	}
	
	@RequestMapping(value = "/inicio**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		System.out.print("admin");
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is protected page!");
		model.setViewName("index");
		return model;

	}	
	
    @RequestMapping(value="/registrar", method = RequestMethod.POST)
    public ModelAndView forgotpassword(@RequestParam("correo") String correo,@RequestParam("contrasena") String contrasena) throws ClassNotFoundException, ParseException {

    	ModelAndView model = new ModelAndView();
    	
        DTO_Persona nvoRegistro = new DTO_Persona();
        nvoRegistro.setContrasena(contrasena);
        nvoRegistro.setCorreo(correo);
        
        if(Singleton_MySQL_Query.getInstancia().registrarUsuario(nvoRegistro)!=1){
        	model.addObject("error", "El correo electrónico que intenta registrar, ya esta en uso.");
        	
        }
        model.addObject("msg", "Te has registrado con éxito.");
        model.setViewName("login");
        return model;
    }
	
	


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Correo o contraseña incorrectos!");
		}

		if (logout != null) {
			model.addObject("msg", "Has salido con éxito.");
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

}