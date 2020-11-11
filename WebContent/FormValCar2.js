function funzione() {
  var tel = document.getElementById("Telefono").value;
  submitOK = "true";

  if (tel.length < 10) {
    alert("must be at least 10 charc");
    submitOK = "false";
  }
  if (submitOK == "false") {
	document.getElementById("formCar").addEventListener("submit", function(e){
		e.preventDefault();
	});  
    return false;
  }
}

