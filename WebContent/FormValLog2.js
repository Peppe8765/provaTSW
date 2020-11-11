function formValLog() {
	var email = document.getElementById("email").value;
	var uname = document.getElementById("uname").value;
	var pass = document.getElementById("pass").value;
	var pass2 = document.getElementById("pass2").value;
	submitOK = "true";
	
	if (!email.checkValidity) {
	    alert("L'email deve essere scitta cosi");
	    submitOK = "false";
	  }
	if (!uname.checkValidity) {
	    alert("L username deve essere scitta cosi");
	    submitOK = "false";
	  }
	if (!pass.checkValidity) {
	    alert("La password deve essere scitta cosi");
	    submitOK = "false";
	  }
	if (!pass2.checkValidity) {
	    alert("La password 221 deve essere scitta cosi");
	    submitOK = "false";
	  }
	if (submitOK == "false") {
	    return false;
	    submitOK = "true";
	  }
	
}