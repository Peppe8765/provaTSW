<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ticket S Admin Page</title>
</head>
<link rel="stylesheet" href="AdminPage.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>


<ul class= "NavBar1" id= "myNavBar1">
  	<li><a class= "sinistra active" href="#home">HOME</a></li>
  	<li><a class= "sinistra" href="#stadi">STADI</a></li>
  	<li><a class= "sinistra" href="#biglietti">BIGLIETTI</a></li>
 	<li><a class= "sinistra" href="#about">ABOUT</a>
 		<a href="javascript:void(0);" class="icon" onclick="myFunction()"><b>&#9776;</b></a></li>
  	<li><a class= "destra" href="#carrello" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  	<li><a class= "destra" href="#login" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
</ul>
	
	<h1>Pannello di controllo</h1>
	
	<div>
		<button type="button" onclick="">Aggiungi Stadio</button>
		<button type="button" onclick="">Rimuovi Stadio</button>
		<button type="button" onclick="">Aggiungi Evento</button>
		<button type="button" onclick="">Rimuovi Evento</button>
		<button type="button" onclick="">Aggiungi Biglietto</button>
		<button type="button" onclick="">Rimuovi Biglietto</button>
		<button type="button" onclick="">Aggiungi Admin</button>
		<button type="button" onclick="">Rimuovi Admin</button>
		<button type="button" onclick="">Rimuovi utente</button>
	</div>
	
	<div id="AddStadio">
	
		<form action="">
			<label></label>
		
		
		</form>
	
	</div>
	
	<div id="RemoveStadio">
	
	
	</div>
	
	<div id="AddEvent">
	
	
	</div>
	
	<div id="RemoveEvent">
	
	
	</div>
	
	<div id="AddTicket">
	
	
	</div>
	
	<div id="RemoveTicket">
	
	
	</div>
	
	<div id="AddAdmin">
	
	
	</div>
	
	<div id="RemoveAdmin">
	
	
	</div>
	
	<div id="RemoveUser">
	
	
	</div>


<script>	
//Navigation Bar
function myFunction() {
	  var x = document.getElementById("myNavBar1");
	  if (x.className === "NavBar1") {
	    x.className += " responsive";
	  } else {
	    x.className = "NavBar1";
	  }
	}


//When the user scrolls the page, execute myFunction
window.onscroll = function() {stickyFunction()};


var navbar = document.getElementById("myNavBar1");

var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function stickyFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}

</script>
</body>
</html>