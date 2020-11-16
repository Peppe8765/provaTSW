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
<link rel="icon" href="foto/TicketS.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
@media screen and (max-width: 768px) {
	body {
		font-size: 10px;
	}
	.buttoncino {
		font-size: 10px;
	}
}
</style>

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
  		<li><a href="Login.html" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class="fa fa-key"></i></a></li>
  		<li><a href="Profilo.jsp" data-toggle="tooltip" data-placement="left" title="PROFILO"><i class='fas fa-user-alt'></i></a></li>
  		<li><a href="Carrello.jsp" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  		
	</ul>
	<div class="burger">
		<div class="line1"></div>
		<div class="line2"></div>
		<div class="line3"></div>
	</div>
</nav>
	
<div class="biglietti col-10 col-s-12">
	<h1 >Biglietti in vendita</h1>

<p id="ms" Style="color: green; text-align: center;"></p>

	
		<table id="biglietti">
			<tr>
				<th>Codice</th>
				<th>Evento</th>
				<th colspan="2">Stadio e Settore</th>
				<th>Data Evento</th>
				<th>Biglietti rimanenti</th>
				<th>Costo</th>
				<th>Azione</th>
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
				<td>Codice: <%=tbean.getCodiceBiglietto() %></td>
				<td><%=event.getTitolo()%></td>
				<td><%=event.getStadioNome()%></td>
				<td><%=tbean.getSettore() %></td>
				<td><%=event.getDataEvento()%></td>
				<td>Biglietti rimanenti: <%=tbean.getQuantità() %></td>
				<td>Costo: <%=tbean.getCosto() %></td>
				<td><button class="buttoncino" type ="button" onclick='$.ajax({"type": "POST","data": "param=<%=tbean.getCodiceBiglietto()%>","url": "./Provajson","success": function(risposta) { $("#ms").html(risposta);}});'>Aggiungi</button></td>
			</tr>	
	<%} %>		

		</table>
	

	</div>
<script src="NavBar.js"></script>


</body>
</html>