imgAnterior= null;

function onFileSelected(event) {
                var selectedFile = event.target.files[0];
                var reader = new FileReader();

                var imgtag = document.getElementById("myImage");
		
                imgtag.title = selectedFile.name;

                reader.onload = function(event) {
                  imgtag.src = event.target.result;
                };

                reader.readAsDataURL(selectedFile);
                convert();
              }
	 function prepHref(linkElement) {
	    var myDiv = document.getElementById('re-dimensionada');
	    var myImage = myDiv.children[0];
	    document.body.appendChild(myImage);
	    linkElement.href = myImage.src;
	}
	function convert() {
		var canvas = document.createElement("canvas");
		var ctx = canvas.getContext("2d");

		canvas.width = 200; // target width
		canvas.height = 200; // target height

		var image = document.getElementById("myImage");
		document.getElementById("original").appendChild(image);

		image.onload = function(e) {
		    ctx.drawImage(image, 
			0, 0, image.width, image.height, 
			0, 0, canvas.width, canvas.height
		    );
		    // create a new base64 encoding
		    var resampledImage = new Image();
		    resampledImage.src = canvas.toDataURL();
            
            if(!imgAnterior){
                document.getElementById("re-dimensionada").appendChild(resampledImage);
                imgAnterior=resampledImage;
            }
            else{
                document.getElementById("re-dimensionada").removeChild(imgAnterior);
                document.getElementById("re-dimensionada").appendChild(resampledImage);
                imgAnterior=resampledImage;
                
            }
		    
		};
		
        }