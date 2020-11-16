function alertReg(){
	var email= formReg.email.value;
	var unameR= formReg.uname.value;
	var unameL= formLog.uname.value;
	var unameLA= formLogA.uname.value;
	var passR= formReg.pass.value;
	var pass2R= formReg.pass2.value;
	var passL= formLog.pass.value;
	var passLA= formLogA.pass.value;
	var codAdm= formLogA.codiceAdmin.value;
	
	if(email.length == 0){
		alert("Inserire un indirizzo email");
		return false;
	}
	if(unameR.length == 0){
		alert("Inserire un nome utente");
		return false;
	}
	if(unameL.length == 0){
		alert("Inserire un nome utente");
		return false;
	}
	if(unameLA.length == 0){
		alert("Inserire un nome utente");
		return false;
	}
	if(passR.length == 0){
		alert("Inserire una password");
		return false;
	}
	if(pass2R.length == 0){
		alert("Inserire una password");
		return false;
	}
	if(passL.length == 0){
		alert("Inserire una password");
		return false;
	}
	if(passLA.length == 0){
		alert("Inserire una password");
		return false;
	}
	if(codAdm.length == 0){
		alert("Inserire il codice Admin");
		return false;
	}
}














function formEmailReg() {
	var txt = "";
	if (document.getElementById("email").validity.patternMismatch) {
		txt = "Inserire un email del tipo Mariorossi10@gmail.com";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
	}
function formUnameReg() {
	var txt = "";
	if (document.getElementById("uname").validity.patternMismatch) {
		txt = "Inserire 8 o più caratteri";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
}
function formUnameLog() {
	if (document.getElementByClassName("unameLog").value.length < 5) {
		alert("Inserire 5 o più caratteri");
	}
}
function formUnameLogA() {
	var txt = "";
	if (document.getElementById("uname").validity.patternMismatch) {
		txt = "Inserire 8 o più caratteri";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
}
function formPassReg() {
	var txt = "";
	if (document.getElementById("pass").validity.patternMismatch) {
		txt = "Inserire 8 o più caratteri con almeno 1 carattere maiuscolo, 1 carattere minuscolo e 1 numero";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
}
function formRPassReg() {
	var txt = "";
	if (document.getElementById("pass").value.length < 8) {
		txt = "Inserire 8 o più caratteri con almeno 1 carattere maiuscolo, 1 carattere minuscolo e 1 numero";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
}
function formPassLog() {
	if (document.getElementByClassName("passLog").value.length < 8) {
		alert("Inserire 8 o più caratteri con almeno 1 carattere maiuscolo, 1 carattere minuscolo e 1 numero");
	}
}
function formPassLogA() {
	var txt = "";
	if (document.getElementById("pass").validity.patternMismatch) {
		txt = "Inserire 8 o più caratteri con almeno 1 carattere maiuscolo, 1 carattere minuscolo e 1 numero";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
}

function formTel() {
	var txt = "";
	if (document.getElementById("Telefono").validity.patternMismatch) {
		txt = "Inserire 10 o più cifre numeriche";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
}



