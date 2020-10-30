<%@page import="it.progetto.model.EventoBean"%>
<%@page import="it.progetto.model.EventoModelDM"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Collection"%>
<%@page import="it.progetto.model.TicketBean"%>
<%@page import="it.progetto.model.TicketModelDM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
Collection<TicketBean> tCollection = (Collection<TicketBean>)request.getAttribute("tickets");
Collection<EventoBean> ev = (Collection<EventoBean>)request.getAttribute("events");

if(tCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./BigliettiServlet"));
	return;
}

if(ev == null){
	response.sendRedirect(response.encodeRedirectURL("./BigliettiServlet"));
	return;
}

TicketBean tbean = new TicketBean();
EventoBean event = new EventoBean();


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket S Biglietti</title>
</head>
<link rel="stylesheet" href="Biglietti.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
	
	

<ul class= "NavBar1" id= "myNavBar1">
  	<li><a class= "sinistra" href="#home">HOME</a></li>
  	<li><a class= "sinistra" href="#stadi">STADI</a></li>
  	<li><a class= "sinistra" href="#eventi">EVENTI</a></li>
  	<li><a class= "sinistra active" href="#biglietti">BIGLIETTI</a></li>
 	<li><a class= "sinistra" href="#about">ABOUT</a>
 		<a href="javascript:void(0);" class="icon" onclick="myFunction()"><b>&#9776;</b></a></li>
  	<li><a class= "destra" href="#carrello" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  	<li><a class= "destra" href="#login" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
</ul>
	
	
<div class="biglietti col-10 col-s-12">
	<h1>Biglietti in vendita</h1>

	<%
	String message = (String)request.getAttribute("message");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
<%}%>

	
		<table>
			<tr>
				<th>Codice Biglietto</th>
				<th>Evento</th>
				<th>Stadio</th>
				<th>Settore</th>
				<th>Data</th>
				<th>Biglietti rimanenti</th>
				<th>Costo</th>
			</tr>
		
	<%
		Iterator<?> it = tCollection.iterator();
		Iterator<?>	itEv = ev.iterator();
	
		int prevCod = 0;
		while(it.hasNext()){
			tbean = (TicketBean)it.next();
				while(itEv.hasNext()){
					EventoBean OldEvent= (EventoBean)itEv.next();
					if(tbean.getEventoECodiceId() == OldEvent.geteCodiceID()){
						event = OldEvent;
						System.out.println(event);
					}

		}
				itEv = ev.iterator();
	%>				
			<tr>
				<td><%=tbean.getCodiceBiglietto() %></td>
				<td><%=event.getTitolo()%></td>
				<td><%=event.getStadioNome()%>
				<%=tbean.getSettore() %></td>
				<td><%=event.getDataEvento()%></td>
				<td><%=tbean.getQuantità() %></td>
				<td><%=tbean.getCosto() %></td>
				<td><a href="<%=response.encodeURL("BigliettiServlet?action=addCart&id=" + tbean.getCodiceBiglietto()) %>"><button class="buttoncino" type ="button" onclick=""> Aggiungi</button></a></td>
				
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