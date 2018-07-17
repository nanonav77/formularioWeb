<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<html>
<head>
<title>Inicio</title>
<style>
.error {
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
.cta {
  background: #f2f2f2;
  width: 100%;
  padding: 15px 40px;
  box-sizing: border-box;
  color: #666666;
  font-size: 12px;
  text-align: center;
}
.cta a {
  color: #333333;
  text-decoration: none;
}

</style>
  <meta charset="UTF-8">
  <title>MICITT - VIVO</title>
  <meta name="description" content="MICITT VIVO">
        
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="css/style.css">

  <!--pc_styles.css se muestra en dispositivos con pantalla mayor a un ancho de 481px-->
  <link rel="stylesheet" href="css/pc_styles.css" media="screen and (min-width: 481px)"> 
  <!--pc_styles.css se muestra en dispositivos moviles con un ancho máximo de 480px-->
  <link rel="stylesheet" href="css/mobile_styles.css" media="handheld, only screen and (max-width: 480px)">
  <!--normalize.css estandariza los estilos para que se vean similar en varios navegadores-->
  <link rel="stylesheet" href="css/normalize.css">
   <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body onload='document.loginForm.username.focus();'>

	<header>
		<div style="position:absolute; top:7px; left:15px;">
			<img src="images/logo2.png" >
		</div>
    	<div style="position:absolute; top:7px; left:230px;">
			<img src="images/logo.png" >
		</div>
		
    </header>

	<div class="module form-module">
		
		<div class="toggle"><i class="fa fa-times fa-pencil"></i>
    		<div class="tooltip">Crear cuenta.</div>
  		</div>

		<div class="form">

		 	<h2 id="etiquetaLogin">Inicio de sesión.</h2>
			<h2 style="display: none;" id="etiquetaRecordar">Enviar Contraseña</h2>

			
			<form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
				 
	   			
	   			<input type="text" id="cedula" name="cedula" placeholder="cedula" required>
       			<input type="password" id="contrasena" name="contrasena"  placeholder="contraseña" required/>
				<input id="submitI" name="submitI" type="submit" value="Entrar" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
				<div id="olvidoCon" name="olvidoCon" class="cta"><a href="#" onClick="recordarContrasena();">¿Has olvidado tu contraseña?</a></div>
			</form>
			
			<form:form name='forgetForm' action='forgetForm' method='POST'>
	   			
	   			<input style="display: none;" type="text" id="cedulaE" name="cedulaE" placeholder="cedula" required>
       			<input style="display: none;" type="text" id="correoE" name="correoE"  placeholder="correo" required/>
				<input style="display: none;" id="submitE" name="submitE" type="submit" value="Enviar.." />
				<div id="atrasLogin" name="atrasLogin" style="display: none;" class="cta"><a href="#" onClick="volverLogin();">Atrás</a></div>
			</form:form> 
		
			<div class="pen-title">
				<c:if test="${not empty error}">
					<div class="error">${error}</div>
				</c:if>
				<c:if test="${not empty msg}">
					<div class="msg">${msg}</div>
				</c:if>
			</div>
		</div>
		
 		<div class="form">
    		<h2>Crear una cuenta</h2>
    		
 			<form:form name="registro" id="registro" action="registrar" method="POST">
 				<input  name="cedula" pattern="[0-9]{9}" placeholder="número de cédula formato ej 888888888" required/>
 				<input type="email" name="correo" placeholder="correo electrónico" required/>
 				<input type="password" name="contrasena" placeholder="contraseña" required/>
 				<input type="password" name="contrasena_confirm" placeholder="confirmar contraseña" required/>
            	<input type="submit" value="Registrar" class="btn" onClick="compararContrasena();">
            
 				<div class="pen-title">
					<c:if test="${not empty error_registro}">
						<div class="error">${error}</div>
					</c:if> 
				</div>           
			</form:form>   		
  		</div>
	</div>		
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index.js"></script>
	<script src="js/validaciones.js"></script>
	<script src="js/mostrarSeccionesFormulario.js"></script>	
</body>
</html>