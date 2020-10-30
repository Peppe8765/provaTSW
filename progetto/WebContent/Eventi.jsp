<%@page import="java.util.Iterator"%>
<%@page import="it.progetto.model.EventoBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>


<%
Collection<EventoBean> eCollection = (Collection<EventoBean>)request.getAttribute("events");

if(eCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./EventiServlet"));
	return;
}

EventoBean ev = new EventoBean();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket S Eventi</title>
</head>
<link rel="stylesheet" href="Eventi.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>


<ul class= "NavBar1" id= "myNavBar1">
  	<li><a class= "sinistra" href="#home">HOME</a></li>
  	<li><a class= "sinistra" href="#stadi">STADI</a></li>
  	<li><a class= "sinistra active" href="#eventi">EVENTI</a></li>
  	<li><a class= "sinistra" href="#biglietti">BIGLIETTI</a></li>
 	<li><a class= "sinistra" href="#about">ABOUT</a>
 		<a href="javascript:void(0);" class="icon" onclick="myFunction()"><b>&#9776;</b></a></li>
  	<li><a class= "destra" href="#carrello" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  	<li><a class= "destra" href="#login" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
</ul>


	<h1> Lista degli eventi </h1>
	
	
	<div>
		<table>
			<tr>
				<th>Codice Evento</th>
				<th>Titolo</th>
				<th> Data dell'evento</th>
				<th> Nome dello stadio</th>
			</tr>
		
		<%
			Iterator<?> it = eCollection.iterator();
			
			while(it.hasNext()){
				ev = (EventoBean)it.next();
		%>		
			<tr>
				<td><%=ev.geteCodiceID() %></td>
				<td><a href="<%=response.encodeURL("./EventStadioServlet?idEvent=" + ev.geteCodiceID())%>"><%=ev.getTitolo() %></a></td>		
				<td><%=ev.getDataEvento() %></td>
				<td><a href="<%=response.encodeURL("./EventStadioServlet?stadioName=" + ev.getStadioNome())%>"><%=ev.getStadioNome() %></a></td>
			</tr>
		<%} %>
		
		
		
		</table>
	
	
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