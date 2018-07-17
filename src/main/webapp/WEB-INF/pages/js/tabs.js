(function(d){
    let tabs = Array.prototype.slice.apply(d.querySelectorAll('.tabs_item'));
    let panels = Array.prototype.slice.apply(d.querySelectorAll('.panels_item'));
    
    
    d.getElementById('tabs').addEventListener('click', e => {
        if(e.target.classList.contains('tabs_item')){
            let i = tabs.indexOf(e.target);
            changeActive(tabs, panels, i);
            
        }
    });
   
})(document); 


function nextTab(i){
    let tabs = Array.prototype.slice.apply(document.querySelectorAll('.tabs_item'));
    let panels = Array.prototype.slice.apply(document.querySelectorAll('.panels_item'));
    changeActive(tabs, panels, i);
}

function previousTab(i){
    let tabs = Array.prototype.slice.apply(document.querySelectorAll('.tabs_item'));
    let panels = Array.prototype.slice.apply(document.querySelectorAll('.panels_item'));
    changeActive(tabs, panels, i); 
}

function changeActive(tabs, panels, i){
    tabs.map(tab => tab.classList.remove('active'));
    tabs[i].classList.add('active');
    panels.map(panel => panel.classList.remove('active'));
    panels[i].classList.add('active');
}

function mostrarOpcionesConfiguracion(){
	
	if (document.getElementById('activar_cambio_contra').checked)
	{
		document.getElementById('seccion_cambiar_contrasena').style.display = "block";
		
	}
	else{
		document.getElementById('seccion_cambiar_contrasena').style.display = "none";
		
	}
	
}

function compararContrasenaConfiguracion(){


	
	if (document.accion_configuracion.contrasena_nueva.value !== document.accion_configuracion.contrasena_nueva_confirmar.value) 
	{
		document.accion_configuracion.contrasena_nueva_confirmar.setCustomValidity('Las contraseñas no coinciden.');
		
		return false; 
	}
	else 
	{
		alert("Por favor verifique en su correo electrónico que la contraseña se haya actualizado.");
		return true;
	}
}



