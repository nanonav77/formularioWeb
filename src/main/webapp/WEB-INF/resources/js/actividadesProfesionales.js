a = 0;//consecutivo
function agregarActividad(){
    a++;
    
    if(a>4){
       alert("Ha llegado al límite de actividades ingresadas"); 
       a--;
    }
    else{
        var actividad = document.createElement('div');
        actividad.setAttribute('class', 'form-inline');
        actividad.innerHTML = '<div id="nueva-actividad_'+a+'"><div class="separador"></div><div class="actividad_'+a+'"><label for="act">Actividad que realiza:<em>*</em></label><div class="input-box"><select name="act_'+a+'" id="act_'+a+'" class="datos-actividades" required><option value="Investigación y desarrollo">Investigación y desarrollo</option><option value="Docencia universitaria pregrado">Docencia universitaria pregrado</option><option value="Docencia universitaria posgrado">Docencia universitaria posgrado</option><option value="Análisis físicos">Análisis físicos</option><option value="Análisis químicos">Análisis químicos</option><option value="Análisis biológicos">Análisis biológicos</option<option value="Consultorías">Consultorías</option><option value="Servicios informáticos, científicos y tecnológicos">Servicios informáticos, científicos y tecnológicos</option><option value="Evaluación de proyectos de investigación científica">Evaluación de proyectos de investigación científica</option></select></div></div><div class="area-investigacion_'+a+'"><label for="area-invest">Área de investigación:<em>*</em></label><div class="input-box"><select name="area-invest_'+a+'" id="area-invest" class="datos-actividades" required><option value="Ciencias agropecuarias">Ciencias agropecuarias</option><option value="Ciencias de la salud">Ciencias de la salud</option><option value="Ciencias exactas y naturales">Ciencias exactas y naturales</option><option value="Ciencias sociales">Ciencias sociales</option><option value="Ingenierías y tecnología">Ingenierías y tecnología</option></select></div></div><div class="institucion_'+a+'"><label for="insti_'+a+'">Institución donde labora:<em>*</em></label><div class="input-box"><input type="text" id="insti_'+a+'" name="insti_'+a+'" class="datos-actividades" required placeholder="Institución u Organización donde desarrolla la actividad mencionada"></div></div><div class="departamento_'+a+'"><label for="depart_'+a+'">Departamento de la Institución:<em>*</em></label><div class="input-box"><input type="text" id="depart_'+a+'" name="depart_'+a+'" class="datos-actividades" required placeholder="por ejemplo Escuelas, Centros de Investigación, Laboratorio, etc"></div></div><div class="ano-inicio-actividad_'+a+'"><label for="ano-inicio-act_'+a+'">Año de inicio:<em>*</em></label><div class="input-box"><input type="number" min="1900" max="2020"id="ano-inicio-act_'+a+'" name="ano-inicio-act_'+a+'" class="datos-actividades" required placeholder="año en que  inició a desarrollar la actividad en el departamento"></div></div><div class="pais-institucion_'+a+'"><label for="pais-insti_'+a+'">País:<em>*</em></label><div class="input-box"><input type="text" id="pais-insti_'+a+'" name="pais-insti_'+a+'" class="datos-actividades" required placeholder="ingrese el país donde se encuentra la Institución "></div></div></div>';
        
        document.getElementById('otras-actividades').appendChild(actividad);document.getElementById('otras-actividades').appendChild(actividad);
        document.getElementById('quitar-act').style.display = "block";

    }
}

function quitarActividad(){
    
	var actividad = document.getElementById('nueva-actividad_'+a);	
	if (!actividad){
		alert("El elemento selecionado no existe");
	} else {
        padre = actividad.parentNode;
        padre.removeChild(actividad);
	}
    if(a==1){
        document.getElementById('quitar-act').style.display = "none";
    }
    a--;
}