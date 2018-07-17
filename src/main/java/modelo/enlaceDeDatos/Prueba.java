package modelo.enlaceDeDatos;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

import modelo.logicaDeIntegracion.Email;

public class Prueba {

	public static void main(String[] args) {
		
			
		Email.enviarCorreo("navrojd77@gmail.com", "cedula", "contrasena", "accion", "asunto");
	}

}
