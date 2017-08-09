var asyncRequest;   
function servletConsultarCedula(){
    try
    {
    	var pCedula=document.getElementById("ced").value;
    	var data = new FormData();
    	data.append('cedula', pCedula);

 
        asyncRequest = new XMLHttpRequest();
        asyncRequest.addEventListener("readystatechange", stateChange, false);
        asyncRequest.open('POST', '/formularioVIVO/servletConsultarCedula', true);    //   /Test is url to Servlet!
            
        asyncRequest.send(data);
  	    

    }
    catch(exception)
   {
    alert("Request failed");
   }
}

function stateChange(){
	if(asyncRequest.readyState == 4 && asyncRequest.status == 200)
	    {

		var respuesta = asyncRequest.responseText;
		var arregloRespuesta = respuesta.split(",");
	    var cedula = arregloRespuesta[0];
	    var nombre = arregloRespuesta[1];
	    var apellido1 = arregloRespuesta[2];
	    var apellido2 = arregloRespuesta[3];
	    var sexo = arregloRespuesta[4];
	    var provincia = arregloRespuesta[5];
	    var canton = arregloRespuesta[6];
	    
	    document.getElementById("ced").value = cedula;
	    document.getElementById("nombre").value = nombre; 
	    document.getElementById("apellido_1").value = apellido1;
	    document.getElementById("apellido_2").value = apellido2;
	    document.getElementById("provincia").value = provincia;
	    document.getElementById("genero").value = sexo;

	    
	    obtenerCantonRegistro(canton);
		
	    
	    
	    
	    

	    }
	}


window.addEventListener("load", start(), false);