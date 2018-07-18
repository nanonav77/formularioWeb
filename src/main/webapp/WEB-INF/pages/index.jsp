<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>    


    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>

  <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>MICITT - VIVO</title>
        <meta name="description" content="MICITT VIVO">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
       
        <link rel="stylesheet" href="css/pc_styles.css">
        <!--normalize.css estandariza los estilos para que se vean similar en varios navegadores-->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/stilos.css">
        
        <script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
			function determinarTipoDescargaExcel(ctrl) {
		
				
			    if(document.getElementById('radioExcel2').checked){ 
			    	document.getElementById('determinarTipoDes').value = document.getElementById('radioExcel2').value;
			    }
			    if(document.getElementById('radioExcel1').checked){ 
			    	document.getElementById('determinarTipoDes').value = document.getElementById('radioExcel1').value;
			    }
			}
		
			function funcionesCargarPagina(accion){
				
				document.getElementById('determinarRol').value = document.getElementById('rol_auxi').value;
				document.getElementById('determinarRol2').value = document.getElementById('rol_auxi').value;
				
				if(document.getElementById('rol_auxi').value == "ROLE_USER"){
					document.getElementById('imagen_admin').style.display = "none";
					document.getElementById('imagen_usuario').style.display = "inline-flex";
				
					document.getElementById('seccion-busqueda').style.display = "none";
					
					document.getElementById('tabs11').className = "tabs_item"; 
					document.getElementById('tabs12').className = "tabs_item active";
					
					document.getElementById('seccion-busqueda').className = "panels_item"; 
					document.getElementById('info-personal').className = "panels_item active";
				}
				if(document.getElementById('rol_auxi').value == "ROLE_ADMIN"){
					document.getElementById('imagen_usuario').style.display = "none";
					document.getElementById('imagen_admin').style.display = "inline-flex";
					
					document.getElementById('seccion-busqueda').style.display = "inline-flex";
					
					
					document.getElementById('tabs11').className = "tabs_item active"; 
					document.getElementById('tabs12').className = "tabs_item";
					document.getElementById('seccion-busqueda').className = "panels_item active"; 
					document.getElementById('info-personal').className = "panels_item";
				}
				document.getElementById('cientificoSeleccionado').value = document.getElementById('selectBusqueda').value;
				document.getElementById('determinarAccion').value = accion;
				determinarTipoUsuario();
				obtenerCantonElejido();

				
			}
		</script>
     
    </head>
    
    <body onload="funcionesCargarPagina('');">
    
 	<input type="text" id="rol_auxi" name="rol_auxi" value="${rol_auxi}" style="display: none;">
 	
	<c:url value="/j_spring_security_logout" var="logoutUrl" />

	<!-- csrt for log out-->
	<form action="${logoutUrl}" method="post" id="logoutForm">
	  <input type="hidden"
		name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	</form>

	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
	
 
        <header>
			 <div style="position:absolute; top:7px; left:15px;">
				<img src="images/logo2.png" >
			</div>
    		<div style="position:absolute; top:7px; left:230px;">
				<img src="images/logo.png">
			</div>
			
			<div  style="position:absolute; top:7px; left:570px;">
				<img style="display:none;" id="imagen_usuario" src="images/logo_u.png">
				<img style="display:none;" id="imagen_admin" src="images/logo_a.png">
			</div>        
             <div  style="text-color: white;position:absolute; top:10px; right:45px;">
            	<a href="javascript:formSubmit()"><font color="white">salir</font></a>
            </div>
        </header>
        
        <div class="formulario">
            
        
 
                
                <div class="tabs-container">
                    <div id="tabs_usuario">
                     <ul class="tabs" id="tabs">
                        <li id="tabs11" class="tabs_item">Búsqueda</li>
                        <li id="tabs12" class="tabs_item active">Información Personal</li>
                        <li id="tabs13" class="tabs_item">Información Académica</li>
                        <li id="tabs14" class="tabs_item">Información Profesional</li>
                        <li id="tabs15" class="tabs_item">Términos y Condiciones</li>
                        <li id="tabs16" class="tabs_item">Configuración</li>
                        <li id="tabs17" class="tabs_item">Descargar Informacion</li>
                        
                     </ul>
                    </div>
                    
                    <div class="panels">
                    	<div style="display:none;" class="panels_item active" id="seccion-busqueda">
                        
                        
                            
                        	<table style="width:100%">
							<form:form  name="buscarTodos"  action="buscarTodos" method="POST">	 
								  <tr>
								    
								    <td><label for="b_ced">Buscar por Cédula:</label></td>
								    <td></td>
								    <td><label for="b_nombre">Buscar por Nombre:</label></td>
								    <td></td>
								    <td><label for="b_soli">En Solicitud:</label></td>
								    <td></td>
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <input type="text" id="buscar_ced" name="buscar_ced"  title="Ingrese el número de cédula"  class="entrada-datos" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    	
                                    </div>
                                    
                                    </td>
                                    <td><input onclick="funcionesCargarPagina('concedula');" id="submitConC" value="" type="submit"  style="height: 40px;width: 40px;position:absolute; top:27px; left:320px;background:url('images/search.png');"></td>
								    <td><div class="input-box">
                                        <input type="text" id="buscar_nombre" name="buscar_nombre"  title="Ingrese el nombre" class="entrada-datos" placeholder="ingrese el nombre">
                                    	<input type="text" id="determinarRol" name="determinarRol" style="display: none;">
                                    	<input type="text" id="determinarAccion" name="determinarAccion" style="display: none;">
                                    </div></td>
                                    <td><input onclick="funcionesCargarPagina('connombre');" id="submitConN" value="" type="submit" style="height: 40px;width: 40px;position:absolute; top:27px; right:183px;background:url('images/search.png');"></td>
								  	<td><button class="button button5" onclick="funcionesCargarPagina('consolicitud');" id="submitES" type="submit">Incompletos</button></td>
								  </tr>
								</table>  
								
								<table style="width:100%">
								   <tr>
								    
								    
								    <td><label>Resultado de la Busqueda:</label></td>
								    
								  </tr>
								  <tr>
									<td>
                                        <select  name="selectBusqueda" id="selectBusqueda" value="" onchange="" class="style-selects-info">
                                           <c:forEach items="${resultadoBusqueda}" var="databaseValue">
											    <option value="${databaseValue}">
											        ${databaseValue}
											    </option>
										  </c:forEach> 
                                      
                                         </select>
								   </td>	 
                                   </form:form>
                                   <td>
                                   <form:form  name="consultaAdministrador"  action="consultaAdministrador" method="POST">
                 			       
				                    	<button class="button button1" onclick="funcionesCargarPagina('');" class="boton" type="submit">Consultar</button>
				                    	<input type="text" id="cientificoSeleccionado" name="cientificoSeleccionado" style="display: none;">
				                    	<input type="text" id="determinarRol2" name="determinarRol2" style="display: none;">
                                    
                                   </form:form>   
								   </td>
								  </tr>
								       
								</table>
								<br/><br/>
								<table style="width:100%">
								<form:form  name="marcarTerminado"  action="marcarTerminado" method="POST">
								
								  <tr>
								    
								    <td>
								    <button class="button button3" onclick="document.getElementById('usuarioCompletar').value = document.getElementById('selectBusqueda').value" type="submit" style="height: 42px;right:180px;">Marcar como Terminado</button>
								    <textarea name="observacionesMarcarCompleto" id="observacionesMarcarCompleto" class="entrada-datos-completo" title="Observaciones" placeholder="Observaciones..." maxlength="1000"></textarea>
								    <input type="text" id="usuarioCompletar" name="usuarioCompletar" style="display: none;">
								    </td>
							
								  </tr>
								
								</form:form>
								</table>
                 		</div>
                 
                       <div class="panels_item" id="info-personal">
                        
                        
 
         
                            <form:form  name="guardar1"  action="guardar1" method="POST">
                            <div class="informacion">
								
								<table style="width:100%">
								  <tr>
								    
								    <td><label for="ced">Cédula:<em>*</em></label></td>
								    <td><label for="nombre">Nombre:<em>*</em></label></td>
								    
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <input type="text" id="ced" name="ced" value="${cedula}" title="Ingrese su número de cédula" required readonly class="entrada-datos" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    </div></td>
								    <td><div class="input-box">
                                        <input type="text" id="nombre" name="nombre" value="${nombre}" title="Ingrese su nombre" class="entrada-datos" placeholder="ingrese su nombre" pattern="[A-Za-z].{0,}">
                                    </div></td>
								  </tr>
								  
								  <tr>
								    
								    <td><label for="apellido_1">Apellido 1°<em>*</em></label></td>
								    <td><label for="apellido_2">Apellido 2°:<em>*</em></label></td>
								    
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <input type="text" id="apellido_1" name="apellido_1" value="${apellido1}" title="Ingrese su primer apellido" class="entrada-datos" pattern="[A-Za-z].{0,}" placeholder="ingrese su primer apellido">
                                    </div></td>
								    <td><div class="input-box">
                                        <input type="text" id="apellido_2" name="apellido_2" value="${apellido2}" title="Ingrese su segundo apellido" class="entrada-datos" pattern="[A-Za-z].{0,}" placeholder="ingrese su segundo apellido">
                                    </div></td>
								  </tr>
								  
								   <tr>
								    
								    <td><label for="provincia">Provincia:<em>*</em></label></td>
								    <td><label for="canton">Cantón:<em>*</em></label></td>
								    
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <select name="provincia" id="provincia" value="" onchange="mostrarCantonXProvincia();" class="style-selects-info">
                                            <option value="${provincia}" selected>${provincia}</option>
                                            <option value="San José">San José</option>
                                            <option value="Cartago">Cartago</option>
                                            <option value="Heredia">Heredia</option>
                                            <option value="Alajuela">Alajuela</option>
                                            <option value="Guanacaste">Guanacaste</option>
                                            <option value="Limón">Limón</option>
                                            <option value="Puntarenas">Puntarenas</option>
                                         </select>
                                    </div></td>
                                    
								    <td><div class="input-box">
                                        
                                         <select name="cantonesSJ" id="cantonesSJ" onchange="obtenerCantonElejido();" class="style-selects-info" >
                                        
                           					<option value="${canton}" selected>${canton}</option>
                                            <option value="San José">San José</option>
                                            <option value="Escazú">Escazú</option>
                                            <option value="Desamparados">Desamparados</option>
                                            <option value="Puriscal">Puriscal</option>
                                            <option value="Tarrazú">Tarrazú</option>
                                            <option value="Goicoechea">Goicoechea</option>
                                            <option value="Aserrí">Aserrí</option>
                                            <option value="Mora">Mora</option>
                                            <option value="Santa Ana">Santa Ana</option>
                                            <option value="Alajuelita">Alajuelita</option>
                                            <option value="Acosta">Acosta</option>
                                            <option value="Coronado">Coronado</option>
                                            <option value="Tibás">Tibás</option>
                                            <option value="Moravia">Moravia</option>
                                            <option value="Montes de Oca">Montes de Oca</option>
                                            <option value="Turrubares">Turrubares</option>
                                            <option value="Curridabat">Curridabat</option>
                                            <option value="Dota">Dota</option>
                                            <option value="Perez Zeledón">Perez Zeledón</option>
                                            <option value="León Cortés">León Cortés</option>
                                         </select> 

                                        <select name="cantonesA" id="cantonesA" value="" onchange="obtenerCantonElejido();" class="style-selects-info">
                                            <c:if test="${provincia == 'Alajuela'}">
                            					<option value="${canton}" selected>${canton}</option>
    	                                    </c:if>
                                            <option value="Alajuela">Alajuela</option>
                                            <option value="San Ramón">San Ramón</option>
                                            <option value="Grecia">Grecia</option>
                                            <option value="San Mateo">San Mateo</option>
                                            <option value="Atenas">Atenas</option>
                                            <option value="Naranjo">Naranjo</option>
                                            <option value="Poás">Poás</option>
                                            <option value="Palmares">Palmares</option>
                                            <option value="Orotina">Orotina</option>
                                            <option value="San Carlos">San Carlos</option>
                                            <option value="Valverde Vega">Valverde Vega</option>
                                            <option value="Alfaro Ruíz">Alfaro Ruíz</option>
                                            <option value="Upala">Upala</option>
                                            <option value="Los Chiles">Los Chiles</option>
                                            <option value="Guatuzo">Guatuzo</option>
                                         </select> 

                                         <select name="cantonesH" id="cantonesH" onchange="obtenerCantonElejido();" class="style-selects-info" value="${canton}">
                                            <c:if test="${provincia == 'Heredia'}">
                            					<option value="${canton}" selected>${canton}</option>
    	                                    </c:if>                                            
                                            <option value="Heredia">Heredia</option>
                                            <option value="Barva">Barva</option>
                                            <option value="Santa Barbara">Santa Barbara</option>
                                            <option value="Santo Domingo">Santo Domingo</option>
                                            <option value="San Rafael">San Rafael</option>
                                            <option value="San Isidro">San Isidro</option>
                                            <option value="Flores">Flores</option>
                                            <option value="Belén">Belén</option>
                                            <option value="San Pablo">San Pablo</option>
                                            <option value="Sarapiqui">Sarapiqui</option>
                                         </select> 

                                         <select name="cantonesC" id="cantonesC" onchange="obtenerCantonElejido();" class="style-selects-info" value="${canton}">
                                            <c:if test="${provincia == 'Cartago'}">
                            					<option value="${canton}" selected>${canton}</option>
    	                                    </c:if>                                            
                                            <option value="Cartago">Cartago</option>
                                            <option value="Paraíso">Paraíso</option>
                                            <option value="Turrialba">Turrialba</option>
                                            <option value="Alvarado">Alvarado</option>
                                            <option value="La Unión">La Unión</option>
                                            <option value="Oreamuno">Oreamuno</option>
                                            <option value="Jímenez">Jímenez</option>
                                            <option value="El Guarco">El Guarco</option>
                                         </select> 

                                         <select name="cantonesL" id="cantonesL" onchange="obtenerCantonElejido();" class="style-selects-info" value="${canton}">
                                            <c:if test="${provincia == 'Limón'}">
                            					<option value="${canton}" selected>${canton}</option>
    	                                    </c:if>                                            
                                            <option value="Limón">Limón</option>
                                            <option value="Pococí">Pococí</option>
                                            <option value="Talamanca">Talamanca</option>
                                            <option value="Siquirres">Siquirres</option>
                                            <option value="Matina">Matina</option>
                                            <option value="Guacimo">Guacimo</option>
                                         </select> 

                                         <select name="cantonesG" id="cantonesG" onchange="obtenerCantonElejido();" class="style-selects-info" value="${canton}">
                                            <c:if test="${provincia == 'Guanacaste'}">
                            					<option value="${canton}" selected>${canton}</option>
    	                                    </c:if>                                            
                                            <option value="Liberia">Liberia</option>
                                            <option value="Nicoya">Nicoya</option>
                                            <option value="Bagaces">Bagaces</option>
                                            <option value="Santa Cruz">Santa Cruz</option>
                                            <option value="Carrillo">Carrillo</option>
                                            <option value="Cañas">Cañas</option>
                                            <option value="Tilarán">Tilarán</option>
                                            <option value="Abangares">Abangares</option>
                                            <option value="Nandayure">Nandayure</option>
                                            <option value="La Cruz">La Cruz</option>
                                            <option value="Hojancha">Hojancha</option>
                                         </select> 

                                         <select name="cantonesP" id="cantonesP" onchange="obtenerCantonElejido();" class="style-selects-info" value="${canton}">
                                            <c:if test="${provincia == 'Puntarenas'}">
                            					<option value="${canton}" selected>${canton}</option>
    	                                    </c:if>                                            
                                            <option value="Puntarenas">Puntarenas</option>
                                            <option value="Esparza">Esparza</option>
                                            <option value="Montes de Oro">Montes de Oro</option>
                                            <option value="Buenos Aires">Buenos Aires</option>
                                            <option value="Osa">Osa</option>
                                            <option value="Aguirre">Aguirre</option>
                                            <option value="Golfito">Golfito</option>
                                            <option value="Coto Brus">Coto Brus</option>
                                            <option value="Corredores">Corredores</option>
                                            <option value="Parrita">Parrita</option>
                                            <option value="Garabito">Garabito</option>
                                         </select>
                                         
                                         <input type="text" style="display: none;" id="cantonObtenidoUsuario" name="cantonObtenidoUsuario" value="${canton}"  class="entrada-datos" >
                                        
                                    </div></td>
                                    
								  </tr>
								  <tr>
								    
								    <td><label for="genero">Género<em>*</em></label></td>
								    <td><label for="fch-nacimiento">Fecha de Nacimiento [día-mes-año]:<em>*</em></label></td>
								    
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <select name="genero" id="genero" class="style-selects-info">
	                                    <c:if test="${sexo == 'M'}">
                            				<option value="M" selected>Mujer</option>
    	                                </c:if>
	                                    <c:if test="${sexo == 'H'}">
                            				<option value="H" selected>Hombre</option>
    	                                </c:if>                                             
                                             <option value="H">Hombre</option>
                                             <option value="M">Mujer</option>
                                         </select>
                                    </div></td>
								    <td><div class="input-box">
                                        <input type="text" placeholder="día-mes-año" name="fch-nacimiento" value="${fecha_nacimiento}" id="fch-nacimiento" min="1930-01-01" class="entrada-datos" pattern="(0[0-9]|1[0-9]|2[0-9]|3[01])-(0[1-9]|1[012])-[0-9]{4}">
                                    </div></td>
								  </tr>
								  <tr>
								    
								    <td><label for="celular">Celular [Ej. 88888888]:<em>*</em></label></td>
								    <td><label for="tel-usuario">Tel. Trabajo [Ej. 88888888]:<em>*</em></label></td>
								    
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <input type="tel" name="celular" id="celular" value="${celular}" class="entrada-datos" pattern="[0-9]{8}" placeholder="ingrese su número celular de 8 dígitos sin espacios, ni guiones">
                                    </div></td>
								    <td><div class="input-box">
                                        <input type="tel" name="tel-trabajo" id="tel-trabajo" value="${telefono}" class="entrada-datos" pattern="[0-9]{8}" placeholder="ingrese el número de teléfono de su trabajo de 8 dígitos sin espacios, ni guiones">
                                    </div></td>
								  </tr>
								  <tr>
								    
								    <td><label for="id-orcid">Id. ORCID:<em>*</em></label></td>
								    <td><label for="descr-perfil">Descripción de su perfil profesional:<em>*</em></label></td>
								    
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <input type="text" name="id-orcid" id="id-orcid" value="${orcid}" class="entrada-datos" placeholder="ingrese el identificador de su cuenta de ORCID">
                                        <div id="crear-orcid">puede crear su cuenta ORCID pulsando <a href="https://orcid.org" target="_blank">aquí</a></div>
                                    </div></td>
								    <td><div class="input-box">
                                        <textarea name="descripcion" id="descripcion" class="entrada-datos" title="Describa las áreas de desarrollo profesional" placeholder="Describa las áreas de desarrollo profesional" maxlength="1000">${descripcion}</textarea>
                                    </div></td>
								  </tr>
								</table>
                                <input type="text" style="display: none;" name="cantonElejido" value="${canton}" id="cantonElejido"/>
							
           

                               

                              

                                 <div class="imagen-perfil">
                                    <label for="img-perfil">Foto de Perfil:<em>*</em></label>
                                     <div id="original"><img class="item" id="myImage"></div>

                                    <div class="input-box">

                                        <input type="file" id="file" name="file" onchange="onFileSelected(event)" class="entrada-datos">
                                         <div id="re-dimensionada" class="entrada-datos"></div>
                                    </div>
                                </div>

                                <div class="separador"></div>  
                            </div>
                            
                            
                            
                            
                    <div class="botones">
                        <button class="button button2" name="submit" type="submit">Guardar</button>
                    	
                   </div>
                 </div>   
                 </form:form>                             
                
                
                <!---------------------------- SECCION 2 ------------------------------------>
 				
 				<div class="panels_item" id="info-academica">
 							<div id="form_acad_1" >
                            <form:form name="guardar_info_academica1" action="guardar_info_academica1" method="POST">
                            <div class="input-box">
                                        <input type="text" style="display: none;" id="ced_info1" name="ced_info1" value="${cedula}" title="Ingrese su número de cédula"  readonly class="entrada-datos" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    </div>
                            <div class="informacion">

                                <div class="ultimo-titulo">
                                    <label for="ult-titulo">Último título universitario obtenido:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" name="ult-titulo1" id="ult-titulo1" value="${nombre_tit1}" class="datos-titulos" placeholder="ingrese el nombre de su último título obtenido" >
                                    </div>
                                </div> 

                                <div class="grado-titulo">
                                    <label for="grd-titulo">Grado del título:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="grd-titulo1" id="grd-titulo1" value="" class="style-selects" >
                                           	<c:if test="${not empty grado_tit1}">
                            					<option value="${grado_tit1}" selected>${grado_tit1}</option>
    	                                	</c:if>    
                                            <option value="Doctor">Doctor</option>
                                            <option value="Doctora">Doctora</option>
                                            <option value="Master">Master</option>
                                            <option value="Licenciada">Licenciada</option>
                                            <option value="Licenciado">Licenciado</option>
                                            <option value="Bachiller">Bachiller Universitario</option>
                                         </select>
                                    </div>
                                </div>  

                                <div class="universidad-titulo">
                                    <label for="univ-titulo">Universidad:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="univ-titulo1" name="univ-titulo1" value="${univ_tit1}" class="datos-titulos" placeholder="ingrese el nombre de la Universidad donde obtuvo el título">
                                    </div>
                                </div>  

                                 <div class="pais-universidad">
                                    <label for="pais-univ">País:<em>*</em></label>
                                    <div class="input-box">   
                                         
                                    
 										<select name="pais-univ1" id="pais-univ1" value="" class="style-selects">
 										<c:if test="${not empty pais_tit1}">
                            				<option value="${pais_tit1}" selected>${pais_tit1}</option>
    	                                </c:if> 
 										</select>                                   
                                    </div>
                                </div>

                                <div class="ano-titulo">
                                    <label for="ano-titulo">Año en el que obtuvo el título:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="ano-titulo1" name="ano-titulo1" value="${ano_tit1}" class="datos-titulos"  pattern="[1-1][9-9][3-9][0-9]||[2-2][0-0][0-3][0-9]" placeholder="ingrese el año en el que obtuvo el título"></input>
                                    	
                                    </div>
                                </div>


                                <div id="otros-titulos1">

                                </div>
                                <div class="separador"></div>
                                
                            </div>


                            <div class="botones">
                                <input class="boton"  value="Titulo 2" type="button" onclick="document.getElementById('form_acad_1').style.display = 'none';document.getElementById('form_acad_2').style.display = 'block';document.getElementById('form_acad_3').style.display = 'none';" >      
                                <input class="boton"  value="Guardar" type="submit" >
                                
                                
                            </div>
                            </form:form>
                            </div> 
							<div id="form_acad_2" style="display: none;" >
                            <form:form name="guardar_info_academica2" action="guardar_info_academica2" method="POST">
                            <div class="input-box">
                                        <input type="text" style="display: none;" id="ced_info2" name="ced_info2" value="${cedula}" title="Ingrese su número de cédula" required  readonly class="entrada-datos" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    </div>
                            <div class="informacion">

                                <div class="ultimo-titulo">
                                    <label for="ult-titulo">Último título universitario obtenido:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" name="ult-titulo2" id="ult-titulo2" value="${nombre_tit2}" class="datos-titulos" placeholder="ingrese el nombre de su último título obtenido">
                                    </div>
                                </div> 

                                <div class="grado-titulo">
                                    <label for="grd-titulo">Grado del título:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="grd-titulo2" id="grd-titulo2" value="${grado_tit2}" class="style-selects">
                                            <c:if test="${not empty grado_tit2}">
                            					<option value="${grado_tit2}" selected>${grado_tit2}</option>
    	                                	</c:if> 
                                            <option value="Doctor">Doctor</option>
                                            <option value="Doctora">Doctora</option>
                                            <option value="Master">Master</option>
                                            <option value="Licenciada">Licenciada</option>
                                            <option value="Licenciado">Licenciado</option>
                                            <option value="Bachiller">Bachiller Universitario</option>
                                         </select>
                                    </div>
                                </div>  

                                <div class="universidad-titulo">
                                    <label for="univ-titulo">Universidad:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="univ-titulo2" name="univ-titulo2" value="${univ_tit2}" class="datos-titulos"  placeholder="ingrese el nombre de la Universidad donde obtuvo el título">
                                    </div>
                                </div>  

                                 <div class="pais-universidad">
                                    <label for="pais-univ">País:<em>*</em></label>
                                    <div class="input-box">
										<select name="pais-univ2" id="pais-univ2" class="style-selects">
										<c:if test="${not empty pais_tit2}">
                            				<option value="${pais_tit2}" selected>${pais_tit2}</option>
    	                                </c:if>
										</select>                     
                                    </div>
                                </div>

                                <div class="ano-titulo">
                                    <label for="ano-titulo">Año en el que obtuvo el título:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="ano-titulo2" name="ano-titulo2" value="${ano_tit2}" class="datos-titulos" pattern="[1-1][9-9][3-9][0-9]||[2-2][0-0][0-3][0-9]"  placeholder="ingrese el año en el que obtuvo el título">
                                    </div>
                                </div>


                                <div id="otros-titulos2">

                                </div>
                                <div class="separador"></div>
                                
                            </div>


                            <div class="botones">
                                <input class="boton"  value="Titulo 3" type="button" onclick="document.getElementById('form_acad_1').style.display = 'none';document.getElementById('form_acad_2').style.display = 'none';document.getElementById('form_acad_3').style.display = 'block';" >          
                                <input class="boton"  value="Guardar" id="btn_guardarAcad2" name="btn_guardarAcad2" type="submit" >
                                <input class="boton"  value="Titulo 1" type="button" onclick="document.getElementById('form_acad_1').style.display = 'block';document.getElementById('form_acad_2').style.display = 'none';document.getElementById('form_acad_3').style.display = 'none';"> 
                                                            </div>
                        </form:form> 
 						</div>
 						    <div id="form_acad_3" style="display: none;" >
                            <form:form name="guardar_info_academica3" action="guardar_info_academica3" method="POST">
                            <div class="input-box">
                                        <input type="text" style="display: none;" id="ced_info3" name="ced_info3" value="${cedula}" title="Ingrese su número de cédula"   readonly class="entrada-datos" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    </div>
                            <div class="informacion">

                                <div class="ultimo-titulo">
                                    <label for="ult-titulo">Último título universitario obtenido:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" name="ult-titulo3" id="ult-titulo3" value="${nombre_tit3}" class="datos-titulos" placeholder="ingrese el nombre de su último título obtenido" >
                                    </div>
                                </div> 

                                <div class="grado-titulo">
                                    <label for="grd-titulo">Grado del título:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="grd-titulo3" id="grd-titulo3" value="${grado_tit3}" class="style-selects">
                                            <c:if test="${not empty grado_tit3}">
                            					<option value="${grado_tit3}" selected>${grado_tit3}</option>
    	                                	</c:if> 
                                            <option value="Doctor">Doctor</option>
                                            <option value="Doctora">Doctora</option>
                                            <option value="Master">Master</option>
                                            <option value="Licenciada">Licenciada</option>
                                            <option value="Licenciado">Licenciado</option>
                                            <option value="Bachiller">Bachiller Universitario</option>
                                         </select>
                                    </div>
                                </div>  

                                <div class="universidad-titulo">
                                    <label for="univ-titulo">Universidad:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="univ-titulo3" name="univ-titulo3" value="${univ_tit3}" class="datos-titulos" placeholder="ingrese el nombre de la Universidad donde obtuvo el título">
                                    </div>
                                </div>  

                                 <div class="pais-universidad">
                                    <label for="pais-univ">País:<em>*</em></label>
                                    <div class="input-box">
										<select name="pais-univ3" id="pais-univ3" class="style-selects">
										<c:if test="${not empty pais_tit3}">
                            				<option value="${pais_tit3}" selected>${pais_tit3}</option>
    	                                </c:if>
										</select>                     
                                    </div>
                                </div>

                                <div class="ano-titulo">
                                    <label for="ano-titulo">Año en el que obtuvo el título:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="ano-titulo3" name="ano-titulo3" value="${ano_tit3}" class="datos-titulos" pattern="[1-1][9-9][3-9][0-9]||[2-2][0-0][0-3][0-9]" placeholder="ingrese el año en el que obtuvo el título">
                                    </div>
                                </div>


                                <div id="otros-titulos3">

                                </div>
                                <div class="separador"></div>
                                
                            </div>


                            <div class="botones">
                                         
                                <input class="boton"  value="Guardar" id="btn_guardarAcad3" name="btn_guardarAcad3" type="submit" >
                                <input class="boton"  value="Titulo 2" type="button" onclick="document.getElementById('form_acad_1').style.display = 'none';document.getElementById('form_acad_2').style.display = 'block';document.getElementById('form_acad_3').style.display = 'none';"> 
                                
                            </div>
                        </form:form> 	
                        </div>			
 				</div>
 
 
                        <!--------------------- SECCION 3   -------------------------------> 
                        
                        
                        <div class="panels_item" id="info-profesional">
                            <div id="form_prof_1">
                            <form:form name="guardar_info_prefesional1" action="guardar_info_prefesional1" method="POST">
                            <div class="input-box">
                                        <input type="text" style="display: none;" id="ced_info1" name="ced_info1" value="${cedula}" title="Ingrese su número de cédula" required  readonly class="datos-actividades" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    </div>
                            <div class="informacion">
                            
                                <div class="actividad">
                                    <label for="act">Actividad que realiza:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="act1" id="act1" class="style-selects" >
                                            <c:if test="${not empty nombre_act1}">
                            					<option value="${nombre_act1}" selected>${nombre_act1}</option>
    	                                	</c:if>
                                            <option value="Docencia universitaria en pregrado">Docencia universitaria en pregrado</option>
                                            <option value="Investigación y desarrollo">Investigación y desarrollo</option>
                                            
                                            <option value="Docencia universitaria en postgrado">Docencia universitaria en postgrado</option>
                                            <option value="Análisis físicos, químicos, biológicos">Análisis físicos, químicos, biológicos</option>
                                            <option value="Consultorías">Consultorías</option>
                                            <option value="Servicios informáticos, científicos y tecnológicos">Servicios informáticos, científicos y tecnológicos</option>
                                            <option value="Evaluación de proyectos de investigación científica">Evaluación de proyectos de investigación científica</option>
                                         </select>
                                    </div>
                                </div> 

                                <div class="area-investigacion">
                                    <label for="area-invest">Área de investigación:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="area-invest1" id="area-invest1" class="style-selects">
                                            <c:if test="${not empty area_act1}">
                            					<option value="${area_act1}" selected>${area_act1}</option>
    	                                	</c:if>
                                            <option value="Ciencias agropecuarias">Ciencias agropecuarias</option>
                                            <option value="Ciencias de la salud">Ciencias de la salud</option>
                                            <option value="Ciencias exactas y naturales">Ciencias exactas y naturales</option>
                                            <option value="Ciencias sociales">Ciencias sociales</option>
                                            <option value="Ingenierías y tecnología">Ingenierías y tecnología</option>
                                         </select>
                                    </div>
                                </div>  

                                <div class="institucion">
                                    <label for="insti">Institución donde realiza la actividad:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="insti1" name="insti1" value="${insti_act1}" class="datos-actividades" placeholder="Institución u Organización donde desarrolla la actividad mencionada">
                                    </div>
                                </div>  

                                <div class="departamento">
                                    <label for="depart">Departamento de la Institución:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="depart1" name="depart1" value="${depart_act1}" class="datos-actividades" placeholder="por ejemplo Escuelas, Centros de Investigación, Laboratorio, etc">
                                    </div>
                                </div>

                                <div class="ano-inicio-actividad">
                                    <label for="ano-inicio-act">Año de inicio:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" pattern="[1-1][9-9][3-9][0-9]||[2-2][0-0][0-3][0-9]"  id="ano-inicio-act1" value="${anoinicio_act1}" name="ano-inicio-act1" class="datos-actividades" placeholder="año en que  inició a desarrollar la actividad en el departamento">
                                    </div>
                                </div>

                                <div class="pais-institucion">
                                    <label for="pais-insti">País:<em>*</em></label>
                                    <div class="input-box">

										<select id="pais-insti1" name="pais-insti1" class="style-selects">
										<c:if test="${not empty pais_act1}">
                            				<option value="${pais_act1}" selected>${pais_act1}</option>
    	                                </c:if>
										</select>                                                    
                                    </div>
                                </div>

                                <div id="otras-actividades1">

                                </div>
                                <div class="separador"></div>
                            </div>

                            <div class="botones">         
                                <input class="boton" value="Actividad 2" type="button" onclick="document.getElementById('form_prof_1').style.display = 'none';document.getElementById('form_prof_2').style.display = 'block';document.getElementById('form_prof_3').style.display = 'none';"> 
                                <input class="boton" value="Guardar" type="submit" >
                                
                            </div>
                        </form:form>
						</div>
							<div id="form_prof_2" style="display: none;" >
                            <form:form name="guardar_info_prefesional2" action="guardar_info_prefesional2" method="POST">
                            <div class="input-box">
                                        <input type="text" style="display: none;" id="ced_info2" name="ced_info2" value="${cedula}" title="Ingrese su número de cédula"  readonly class="datos-actividades" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    </div>
                            <div class="informacion">
                            
                                <div class="actividad">
                                    <label for="act">Actividad que realiza:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="act2" id="act2"  class="style-selects" >
                                            <c:if test="${not empty nombre_act2}">
                            					<option value="${nombre_act2}" selected>${nombre_act2}</option>
    	                                	</c:if>
    	                                	<option value="Docencia universitaria en pregrado">Docencia universitaria en pregrado</option>
                                            <option value="Investigación y desarrollo">Investigación y desarrollo</option> 
                                            <option value="Docencia universitaria en postgrado">Docencia universitaria en postgrado</option>
                                            <option value="Análisis físicos, químicos, biológicos">Análisis físicos, químicos, biológicos</option>
                                            <option value="Consultorías">Consultorías</option>
                                            <option value="Servicios informáticos, científicos y tecnológicos">Servicios informáticos, científicos y tecnológicos</option>
                                            <option value="Evaluación de proyectos de investigación científica">Evaluación de proyectos de investigación científica</option>
                                         </select>
                                    </div>
                                </div> 

                                <div class="area-investigacion">
                                    <label for="area-invest">Área de investigación:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="area-invest2" id="area-invest2" class="style-selects" >
                                            <c:if test="${not empty area_act2}">
                            					<option value="${area_act2}" selected>${area_act2}</option>
    	                                	</c:if>
                                            <option value="Ciencias agropecuarias">Ciencias agropecuarias</option>
                                            <option value="Ciencias de la salud">Ciencias de la salud</option>
                                            <option value="Ciencias exactas y naturales">Ciencias exactas y naturales</option>
                                            <option value="Ciencias sociales">Ciencias sociales</option>
                                            <option value="Ingenierías y tecnología">Ingenierías y tecnología</option>
                                         </select>
                                    </div>
                                </div>  

                                <div class="institucion">
                                    <label for="insti">Institución donde realiza la actividad:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="insti2" name="insti2" value="${insti_act2}" class="datos-actividades" placeholder="Institución u Organización donde desarrolla la actividad mencionada">
                                    </div>
                                </div>  

                                <div class="departamento">
                                    <label for="depart">Departamento de la Institución:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="depart2" name="depart2" value="${depart_act2}" class="datos-actividades" placeholder="por ejemplo Escuelas, Centros de Investigación, Laboratorio, etc">
                                    </div>
                                </div>

                                <div class="ano-inicio-actividad">
                                    <label for="ano-inicio-act">Año de inicio:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" pattern="[1-1][9-9][3-9][0-9]||[2-2][0-0][0-3][0-9]"  id="ano-inicio-act2" name="ano-inicio-act2" value="${anoinicio_act2}" class="datos-actividades" placeholder="año en que  inició a desarrollar la actividad en el departamento">
                                    </div>
                                </div>

                                <div class="pais-institucion">
                                    <label for="pais-insti">País:<em>*</em></label>
                                    <div class="input-box">
           
										<select id="pais-insti2" name="pais-insti2" class="style-selects">
										<c:if test="${not empty pais_act2}">
                            				<option value="${pais_act2}" selected>${pais_act2}</option>
    	                                </c:if>
										</select>                                                    
           
                                    </div>
                                </div>

                                <div id="otras-actividades2">

                                </div>
                                <div class="separador"></div>
                            </div>

                            <div class="botones">
                                <input class="boton" value="Actividad 3" type="button" onclick="document.getElementById('form_prof_1').style.display = 'none';document.getElementById('form_prof_2').style.display = 'none';document.getElementById('form_prof_3').style.display = 'block';">          
                                <input class="boton"  value="Guardar" type="submit" >
                                <input class="boton" value="Actividad 1" type="button" onclick="document.getElementById('form_prof_1').style.display = 'block';document.getElementById('form_prof_2').style.display = 'none';document.getElementById('form_prof_3').style.display = 'none';"> 
                              
                            </div>
                         </form:form>
						 </div>
						 <div id="form_prof_3" style="display: none;" >
                            <form:form name="guardar_info_prefesional3" action="guardar_info_prefesional3" method="POST">
                            <div class="input-box">
                                        <input type="text" style="display: none;" id="ced_info3" name="ced_info3" value="${cedula}" title="Ingrese su número de cédula" required  readonly class="datos-actividades" pattern="[0-9]{9}" placeholder="ejemplo 888888888">
                                    </div>
                            <div class="informacion">
                            
                                <div class="actividad">
                                    <label for="act">Actividad que realiza:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="act3" id="act3" class="style-selects" >
                                            <c:if test="${not empty nombre_act3}">
                            					<option value="${nombre_act3}" selected>${nombre_act3}</option>
    	                                	</c:if>
    	                                	<option value="Docencia universitaria en pregrado">Docencia universitaria en pregrado</option>
                                            <option value="Investigación y desarrollo">Investigación y desarrollo</option> 
                                            <option value="Docencia universitaria en postgrado">Docencia universitaria en postgrado</option>
                                            <option value="Análisis físicos, químicos, biológicos">Análisis físicos, químicos, biológicos</option>
                                            <option value="Consultorías">Consultorías</option>
                                            <option value="Servicios informáticos, científicos y tecnológicos">Servicios informáticos, científicos y tecnológicos</option>
                                            <option value="Evaluación de proyectos de investigación científica">Evaluación de proyectos de investigación científica</option>
                                         </select>
                                    </div>
                                </div> 

                                <div class="area-investigacion">
                                    <label for="area-invest">Área de investigación:<em>*</em></label>
                                    <div class="input-box">
                                        <select name="area-invest3" id="area-invest3" class="style-selects">
                                            <c:if test="${not empty area_act3}">
                            					<option value="${area_act3}" selected>${area_act3}</option>
    	                                	</c:if>
                                            <option value="Ciencias agropecuarias">Ciencias agropecuarias</option>
                                            <option value="Ciencias de la salud">Ciencias de la salud</option>
                                            <option value="Ciencias exactas y naturales">Ciencias exactas y naturales</option>
                                            <option value="Ciencias sociales">Ciencias sociales</option>
                                            <option value="Ingenierías y tecnología">Ingenierías y tecnología</option>
                                         </select>
                                    </div>
                                </div>  

                                <div class="institucion">
                                    <label for="insti">Institución donde realiza la actividad:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="insti3" name="insti3" value="${insti_act3}" class="datos-actividades"  placeholder="Institución u Organización donde desarrolla la actividad mencionada">
                                    </div>
                                </div>  

                                <div class="departamento">
                                    <label for="depart">Departamento de la Institución:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" id="depart3" name="depart3" value="${depart_act3}" class="datos-actividades"  placeholder="por ejemplo Escuelas, Centros de Investigación, Laboratorio, etc">
                                    </div>
                                </div>

                                <div class="ano-inicio-actividad">
                                    <label for="ano-inicio-act">Año de inicio:<em>*</em></label>
                                    <div class="input-box">
                                        <input type="text" pattern="[1-1][9-9][3-9][0-9]||[2-2][0-0][0-3][0-9]"  id="ano-inicio-act3" name="ano-inicio-act3" value="${anoinicio_act3}" class="datos-actividades"  placeholder="año en que  inició a desarrollar la actividad en el departamento">
                                    </div>
                                </div>

                                <div class="pais-institucion">
                                    <label for="pais-insti">País:<em>*</em></label>
                                    <div class="input-box">
  
  
  
  
										<select id="pais-insti3" name="pais-insti3" class="style-selects">
										<c:if test="${not empty pais_act3}">
                            				<option value="${pais_act3}" selected>${pais_act3}</option>
    	                                </c:if>
										</select>                                                     
                                    </div>
                                </div>

                                <div id="otras-actividades3">

                                </div>
                                <div class="separador"></div>
                            </div>

                            <div class="botones">
                                         
                                <input class="boton" value="Guardar" type="submit" > 
                                <input class="boton" value="Actividad 2" type="button" onclick="document.getElementById('form_prof_1').style.display = 'none';document.getElementById('form_prof_2').style.display = 'block';document.getElementById('form_prof_3').style.display = 'none';"> 
                            </div>
                        </form:form>
                        </div>                       
                        </div>
                        
                       <!------------------------------ SECCION 4 ----------------------------------->
                        
                        
                        
                        <!------------------------------ SECCION 4 ----------------------------------->
                         
                         <div class="panels_item" id="terminos-y-condiciones">
                             <div class="informacion">
                            
                                <div class="terminos">
                                    <textarea id="terminos" readonly></textarea>
                                    <label id="lbl_term" for="term">He leido y acepto los términos y condiciones:<em>*</em></label>
                                    <input type="checkbox" name="term" id="term" required>

                                    <div class="input-box">

                                    </div>
                                </div>

                                <div class="separador"></div>
                            </div>

                           <div class="botones">         

                                <input class="boton" value="guardar" type="submit" >
                                <input class="boton" value="atrás" type="button" onclick="previousTab(2);" >
                            </div>
                        </div>
                        <!------------------------------ SECCION 5 ----------------------------------->
                        <form:form name="accion_configuracion" id="accion_configuracion" action="accion_configuracion" method="POST">
                        <div class="panels_item" id="configuracion-cuenta">
                             <div class="informacion">
                            
                                <table style="width:100%">
                                
                                  <tr>
								    
								    <td><label for="cedula_actual">Cédula:</label></td>
								    <td><label for="correo_actual">Correo:</label></td>
								    
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <input type="number" id="cedula_actual" name="cedula_actual" value="${cedula}" class="entrada-datos" readonly>
                                    </div></td>
								    <td><div class="input-box">
                                        <input type="email" id="correo_actual" name="correo_actual" value="${correo_actual}" class="entrada-datos" readonly>
                                    </div></td>
								  </tr>
                                  <tr>
								    
								    <td><label for="cambiar">Cambiar Contraseña:  </label><input type="checkbox" onClick="mostrarOpcionesConfiguracion()" name="activar_cambio_contra" id="activar_cambio_contra"></td>
								    
								    
								  </tr>
                                </table>
                                <br/>
								<table id="seccion_cambiar_contrasena" style="display: none;width:100%">
                                
                                  <tr>
								    
								    <td><label for="contrasena_actual">Contraseña Actual:<em>*</em></label></td>
								    <td><label for="contrasena_nueva">Contraseña Nueva:<em>*</em></label></td>
								    <td><label for="contrasena_nueva">Confirmar Contraseña:<em>*</em></label></td>
								  </tr>
								  <tr>
								    <td><div class="input-box">
                                        <input type="password" placeholder="contraseña actual" id="contrasena_actual" name="contrasena_actual"  class="entrada-datos" required>
                                    </div></td>
								    <td><div class="input-box">
                                        <input type="password" placeholder="contraseña nueva" id="contrasena_nueva" name="contrasena_nueva"  class="entrada-datos" required>
                                    </div></td>
                                    <td><div class="input-box">
                                        <input type="password" placeholder="vuelva a escirbir la nueva contraseña"  id="contrasena_nueva_confirmar" name="contrasena_nueva_confirmar" class="entrada-datos" required>
                                    </div></td>
                                    <td> <div class="botones">         
										 <input class="boton" value="Actualizar" type="submit" onClick="compararContrasenaConfiguracion();">
                              			</div></td>
								  </tr>
								  <tr>
								  	<td>
								  	
								  	</td>
								  </tr>
                                  
                                </table>
                                
                                <div class="separador">
                                	
                                </div>
                            </div>

                          
                        </div>
                        </form:form>
                        <form:form  name="downloadFile"  action="downloadFile" method="GET">
                        <div id="seccion-descarga-informacion" class="panels_item" style="height:220px;">
                            
                            <div><label id="lbl_term" style="color:#008CBA;font-size: 22px;position:absolute;left:300px;" for="term">Descargar Excel Informativo</label></div>
                            <br/><br/>
                            <div><img src="images/Excel-icon.png" width="200" height="150" style="position:absolute;">
                            	<label class="container" style="position:absolute;top:65px;left:260px">Informacion Usuario Seleccionado
  								  <input type="radio" checked="checked" id="radioExcel1" name="radioExcel" value="1" >
								  <span class="checkmark" style="position:absolute;top:1px;left:5px"></span>
								</label>
								<br/><br/>
								<label class="container" style="position:absolute;top:125px;left:260px">Todos los Usuarios
								  <input type="radio" id="radioExcel2" name="radioExcel" value="2" style="position:absolute;top:125px;left:230px">
								  <span class="checkmark" style="position:absolute;top:2px;left:5px"></span>
								</label>
								<button onClick="determinarTipoDescargaExcel('document.downloadFile.radioExcel');document.getElementById('usuarioDescargar').value = document.getElementById('selectBusqueda').value;" class="button button3" type="submit" style="position:absolute;top:65px;right:100px;width:200px;height:120px;">Descargar</button>
                            	<input type="text" id="determinarTipoDes" name="determinarTipoDes" style="display: none;">
                            	<input type="text" id="usuarioDescargar" name="usuarioDescargar" style="display: none;">
                            </div>

                        </div>
                        
                        </form:form>
                    </div>
                </div>
                
                
         
               
                    
                    

     
        
        <footer> </footer>
        
      
        <script src="js/mostrarCantones.js" type="text/javascript"></script>
        <script src="js/titulosUniversitarios.js" type="text/javascript"></script>
        <script src="js/actividadesProfesionales.js" type="text/javascript"></script>
        <script src="js/imagenPerfil.js" type="text/javascript"></script>
        <script src="js/servletConsultarCedula.js" type="text/javascript"></script>
        <script src="js/validaciones.js" type="text/javascript"></script>
        <script src="js/tabs.js" type="text/javascript"></script>
        <script src="js/mostrarSeccionAcademica.js" type="text/javascript"></script>
        <script src="js/countries.js" type="text/javascript"></script>
        <script language="javascript">
        	populateCountries("pais-univ1");
        	populateCountries("pais-univ2");
            populateCountries("pais-univ3");
        	populateCountries("pais-insti1");
        	populateCountries("pais-insti2");
			populateCountries("pais-insti3");
			populateStates();
		</script>
    </body>
</html>
