package modelo.logicaDeIntegracion;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {

	public static void enviarCorreo(String correoDestino, String cedula, String contrasena,String accion, String asunto) {

		final String username = "navrojd77@gmail.com";
		final String password = "jupiter070417";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("navrojd77@gmail.com"));
			
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(correoDestino));
	
			
			message.setSubject(asunto);
			
			
			MimeMultipart multipart = new MimeMultipart("related");

	         // first part (the html)
	         BodyPart messageBodyPart = new MimeBodyPart();
	         String htmlText = "<H1>"+accion+"</H1><br/><br/><img src=\"cid:image\"><br/><H2>- Número de Identificación: "+cedula+"<br/>- Correo Electrónico: "+correoDestino+"<br/>- Contraseña: "+contrasena+"</H2>";
	         messageBodyPart.setContent(htmlText, "text/html");
	         // add it
	         multipart.addBodyPart(messageBodyPart);

	         // second part (the image)
	         //messageBodyPart = new MimeBodyPart();
	         //DataSource fds = new FileDataSource(
	          //  "src/main/webapp/WEB-INF/pages/images/micit.png");

	         //messageBodyPart.setDataHandler(new DataHandler(fds));
	         //messageBodyPart.setHeader("Content-ID", "<image>");

	         // add image to the multipart
	         //multipart.addBodyPart(messageBodyPart);

	         // put everything together
	         message.setContent(multipart);

			 Transport.send(message);


		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}