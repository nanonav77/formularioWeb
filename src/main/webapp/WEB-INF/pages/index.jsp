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
        <!--mobile_styles.css se muestra en dispositivos moviles con un ancho m�ximo de 480px-->
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
				
                <!--****************************SECCI�N 1**************************************-->
                
                <div id="informacion-personal">                
                    <h2>Informaci�n Personal</h2>
                    <div class="separador"></div>
                    
                    <div class="informacion">
                                
                        <div class="cedula">
                            <label for="ced">C�dula:<em>*</em></label>
                            <div "input-box">
                                <input type="text" id="ced" name="ced" value="" title="Ingrese su n�mero de c�dula" required class="entrada-datos" pattern="[0-9]{9}">
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
                            <label for="apellido_1">Apellido 1�:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="apellido_1" name="apellido_1" value="" title="Ingrese su primer apellido" required class="entrada-datos" pattern="[A-Za-z].{0,}" placeholder="ingrese su primer apellido" oninvalid=" seccion_1();">
                            </div>
                        </div>
                            
                        <div class="apellido_2">
                            <label for="apellido_2">Apellido 2�:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="apellido_2" name="apellido_2" value="" title="Ingrese su segundo apellido" required class="entrada-datos" pattern="[A-Za-z].{0,}" placeholder="ingrese su segundo apellido" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                            
                        <div class="fecha-nacimiento">
                            <label for="fch-nacimiento">Fecha de Nacimiento:<em>*</em></label>
                            <div class="input-box">
                                <input type="date" placeholder="d�a/mes/a�o" name="fch-nacimiento" id="fch-nacimiento" min="1900-01-01" required class="entrada-datos" pattern="(0[0-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" oninvalid=" seccion_1();">
                            </div>
                        </div>
                            
                        <div class="genero">
                            <label for="genero">G�nero<em>*</em></label>
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
								    <option value="San Jos�">San Jos�</option>
								    <option value="Cartago">Cartago</option>
								    <option value="Heredia">Heredia</option>
								    <option value="Alajuela">Alajuela</option>
								    <option value="Guanacaste">Guanacaste</option>
								    <option value="Lim�n">Lim�n</option>
								    <option value="Puntarenas">Puntarenas</option>
							     </select>
                            </div>
                        </div>
                            
                        <div class="canton-usuario">
                            <label for="canton">Cant�n:<em>*</em></label>
                            <div class="input-box">
                                <select name="cantonesSJ" id="cantonesSJ" onchange="obtenerCantonElejido();" class="entrada-datos" required>
								    <option value="San Jos�">San Jos�</option>
								    <option value="Escaz�">Escaz�</option>
								    <option value="Desamparados">Desamparados</option>
								    <option value="Puriscal">Puriscal</option>
								    <option value="Tarraz�">Tarraz�</option>
								    <option value="Goicoechea">Goicoechea</option>
								    <option value="Aserr�">Aserr�</option>
								    <option value="Mora">Mora</option>
                                    <option value="Santa Ana">Santa Ana</option>
							     	<option value="Alajuelita">Alajuelita</option>
								    <option value="Acosta">Acosta</option>
                                    <option value="Coronado">Coronado</option>
                                    <option value="Tib�s">Tib�s</option>
                                    <option value="Moravia">Moravia</option>
                                    <option value="Montes de Oca">Montes de Oca</option>
                                    <option value="Turrubares">Turrubares</option>
                                    <option value="Curridabat">Curridabat</option>
                                    <option value="Dota">Dota</option>
                                    <option value="Perez Zeled�n">Perez Zeled�n</option>
                                    <option value="Le�n Cort�s">Le�n Cort�s</option>
							     </select> 
							     
                                <select name="cantonesA" id="cantonesA" onchange="obtenerCantonElejido();" class="entrada-datos" required>
								    <option value="Alajuela">Alajuela</option>
								    <option value="San Ram�n">San Ram�n</option>
								    <option value="Grecia">Grecia</option>
								    <option value="San Mateo">San Mateo</option>
								    <option value="Atenas">Atenas</option>
								    <option value="Naranjo">Naranjo</option>
								    <option value="Po�s">Po�s</option>
								    <option value="Palmares">Palmares</option>
                                    <option value="Orotina">Orotina</option>
                                    <option value="San Carlos">San Carlos</option>
                                    <option value="Valverde Vega">Valverde Vega</option>
                                    <option value="Alfaro Ru�z">Alfaro Ru�z</option>
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
								    <option value="Bel�n">Bel�n</option>
								    <option value="San Pablo">San Pablo</option>
								    <option value="Sarapiqui">Sarapiqui</option>
							     </select> 
							
                                 <select name="cantonesC" id="cantonesC" onchange="obtenerCantonElejido();" class="entrada-datos" required>
								    <option value="Cartago">Cartago</option>
								    <option value="Para�so">Para�so</option>
								    <option value="Turrialba">Turrialba</option>
								    <option value="Alvarado">Alvarado</option>
								    <option value="La Uni�n">La Uni�n</option>
								    <option value="Oreamuno">Oreamuno</option>
								    <option value="J�menez">J�menez</option>
                                    <option value="El Guarco">El Guarco</option>
							     </select> 
                                
							     <select name="cantonesL" id="cantonesL" onchange="obtenerCantonElejido();" class="entrada-datos" required>
								    <option value="Lim�n">Lim�n</option>
								    <option value="Pococ�">Pococ�</option>
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
								    <option value="Ca�as">Ca�as</option>
								    <option value="Tilar�n">Tilar�n</option>
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
                            <label for="correo">Correo Electr�nico:<em>*</em></label>
                            <div class="input-box">
                                <input type="email" name="correo" id="correo" required class="entrada-datos" placeholder="ingrese su direcci�n de correo electr�nico" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                        <div class="contrase�a-usuario">
                            <label for="contrase�a">Contrase�a:<em>*</em></label>
                            <div class="input-box">
                                <input type="password" name="contrase�a" id="contrase�a" required class="entrada-datos" placeholder="ingrese una contrase�a para su cuenta en VIVO de 8 a 12 caracteres" oninvalid=" seccion_1();" pattern="[A-Za-z0-9!?-]{8,12}">
                            </div>
                        </div>
                        
                        <div class="confirmar-contrase�a">
                            <label for="confirmar-contra">Confirmar contrase�a:<em>*</em></label>
                            <div class="input-box">
                                <input type="password" name="confirmar-contra" id="confirmar-contra" required class="entrada-datos" placeholder="ingrese nuevamente su contrase�a para confirmar" oninvalid=" seccion_1();" pattern="[A-Za-z0-9!?-]{8,12}">
                            </div>
                        </div>
                        
                        <div class="cel-usuario">
                            <label for="celular">Celular:<em>*</em></label>
                            <div class="input-box">
                                <input type="tel" name="celular" id="celular" required class="entrada-datos" pattern="[0-9]{8}" placeholder="ingrese su n�mero celular de 8 d�gitos sin espacios, ni guiones" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                        <div class="telfono-usuario">
                            <label for="tel-usuario">Tel. Trabajo:<em>*</em></label>
                            <div class="input-box">
                                <input type="tel" name="tel-trabajo" id="tel-trabajo" required class="entrada-datos" pattern="[0-9]{8}" placeholder="ingrese el n�mero de tel�fono de su trabajo de 8 d�gitos sin espacios, ni guiones" oninvalid=" seccion_1();">
                            </div>
                        </div>
                        
                        <div class="cuenta-orcid">
                            <label for="id-orcid">Id. ORCID:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" name="id-orcid" id="id-orcid" class="entrada-datos" placeholder="ingrese el identificador de su cuenta de ORCID" oninvalid=" seccion_1();">
                                <div id="crear-orcid">puede crear su cuenta ORCID pulsando <a href="https://orcid.org">aqu�</a></div>
                            </div>
                        </div>
                        
                        <div class="descripcion-perfil">
                            <label for="descr-perfil">Descripci�n de su perfil profesional:<em>*</em></label>
                            <div class="input-box">
                                <textarea name="descripcion" id="descripcion" required class="entrada-datos" title="Describa las �reas de desarrollo profesional" placeholder="Describa las �reas de desarrollo profesional" maxlength="1000" oninvalid=" seccion_1();"></textarea>
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
                
                      <!--****************************SECCI�N 2**************************************-->               
                
                 <div id="informacion-academica">
                    
                    <h2>Informaci�n Acad�mica</h2>
                    <div class="separador"></div>
                     
                    <div class="informacion">
                            
                        <div class="ultimo-titulo">
                            <label for="ult-titulo">�ltimo t�tulo universitario obtenido:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" name="ult-titulo" id="ult-titulo" class="entrada-datos" placeholder="ingrese el nombre de su �ltimo t�tulo obtenido" required oninvalid=" seccion_2();">
                            </div>
                        </div> 
                        
                        <div class="grado-titulo">
                            <label for="grd-titulo">Grado del t�tulo:<em>*</em></label>
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
                                <input type="text" id="univ-titulo" name="univ-titulo" class="entrada-datos" required placeholder="ingrese el nombre de la Universidad donde obtuvo el t�tulo" oninvalid=" seccion_2();">
                            </div>
                        </div>  
                        
                         <div class="pais-universidad">
                            <label for="pais-univ">Pa�s:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="pais-univ" name="pais-univ" class="entrada-datos" required placeholder="ingrese el nombre del pa�s donde obtuvo el t�tulo" oninvalid=" seccion_2();">
                            </div>
                        </div>
                        
                        <div class="ano-titulo">
                            <label for="ano-titulo">A�o en el que obtuvo el t�tulo:<em>*</em></label>
                            <div class="input-box">
                                <input type="number" id="ano-titulo" name="ano-titulo" class="entrada-datos" max="2020" min="1900" required placeholder="ingrese el a�o en el que obtuvo el t�tulo" oninvalid=" seccion_2();">
                            </div>
                        </div>
                        
                        
                        <div id="otros-titulos">
                            
                        </div>
                        <div class="separador"></div>
                    </div>
                     
                    
                    <div class="botones">         
                        
                        <input class="boton" value="siguiente" type="button" onclick="seccion_3();" >
                        <input class="boton" value="atr�s" type="button" onclick="seccion_1();" >
                        <input type="button" class="boton" id="agregar-titulo" onClick="agregarTitulo()" value="+ agregar otro t�tulo"/>
                        <input type="button" class="boton" id="quitar-titulo" onClick="quitarTitulo()" value="- quitar t�tulo"/>
                    </div>
                 </div>  
               
                       <!--****************************SECCI�N 3**************************************-->               
                
                 <div id="informacion-profesional">
                    
                    <h2>Informaci�n Profesional</h2>
                    <div class="separador"></div>
                     
                    <div class="informacion">
                            
                        <div class="actividad">
                            <label for="act">Actividad que realiza:<em>*</em></label>
                            <div class="input-box">
                                <select name="act" id="act" class="entrada-datos" required>
								    <option value="Investigaci�n y desarrollo">Investigaci�n y desarrollo</option>
								    <option value="Docencia universitaria pregrado">Docencia universitaria pregrado</option>
                                    <option value="Docencia universitaria posgrado">Docencia universitaria posgrado</option>
								    <option value="An�lisis f�sicos">An�lisis f�sicos</option>
                                    <option value="An�lisis qu�micos">An�lisis qu�micos</option>
								    <option value="An�lisis biol�gicos">An�lisis biol�gicos</option>
                                    <option value="Consultor�as">Consultor�as</option>
                                    <option value="Servicios inform�ticos, cient�ficos y tecnol�gicos">Servicios inform�ticos, cient�ficos y tecnol�gicos</option>
                                    <option value="Evaluaci�n de proyectos de investigaci�n cient�fica">Evaluaci�n de proyectos de investigaci�n cient�fica</option>
							     </select>
                            </div>
                        </div> 
                        
                        <div class="area-investigacion">
                            <label for="area-invest">�rea de investigaci�n:<em>*</em></label>
                            <div class="input-box">
                                <select name="area-invest" id="area-invest" class="entrada-datos" required>
								    <option value="Ciencias agropecuarias">Ciencias agropecuarias</option>
								    <option value="Ciencias de la salud">Ciencias de la salud</option>
                                    <option value="Ciencias exactas y naturales">Ciencias exactas y naturales</option>
								    <option value="Ciencias sociales">Ciencias sociales</option>
                                    <option value="Ingenier�as y tecnolog�a">Ingenier�as y tecnolog�a</option>
							     </select>
                            </div>
                        </div>  
                        
                        <div class="institucion">
                            <label for="insti">Instituci�n donde labora:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="insti" name="insti" class="entrada-datos" required placeholder="Instituci�n u Organizaci�n donde desarrolla la actividad mencionada" oninvalid=" seccion_3();">
                            </div>
                        </div>  
                        
                        <div class="departamento">
                            <label for="depart">Departamento de la Instituci�n:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="depart" name="depart" class="entrada-datos" required placeholder="por ejemplo Escuelas, Centros de Investigaci�n, Laboratorio, etc" oninvalid=" seccion_3();">
                            </div>
                        </div>
                        
                        <div class="ano-inicio-actividad">
                            <label for="ano-inicio-act">A�o de inicio:<em>*</em></label>
                            <div class="input-box">
                                <input type="number" min="1900" max="2020"  id="ano-inicio-act" name="ano-inicio-act" class="entrada-datos" required placeholder="a�o en que  inici� a desarrollar la actividad en el departamento" oninvalid="seccion_3();">
                            </div>
                        </div>
                        
                        <div class="pais-institucion">
                            <label for="pais-insti">Pa�s:<em>*</em></label>
                            <div class="input-box">
                                <input type="text" id="pais-insti" name="pais-insti" class="entrada-datos" required placeholder="ingrese el pa�s donde se encuentra la Instituci�n" oninvalid=" seccion_3();">
                            </div>
                        </div>
                        
                        <div id="otras-actividades">
                            
                        </div>
                        <div class="separador"></div>
                    </div>
                    
                    <div class="botones">         
                        
                        <input class="boton" value="siguiente" type="button" onclick="seccion_4();" >
                        <input class="boton" value="atr�s" type="button" onclick="seccion_2();" >
                        <input type="button" class="boton" id="agregar-act" onClick="agregarActividad()" value="+ agregar otra actividad"/>
                        <input type="button" class="boton" id="quitar-act" onClick="quitarActividad()" value="- quitar actividad"/>
                    </div>
                 </div>  
               
                <!--****************************SECCI�N 4**************************************-->               
                
                 <div id="terminos-condiciones">
                    
                    <h2>T�rminos y Condiciones</h2>
                    <div class="separador"></div>
                     
                    <div class="informacion">
                            
                        <div class="terminos">
                            <textarea id="terminos" readonly></textarea>
                            <label id="lbl_term" for="term">He leido y acepto los t�rminos y condiciones:<em>*</em></label>
                            <input type="checkbox" name="term" id="term" required>
                            
                            <div class="input-box">
                                
                            </div>
                        </div>
                        
                        <div class="separador"></div>
                    </div>
                    
                   <div class="botones">         
                        
                        <input class="boton" value="enviar" type="submit" >
                        <input class="boton" value="atr�s" type="button" onclick="seccion_3();" >
                    </div>
                 </div>
                
            </form>   
                    
                    

        </div>
        
        <footer> </footer>
        
      
    </body>
</html>