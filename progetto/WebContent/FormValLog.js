function alert(){
	/*var ind= formcar.Indirizzo.value;
	var dest= formcar.Destinatario.value;
	var tel= formcar.Telefono.value;*/
	var email= formlog.email.value;
	var uname= formlog.uname.value;
	var pass= formlog.pass.value;
	var codAdm= formlog.codiceAdmin.value;
	
	/*if(ind.length == 0){
		alert("Inserire un indirizzo");
		return false;
	}
	if(dest.length == 0){
		alert("Inserire un destinatario");
		return false;
	}
	if(tel.length == 0){
		alert("Inserire un numero di telefono");
		return false;
	}*/
	if(email.length == 0){
		alert("Inserire un indirizzo email");
		return false;
	}
	if(uname.length == 0){
		alert("Inserire un nome utente");
		return false;
	}
	if(pass.length == 0){
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
	var txt = "";
	if (document.getElementById("uname").validity.patternMismatch) {
		txt = "Inserire 8 o più caratteri";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
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
	if (document.getElementById("pass").validity.patternMismatch) {
		txt = "Inserire 8 o più caratteri con almeno 1 carattere maiuscolo, 1 carattere minuscolo e 1 numero";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
}
function formPassLog() {
	var txt = "";
	if (document.getElementById("pass").validity.patternMismatch) {
		txt = "Inserire 8 o più caratteri con almeno 1 carattere maiuscolo, 1 carattere minuscolo e 1 numero";
	} else {
		txt = "OK";
	} 
	document.getElementByIdName("demo").innerHTML = txt;
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






//Navigation Bar
function myFunction() {
	  var x = document.getElementById("myNavBar1");
	  if (x.className === "navBar") {
	    x.className += " responsive";
	  } else {
	    x.className = "navBar";
	  }
	}


//When the user scrolls the page, execute myFunction
window.onscroll = function() {stickyFunction()};


var navBar = document.getElementById("myNavBar1");

var sticky = navBar.offsetTop;

// Add the sticky class to the navBar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function stickyFunction() {
  if (window.pageYOffset >= sticky) {
    navBar.classList.add("sticky")
  } else {
    navBar.classList.remove("sticky");
  }
}