function alert(){
	var ind= formCar.Indirizzo.value;
	var dest= formCar.Destinatario.value;
	var tel= formCar.Telefono.value;
	
	if(ind.length == 0 || ind == null){
		alert("Inserire un indirizzo");
	return false;
	}
	if(dest.length == 0 || dest == null){
		alert("Inserire un destinatario");
	return false;
	}
	if(tel.length == 0 || tel == null){
		alert("Inserire un numero di telefono");
	return false;
	}
}
	function formTel() {
		var txt = "";
		if (document.getElementById("Telefono").validity.patternMismatch) {
			txt = "Inserire 10 o più cifre numeriche";
		} else {
			txt = "OK";
		} 
		document.getElementById("validTel").innerHTML = txt;
	}

