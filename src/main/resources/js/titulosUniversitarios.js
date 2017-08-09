a = 0;//consecutivo
function agregarTitulo(){
    a++;
    
    if(a>3){
       alert("Ha llegado al límite de títulos ingresados"); 
       a--;
    }
    else{
        var titulo = document.createElement('div');
        titulo.setAttribute('class', 'form-inline');
        titulo.innerHTML = '<div id="nuevo-titulo_'+a+'"><div class="separador"></div><div class="titulo-obt_'+a+'"><label for="titulo_'+a+'">Título universitario obtenido:<em>*</em></label><div class="input-box"><input type="text" name="titulo_'+a+'" id="titulo_'+a+'" class="datos-titulos" placeholder="ingrese el nombre del título obtenido" required oninvalid=" seccion_2();"></div></div><div class="grado-titulo_'+a+'"><label for="grd-titulo_'+a+'" >Grado del título:<em>*</em></label><div class="input-box"><select name="grd-titulo_'+a+'" id="grd-titulo_'+a+'" class="datos-titulos" required><option value="Doctor">Doctor</option><option value="Doctora">Doctora</option><option value="Master">Master</option><option value="Licenciada">Licenciada</option><option value="Licenciado">Licenciado</option><option value="Bachiller">Bachiller Universitario</option></select></div></div><div class="universidad-titulo_'+a+'"><label for="univ-titulo_'+a+'">Universidad:<em>*</em></label><div class="input-box"><input type="text" id="univ-titulo_'+a+'" name="univ-titulo_'+a+'" class="datos-titulos" required placeholder="ingrese el nombre de la Universidad donde obtuvo el título" oninvalid=" seccion_2();"></div></div><div class="pais-universidad_'+a+'"><label for="pais-univ">País:<em>*</em></label><div class="input-box"><input type="text" id="pais-univ_'+a+'" name="pais-univ_'+a+'" class="datos-titulos" required placeholder="ingrese el nombre del país donde obtuvo el título" oninvalid=" seccion_2();"></div></div><div class="ano-titulo_'+a+'"><label for="ano-titulo_'+a+'">Año en el que obtuvo el título:<em>*</em></label><div class="input-box"><input type="number" id="ano-titulo_'+a+'" name="ano-titulo_'+a+'" class="datos-titulos" min="1900" max="2020" required placeholder="ingrese el año en el que obtuvo el título" oninvalid=" seccion_2();"></div></div></div>';
        
        document.getElementById('otros-titulos').appendChild(titulo);document.getElementById('otros-titulos').appendChild(titulo);
        document.getElementById('quitar-titulo').style.display = "block";

    }
}

function quitarTitulo(){
    
	var titulo = document.getElementById('nuevo-titulo_'+a);	
	if (!titulo){
		alert("El elemento selecionado no existe");
	} else {
        padre = titulo.parentNode;
        padre.removeChild(titulo);
	}
    if(a==1){
        document.getElementById('quitar-titulo').style.display = "none";
    }
    a--;
}