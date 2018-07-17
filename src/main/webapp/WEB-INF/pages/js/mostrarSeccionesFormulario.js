
function seccion_1() {
    
    document.getElementById('informacion-personal').style.display = "block";
    document.getElementById('informacion-academica').style.display = "none";
    document.getElementById('informacion-profesional').style.display = "none";
    document.getElementById('terminos-condiciones').style.display = "none";
    document.getElementById('configuracion-cuenta').style.display = "none";
}

function seccion_2() {

    document.getElementById('informacion-personal').style.display = "none";
    document.getElementById('informacion-academica').style.display = "block";
    document.getElementById('informacion-profesional').style.display = "none";
    document.getElementById('terminos-condiciones').style.display = "none";
    document.getElementById('configuracion-cuenta').style.display = "none";
}

function seccion_3() {
    
    document.getElementById('informacion-personal').style.display = "none";
    document.getElementById('informacion-academica').style.display = "none";
    document.getElementById('informacion-profesional').style.display = "block";
    document.getElementById('terminos-condiciones').style.display = "none";
    document.getElementById('configuracion-cuenta').style.display = "none";
}

function seccion_4() {
    
    document.getElementById('informacion-personal').style.display = "none";
    document.getElementById('informacion-academica').style.display = "none";
    document.getElementById('informacion-profesional').style.display = "none";
    document.getElementById('terminos-condiciones').style.display = "block";
    document.getElementById('configuracion-cuenta').style.display = "none";
}
function seccion_5() {
    
    document.getElementById('informacion-personal').style.display = "none";
    document.getElementById('informacion-academica').style.display = "none";
    document.getElementById('informacion-profesional').style.display = "none";
    document.getElementById('terminos-condiciones').style.display = "none";
    document.getElementById('configuracion-cuenta').style.display = "block";
}

function recordarContrasena(){
	document.getElementById('cedula').style.display = "none";
	document.getElementById('contrasena').style.display = "none";
	document.getElementById('submitI').style.display = "none";
	document.getElementById('olvidoCon').style.display = "none";
	document.getElementById('etiquetaLogin').style.display = "none";
	
	document.getElementById('cedulaE').style.display = "block";
	document.getElementById('correoE').style.display = "block";
	document.getElementById('submitE').style.display = "block";
	document.getElementById('atrasLogin').style.display = "block";
	document.getElementById('etiquetaRecordar').style.display = "block";
}

function volverLogin(){
	document.getElementById('cedula').style.display = "block";
	document.getElementById('contrasena').style.display = "block";
	document.getElementById('submitI').style.display = "block";
	document.getElementById('olvidoCon').style.display = "block";
	document.getElementById('etiquetaLogin').style.display = "block";
	
	document.getElementById('cedulaE').style.display = "none";
	document.getElementById('correoE').style.display = "none";
	document.getElementById('submitE').style.display = "none";
	document.getElementById('atrasLogin').style.display = "none";
	document.getElementById('etiquetaRecordar').style.display = "none";
}


