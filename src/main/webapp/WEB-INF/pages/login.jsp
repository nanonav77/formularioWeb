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
            <img src="images/logo.png" class="logo">
        </header>
        
<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->

<div class="module form-module">




  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
    <div class="tooltip">Crear cuenta.</div>
  </div>



		
 <div class="form">
 

		 <h2>Inicio de sesión.</h2>

		<form name='loginForm'
			action="<c:url value='/j_spring_security_check' />" method='POST'>
			
			
		<input type='email' name='correo' placeholder="correo" required>
		
       <input type="password" name="contrasena"  placeholder="contraseña" required/>

 
		<input name="submit" type="submit" value="Entrar" />

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<div class="pen-title">
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		</div>
		<div class="cta"><a href="">olvidó su contraseña?</a></div>
		</div>
		
 		<div class="form">
    		<h2>Crear una cuenta</h2>
    		
 			<form:form name="registro" action="registrar" method="POST">
 			<input type="email" name="correo" placeholder="Correo electrónico" required/>
 			<input type="password" name="contrasena" placeholder="Contraseña" required/>
 			<input type="password" name="contrasena_confirm" placeholder="Confirmar contraseña" required/>
            <input type="submit" value="Registrar" class="btn"></li>
            
 		<div class="pen-title">
		<c:if test="${not empty error_registro}">
			<div class="error">${error}</div>
		</c:if>
 
		</div>           
 
</form:form>   		
    		
    <!-- 
    	<form action="Servlet" method="post">
      		
      		<input type="password" placeholder="Password"/>
      		<input type="email" placeholder="Email Address"/>
      		<input type="tel" placeholder="Phone Number"/>
      		<button>Registrar</button>
    </form> -->
  </div>
  
</div>		



<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
 
<script src="js/index.js"></script>

</body>
</html>