function mostrarCantonXProvincia() {
    
	var provincia = document.getElementById("provincia").value;


	if(provincia == "Puntarenas"){
		document.getElementById('cantonesSJ').style.display = "none";
		document.getElementById('cantonesA').style.display = "none";
		document.getElementById('cantonesH').style.display = "none";
		document.getElementById('cantonesC').style.display = "none";
		document.getElementById('cantonesL').style.display = "none";
		document.getElementById('cantonesG').style.display = "none";
		document.getElementById('cantonesP').style.display = "block";
		document.getElementById("cantonObtenidoUsuario").style.display = "none";
		
	}
	
	if(provincia == "San José"){
		document.getElementById('cantonesSJ').style.display = "block";
		document.getElementById('cantonesA').style.display = "none";
		document.getElementById('cantonesH').style.display = "none";
		document.getElementById('cantonesC').style.display = "none";
		document.getElementById('cantonesL').style.display = "none";
		document.getElementById('cantonesG').style.display = "none";
		document.getElementById('cantonesP').style.display = "none";
		document.getElementById("cantonObtenidoUsuario").style.display = "none";
	}
    if(provincia == "Alajuela"){
		document.getElementById('cantonesSJ').style.display = "none";
		document.getElementById('cantonesA').style.display = "block";
		document.getElementById('cantonesH').style.display = "none";
		document.getElementById('cantonesC').style.display = "none";
		document.getElementById('cantonesL').style.display = "none";
		document.getElementById('cantonesG').style.display = "none";
		document.getElementById('cantonesP').style.display = "none";
		document.getElementById("cantonObtenidoUsuario").style.display = "none";
	}
    if(provincia == "Heredia"){
		document.getElementById('cantonesSJ').style.display = "none";
		document.getElementById('cantonesA').style.display = "none";
		document.getElementById('cantonesH').style.display = "block";
		document.getElementById('cantonesC').style.display = "none";
		document.getElementById('cantonesL').style.display = "none";
		document.getElementById('cantonesG').style.display = "none";
		document.getElementById('cantonesP').style.display = "none";
		document.getElementById("cantonObtenidoUsuario").style.display = "none";
	}
    if(provincia == "Cartago"){
		document.getElementById('cantonesSJ').style.display = "none";
		document.getElementById('cantonesA').style.display = "none";
		document.getElementById('cantonesH').style.display = "none";
		document.getElementById('cantonesC').style.display = "block";
		document.getElementById('cantonesL').style.display = "none";
		document.getElementById('cantonesG').style.display = "none";
		document.getElementById('cantonesP').style.display = "none";
		document.getElementById("cantonObtenidoUsuario").style.display = "none";
	}
    if(provincia == "Limón"){
		document.getElementById('cantonesSJ').style.display = "none";
		document.getElementById('cantonesA').style.display = "none";
		document.getElementById('cantonesH').style.display = "none";
		document.getElementById('cantonesC').style.display = "none";
		document.getElementById('cantonesL').style.display = "block";
		document.getElementById('cantonesG').style.display = "none";
		document.getElementById('cantonesP').style.display = "none";
		document.getElementById("cantonObtenidoUsuario").style.display = "none";
	}
    if(provincia == "Guanacaste"){
		document.getElementById('cantonesSJ').style.display = "none";
		document.getElementById('cantonesA').style.display = "none";
		document.getElementById('cantonesH').style.display = "none";
		document.getElementById('cantonesC').style.display = "none";
		document.getElementById('cantonesL').style.display = "none";
		document.getElementById('cantonesG').style.display = "block";
		document.getElementById('cantonesP').style.display = "none";
		document.getElementById("cantonObtenidoUsuario").style.display = "none";
	}
    obtenerCantonElejido();
    
}

function obtenerCantonElejido(){
  	 var provincia = document.getElementById("provincia").value;

  	 if(provincia == "San José"){
  		 document.getElementById('cantonElejido').value = document.getElementById('cantonesSJ').value;
  		
  		}
  	    if(provincia == "Alajuela"){
  			
  	    	document.getElementById('cantonElejido').value = document.getElementById('cantonesA').value;
  			
  		}
  	    if(provincia == "Heredia"){
  			
  	    	document.getElementById('cantonElejido').value = document.getElementById('cantonesH').value;
  			
  		}
  	    if(provincia == "Cartago"){
  			
  	    	document.getElementById('cantonElejido').value = document.getElementById('cantonesC').value;
  			
  		}
  	    if(provincia == "Limón"){
  			
  	    	document.getElementById('cantonElejido').value = document.getElementById('cantonesL').value;
  	
  		}
  	    if(provincia == "Guanacaste"){
  			
  	    	document.getElementById('cantonElejido').value = document.getElementById('cantonesG').value;
  			
  		}
  	    if(provincia == "Puntarenas"){
  			
  	    	document.getElementById('cantonElejido').value = document.getElementById('cantonesP').value;
  		}
  	    
  }
function obtenerCantonRegistro(canton){
	
    
    document.getElementById('cantonesSJ').style.display = "none";
	document.getElementById('cantonesA').style.display = "none";
	document.getElementById('cantonesH').style.display = "none";
	document.getElementById('cantonesC').style.display = "none";
	document.getElementById('cantonesL').style.display = "none";
	document.getElementById('cantonesG').style.display = "none";
	document.getElementById('cantonesP').style.display = "none";
	document.getElementById("cantonObtenidoUsuario").style.display = "block";
    document.getElementById("cantonObtenidoUsuario").value = canton;
    document.getElementById('cantonElejido').value = canton;
}