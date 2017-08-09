<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>MICITT - VIVO</title>
        <meta name="description" content="MICITT VIVO">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!--pc_styles.css se muestra en dispositivos con pantalla mayor a un ancho de 481px-->
        <link rel="stylesheet" href="css/pc_styles.css" media="screen and (min-width: 481px)">
        <!--mobile_styles.css se muestra en dispositivos moviles con un ancho máximo de 480px-->
        <link rel="stylesheet" href="css/mobile_styles.css" media="handheld, only screen and (max-width: 480px)">
        <!--normalize.css estandariza los estilos para que se vean similar en varios navegadores-->
        <link rel="stylesheet" href="css/normalize.css">
      
        <script src="js/mostrarSeccionesFormulario.js" type="text/javascript"></script>
        <script src="js/mostrarCantones.js" type="text/javascript"></script>
        <script src="js/titulosUniversitarios.js" type="text/javascript"></script>
        <script src="js/actividadesProfesionales.js" type="text/javascript"></script>
        <script src="js/imagenPerfil.js" type="text/javascript"></script>
        <script src="js/servletConsultarCedula.js" type="text/javascript"></script>
        <script src="js/validaciones.js" type="text/javascript"></script>
        <script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
    </head>
    
 <body onload="obtenerCantonElejido();">
        
        
  	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
        <header>
            <img src="images/logo.png" class="logo">
        

            <ul id="menu" class="menu">
                <li><a href="" >Perfil.</a></li>
                <li><a href="javascript:formSubmit()">Salir.</a></li>
            </ul>
        </header>
        
        <div class="formulario">
            
            <form class="formCrearCuenta" method="post" action="servletInsertarDatosPersona">
                
                
                <!--**************************** Obtener nombre **************************************-->            
                <c:if test="${pageContext.request.userPrincipal.name != null}">
				<h2>Bienvenido : ${pageContext.request.userPrincipal.name} </h2> 
				</c:if>
				<div class="separador"></div> 
				<!--****************************                **************************************-->
				
                <!--****************************SECCIÓN 1**************************************-->
                
                <div id="informacion-personal">                
                    <h2>Información Personal</h2>
                    <div class="separador"></div>
                    
                    <div class="informacion">
                                
                        <div class="cedula">
                            <label for="ced">Cédula:<em>*</em></label>
                            <div "input-box">
                                <input type="text" id="ced" name="ced" value="" title="Ingrese su número de cédula" required class="entrada-datos" pattern="[0-9]{9}">
                            </div>
                            <div class="botones"> 
                        		<input class="boton" value="Obtener datos del Registro Civil" type="button" onclick="servletConsultarCedula();" id="btn-siguiente">
                    		</div>
                        </div>
                        
                        <div class="nombre">
                            <label for="nombre">Nombre:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="nombre" name="nombre" value="" title="Ingrese su nombre" required class="entrada-datos" placeholder="ingrese su nombre" pattern="[A-Za-z].{0,}" oninvalid=" seccion_1();">
                            </div>
                        </div>
                            
                        <div class="apellido_1">
                            <label for="apellido_1">Apellido 1°:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="apellido_1" name="apellido_1" value="" title="Ingrese su primer apellido" required class="entrada-datos" pattern="[A-Za-z].{0,}" placeholder="ingrese su primer apellido" oninvalid=" seccion_1();">
                            </div>
                        </div>
                            
                        <div class="apellido_2">
                            <label for="apellido_2">Apellido 2°:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="apellido_2" name="apellido_2" value="" title="Ingrese su segundo apellido" required class="entrada-datos" pattern="[A-Za-z].{0,}" placeholder="ingrese su segundo apellido" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                            
                        <div class="fecha-nacimiento">
                            <label for="fch-nacimiento">Fecha de Nacimiento:<em>*</em></label>
                            <div class="input-box">
                                <input type="date" placeholder="día/mes/año" name="fch-nacimiento" id="fch-nacimiento" min="1900-01-01" required class="entrada-datos" pattern="(0[0-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" oninvalid=" seccion_1();">
                            </div>
                        </div>
                            
                        <div class="genero">
                            <label for="genero">Género<em>*</em></label>
                            <div class="input-box">
                                <select name="genero" id="genero" required class="entrada-datos">
							         <option value="H">Masculino</option>
							         <option value="M">Femenino</option>
							     </select>
                            </div>
                        </div>
                        
                        <div class="provincia-usuario">
                            <label for="provincia">Provincia:<em>*</em></label>
                            <div class="input-box">
                                <select name="provincia" id="provincia" onchange="mostrarCantonXProvincia();" class="entrada-datos" required>
								    <option value="San José">San José</option>
								    <option value="Cartago">Cartago</option>
								    <option value="Heredia">Heredia</option>
								    <option value="Alajuela">Alajuela</option>
								    <option value="Guanacaste">Guanacaste</option>
								    <option value="Limón">Limón</option>
								    <option value="Puntarenas">Puntarenas</option>
							     </select>
                            </div>
                        </div>
                            
                        <div class="canton-usuario">
                            <label for="canton">Cantón:<em>*</em></label>
                            <div class="input-box">
                                <select name="cantonesSJ" id="cantonesSJ" onchange="obtenerCantonElejido();" class="entrada-datos" required>
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
							     
                                <select name="cantonesA" id="cantonesA" onchange="obtenerCantonElejido();" class="entrada-datos" required>
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
							     
                                 <select name="cantonesH" id="cantonesH" onchange="obtenerCantonElejido();" class="entrada-datos" required>
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
							
                                 <select name="cantonesC" id="cantonesC" onchange="obtenerCantonElejido();" class="entrada-datos" required>
								    <option value="Cartago">Cartago</option>
								    <option value="Paraíso">Paraíso</option>
								    <option value="Turrialba">Turrialba</option>
								    <option value="Alvarado">Alvarado</option>
								    <option value="La Unión">La Unión</option>
								    <option value="Oreamuno">Oreamuno</option>
								    <option value="Jímenez">Jímenez</option>
                                    <option value="El Guarco">El Guarco</option>
							     </select> 
                                
							     <select name="cantonesL" id="cantonesL" onchange="obtenerCantonElejido();" class="entrada-datos" required>
								    <option value="Limón">Limón</option>
								    <option value="Pococí">Pococí</option>
								    <option value="Talamanca">Talamanca</option>
								    <option value="Siquirres">Siquirres</option>
								    <option value="Matina">Matina</option>
								    <option value="Guacimo">Guacimo</option>
							     </select> 
                                
							     <select name="cantonesG" id="cantonesG" onchange="obtenerCantonElejido();" class="entrada-datos" required>
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
                                
							     <select name="cantonesP" id="cantonesP" onchange="obtenerCantonElejido();" class="entrada-datos" required>
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
							     <div class="input-box">
                                	<input type="text" style="display: none;" id="cantonObtenidoUsuario" name="cantonObtenidoUsuario" value="" disabled class="entrada-datos" >
                            	</div>
                            </div>
                        </div>
                        <input type="text" style="display: none;" name="cantonElejido" id="cantonElejido"/>
                        <div class="correo-usuario">
                            <label for="correo">Correo Electrónico:<em>*</em></label>
                            <div class="input-box">
                                <input type="email" name="correo" id="correo" required class="entrada-datos" placeholder="ingrese su dirección de correo electrónico" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                        <div class="contraseña-usuario">
                            <label for="contraseña">Contraseña:<em>*</em></label>
                            <div class="input-box">
                                <input type="password" name="contraseña" id="contraseña" required class="entrada-datos" placeholder="ingrese una contraseña para su cuenta en VIVO de 8 a 12 caracteres" oninvalid=" seccion_1();" pattern="[A-Za-z0-9!?-]{8,12}">
                            </div>
                        </div>
                        
                        <div class="confirmar-contraseña">
                            <label for="confirmar-contra">Confirmar contraseña:<em>*</em></label>
                            <div class="input-box">
                                <input type="password" name="confirmar-contra" id="confirmar-contra" required class="entrada-datos" placeholder="ingrese nuevamente su contraseña para confirmar" oninvalid=" seccion_1();" pattern="[A-Za-z0-9!?-]{8,12}">
                            </div>
                        </div>
                        
                        <div class="cel-usuario">
                            <label for="celular">Celular:<em>*</em></label>
                            <div class="input-box">
                                <input type="tel" name="celular" id="celular" required class="entrada-datos" pattern="[0-9]{8}" placeholder="ingrese su número celular de 8 dígitos sin espacios, ni guiones" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                        <div class="telfono-usuario">
                            <label for="tel-usuario">Tel. Trabajo:<em>*</em></label>
                            <div class="input-box">
                                <input type="tel" name="tel-trabajo" id="tel-trabajo" required class="entrada-datos" pattern="[0-9]{8}" placeholder="ingrese el número de teléfono de su trabajo de 8 dígitos sin espacios, ni guiones" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                        <div class="cuenta-orcid">
                            <label for="id-orcid">Id. ORCID:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" name="id-orcid" id="id-orcid" class="entrada-datos" placeholder="ingrese el identificador de su cuenta de ORCID" oninvalid=" seccion_1();">
                                <div id="crear-orcid">puede crear su cuenta ORCID pulsando <a href="https://orcid.org">aquí</a></div>
                            </div>
                        </div>
                        
                        <div class="descripcion-perfil">
                            <label for="descr-perfil">Descripción de su perfil profesional:<em>*</em></label>
                            <div class="input-box">
                                <textarea name="descripcion" id="descripcion" required class="entrada-datos" title="Describa las áreas de desarrollo profesional" placeholder="Describa las áreas de desarrollo profesional" maxlength="1000" oninvalid=" seccion_1();"></textarea>
                            </div>
                        </div>
                        
                         <div class="imagen-perfil">
                            <label for="img-perfil">Foto de Perfil:<em>*</em></label>
                             <div id="original"><img class="item" id="myImage"></div>
	                          
                            <div class="input-box">
                                
                                <input type="file" id="img-perfil" onchange="onFileSelected(event)" class="entrada-datos" oninvalid=" seccion_1();">
                                 <div id="re-dimensionada" class="entrada-datos"></div>
                            </div>
                        </div>
                        
                        <div class="separador"></div>  
                    </div>
                    

            
                    
                    
                    
                    
                    <div class="botones"> 
                        <input class="boton" value="siguiente" type="button" onclick="seccion_2();" id="btn-siguiente" on>
                    </div>
                 </div>   
                
                      <!--****************************SECCIÓN 2**************************************-->               
                
                 <div id="informacion-academica">
                    
                    <h2>Información Académica</h2>
                    <div class="separador"></div>
                     
                    <div class="informacion">
                            
                        <div class="ultimo-titulo">
                            <label for="ult-titulo">Último título universitario obtenido:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" name="ult-titulo" id="ult-titulo" class="entrada-datos" placeholder="ingrese el nombre de su último título obtenido" required oninvalid=" seccion_2();">
                            </div>
                        </div> 
                        
                        <div class="grado-titulo">
                            <label for="grd-titulo">Grado del título:<em>*</em></label>
                            <div class="input-box">
                                <select name="grd-titulo" id="grd-titulo" class="entrada-datos" required>
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
                                <input type="text" id="univ-titulo" name="univ-titulo" class="entrada-datos" required placeholder="ingrese el nombre de la Universidad donde obtuvo el título" oninvalid=" seccion_2();">
                            </div>
                        </div>  
                        
                         <div class="pais-universidad">
                            <label for="pais-univ">País:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="pais-univ" name="pais-univ" class="entrada-datos" required placeholder="ingrese el nombre del país donde obtuvo el título" oninvalid=" seccion_2();">
                            </div>
                        </div>
                        
                        <div class="ano-titulo">
                            <label for="ano-titulo">Año en el que obtuvo el título:<em>*</em></label>
                            <div class="input-box">
                                <input type="number" id="ano-titulo" name="ano-titulo" class="entrada-datos" max="2020" min="1900" required placeholder="ingrese el año en el que obtuvo el título" oninvalid=" seccion_2();">
                            </div>
                        </div>
                        
                        
                        <div id="otros-titulos">
                            
                        </div>
                        <div class="separador"></div>
                    </div>
                     
                    
                    <div class="botones">         
                        
                        <input class="boton" value="siguiente" type="button" onclick="seccion_3();" >
                        <input class="boton" value="atrás" type="button" onclick="seccion_1();" >
                        <input type="button" class="boton" id="agregar-titulo" onClick="agregarTitulo()" value="+ agregar otro título"/>
                        <input type="button" class="boton" id="quitar-titulo" onClick="quitarTitulo()" value="- quitar título"/>
                    </div>
                 </div>  
               
                       <!--****************************SECCIÓN 3**************************************-->               
                
                 <div id="informacion-profesional">
                    
                    <h2>Información Profesional</h2>
                    <div class="separador"></div>
                     
                    <div class="informacion">
                            
                        <div class="actividad">
                            <label for="act">Actividad que realiza:<em>*</em></label>
                            <div class="input-box">
                                <select name="act" id="act" class="entrada-datos" required>
								    <option value="Investigación y desarrollo">Investigación y desarrollo</option>
								    <option value="Docencia universitaria pregrado">Docencia universitaria pregrado</option>
                                    <option value="Docencia universitaria posgrado">Docencia universitaria posgrado</option>
								    <option value="Análisis físicos">Análisis físicos</option>
                                    <option value="Análisis químicos">Análisis químicos</option>
								    <option value="Análisis biológicos">Análisis biológicos</option>
                                    <option value="Consultorías">Consultorías</option>
                                    <option value="Servicios informáticos, científicos y tecnológicos">Servicios informáticos, científicos y tecnológicos</option>
                                    <option value="Evaluación de proyectos de investigación científica">Evaluación de proyectos de investigación científica</option>
							     </select>
                            </div>
                        </div> 
                        
                        <div class="area-investigacion">
                            <label for="area-invest">Área de investigación:<em>*</em></label>
                            <div class="input-box">
                                <select name="area-invest" id="area-invest" class="entrada-datos" required>
								    <option value="Ciencias agropecuarias">Ciencias agropecuarias</option>
								    <option value="Ciencias de la salud">Ciencias de la salud</option>
                                    <option value="Ciencias exactas y naturales">Ciencias exactas y naturales</option>
								    <option value="Ciencias sociales">Ciencias sociales</option>
                                    <option value="Ingenierías y tecnología">Ingenierías y tecnología</option>
							     </select>
                            </div>
                        </div>  
                        
                        <div class="institucion">
                            <label for="insti">Institución donde labora:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="insti" name="insti" class="entrada-datos" required placeholder="Institución u Organización donde desarrolla la actividad mencionada" oninvalid=" seccion_3();">
                            </div>
                        </div>  
                        
                        <div class="departamento">
                            <label for="depart">Departamento de la Institución:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="depart" name="depart" class="entrada-datos" required placeholder="por ejemplo Escuelas, Centros de Investigación, Laboratorio, etc" oninvalid=" seccion_3();">
                            </div>
                        </div>
                        
                        <div class="ano-inicio-actividad">
                            <label for="ano-inicio-act">Año de inicio:<em>*</em></label>
                            <div class="input-box">
                                <input type="number" min="1900" max="2020"  id="ano-inicio-act" name="ano-inicio-act" class="entrada-datos" required placeholder="año en que  inició a desarrollar la actividad en el departamento" oninvalid="seccion_3();">
                            </div>
                        </div>
                        
                        <div class="pais-institucion">
                            <label for="pais-insti">País:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="pais-insti" name="pais-insti" class="entrada-datos" required placeholder="ingrese el país donde se encuentra la Institución" oninvalid=" seccion_3();">
                            </div>
                        </div>
                        
                        <div id="otras-actividades">
                            
                        </div>
                        <div class="separador"></div>
                    </div>
                    
                    <div class="botones">         
                        
                        <input class="boton" value="siguiente" type="button" onclick="seccion_4();" >
                        <input class="boton" value="atrás" type="button" onclick="seccion_2();" >
                        <input type="button" class="boton" id="agregar-act" onClick="agregarActividad()" value="+ agregar otra actividad"/>
                        <input type="button" class="boton" id="quitar-act" onClick="quitarActividad()" value="- quitar actividad"/>
                    </div>
                 </div>  
               
                <!--****************************SECCIÓN 4**************************************-->               
                
                 <div id="terminos-condiciones">
                    
                    <h2>Términos y Condiciones</h2>
                    <div class="separador"></div>
                     
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
                        
                        <input class="boton" value="enviar" type="submit" >
                        <input class="boton" value="atrás" type="button" onclick="seccion_3();" >
                    </div>
                 </div>
                
            </form>   
                    
                    

        </div>
        
        <footer> </footer>
        
      
    </body>
</html>