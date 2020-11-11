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

<link rel="stylesheet" href="Home2.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<title>Pagina dei biglietti</title>
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
	
<div class="biglietti col-10 col-s-12">
	<h1 class="titolo-biglietti">Biglietti in vendita</h1>

	<%
	String message = (String)request.getAttribute("message");
	if(message != null && !message.equals("")) {
%>
	<p class="titolo-biglietti" style="color: green;"><%=message %></p>
<%}%>

	
		<table id="biglietti">
			<tr>
				<th>Codice Biglietto</th>
				<th>Evento</th>
				<th>Stadio e Settore</th>
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
				<td>Codice biglietto: <%=tbean.getCodiceBiglietto() %></td>
				<td><%=event.getDataEvento()%></td>
				<td><%=event.getTitolo()%></td>
				<td><%=event.getStadioNome()%>
				<%=tbean.getSettore() %></td>
				<td><%=event.getDataEvento()%></td>
				<td>Biglietti rimanenti: <%=tbean.getQuantità() %></td>
				<td>Costo: <%=tbean.getCosto() %></td>
				<td><a href="<%=response.encodeURL("BigliettiServlet?action=addCart&id=" + tbean.getCodiceBiglietto()) %>"><button class="buttoncino" id="buttoncinobig" type ="button" onclick=""> Aggiungi</button></a></td>
				<td><button type ="button" onclick='$.ajax({"type": "POST","data": "param=<%=tbean.getCodiceBiglietto()%>","url": "./Provajson","success": function(risposta) { $("#ms").html(risposta);}});'> Aggiungi al carrello</button></td>
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