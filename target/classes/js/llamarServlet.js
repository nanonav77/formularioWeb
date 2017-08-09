var asyncRequest;    
function start(){
    try
    {
        asyncRequest = new XMLHttpRequest();
        asyncRequest.addEventListener("readystatechange", stateChange, false);
        asyncRequest.open('GET', '/formularioVIVO/Test', true);    //   /Test is url to Servlet!
        asyncRequest.send(null);
    }
    catch(exception)
   {
    alert("Request failed");
   }
}

function stateChange(){
if(asyncRequest.readyState == 4 && asyncRequest.status == 200)
    {
	console.log("listo");
    var text = document.getElementById("text");         //  text is an id of a 
    text.innerHTML = asyncRequest.responseText;         //  div in HTML document
    }
}



window.addEventListener("load", start(), false);