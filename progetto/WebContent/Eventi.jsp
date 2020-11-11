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

<link rel="stylesheet" href="Home2.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Eventi</title>
</head>
<body>
	
<nav>
	<div class="logo">
		<a href="HomePageView.html">Ticket S</a>
	</div>

	<ul class= "navBar" id= "myNavBar1">
  		<li><a href="Stadi.jsp">STADI</a></li>
  		<li><a href="Eventi.jsp">EVENTI</a></li>
  		<li><a href="Biglietti.jsp">BIGLIETTI</a></li>
  		<li><a href="Login.html" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
  		<li><a href="Carrello.jsp" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  		
	</ul>
	<div class="burger">
		<div class="line1"></div>
		<div class="line2"></div>
		<div class="line3"></div>
	</div>
</nav>


	
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
				<td><a href="<%=response.encodeURL("./EventoServlet?idEvent=" + ev.geteCodiceID())%>"><%=ev.getTitolo() %></a></td>		
				<td><%=ev.getDataEvento() %></td>
				<td><a href="<%=response.encodeURL("./EventStadioServlet?stadioName=" + ev.getStadioNome())%>"><%=ev.getStadioNome() %></a></td>
			</tr>
		<%} %>
		
		
		
		</table>
	
	
	</div>
	
	
	
	
<script src="NavBar.js"></script>
<script>
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

</script>
	
	
</body>
</html>