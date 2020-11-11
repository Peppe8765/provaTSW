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
	
	

<ul class= "navBar" id= "myNavBar1">
  	<li><a class= "sinistra active" href="#home">HOME</a></li>
  	<li><a class= "sinistra" href="#stadi">STADI</a></li>
  	<li><a class= "sinistra" href="#biglietti">BIGLIETTI</a></li>
 	<li><a class= "sinistra" href="#about">ABOUT</a>
 		<a href="javascript:void(0);" class="icon" onclick="myFunction()"><b>&#9776;</b></a></li>
  	<li><a class= "destra" href="#carrello" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  	<li><a class= "destra" href="#login" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
</ul>
	
	
	
	<h1>Biglietti in vendita</h1>

	<%
	String message = (String)request.getAttribute("message");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
<%}%>

	<div>
		<table>
			<tr>
				<th>Codice Biglietto</th>
				<th>Settore</th>
				<th>Quantità</th>
				<th>Codice ID evento</th>
				<th>Nome evento</th>
				<th>Data</th>
				<th>Stadio</th>
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
				<td><%=tbean.getSettore() %></td>
				<td><%=tbean.getQuantità() %></td>
				<td><%=tbean.getEventoECodiceId() %></td>
				<td><%=event.getTitolo()%></td>
				<td><%=event.getDataEvento()%></td>
				<td><%=event.getStadioNome()%></td>
				<td><%=tbean.getCosto() %></td>
				<td><a href="<%=response.encodeURL("BigliettiServlet?action=addCart&id=" + tbean.getCodiceBiglietto()) %>">Aggiungi al carrello</a></td>
				<td><button type ="button" onclick=""> Aggiungi</button></td>
			</tr>	
	<%} %>		

		</table>
	

	</div>

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