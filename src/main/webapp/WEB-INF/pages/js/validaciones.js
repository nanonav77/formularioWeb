function validarNombre(){
	
	var nombreIngresado = document.getElementById('nombre').value;
	
	alert(typeof(nombreIngresado));
	
	
}

function compararContrasena(){

	if (document.registro.contrasena.value !== document.registro.contrasena_confirm.value) 
	{
		document.registro.contrasena_confirm.setCustomValidity('Las contraseñas no coinciden.');
		//alert('Las contrasenas no son identicas.');
		return false; 
	}
	else 
	{
		return true;
	}
}

