<%@page import="java.util.Iterator"%>
<%@page import="it.progetto.model.TicketBean"%>
<%@page import="java.util.Collection"%>
<%@page import="it.progetto.model.EventoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Collection<TicketBean> ticketEventoC = (Collection<TicketBean>)request.getAttribute("ticketEventoC");
EventoBean eventoS = (EventoBean)request.getAttribute("eventoS");
String eventoId = request.getParameter("idEvent");



if(eventoS == null && ticketEventoC == null) {
	response.sendRedirect(response.encodeRedirectURL("./EventoServlet?IdEvent=" + eventoId));
	return;
}


TicketBean tk = new TicketBean();

%> 
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=eventoS.getTitolo() %></title>
</head>
<link rel="stylesheet" href="Evento.css" >
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

	
	
	<h1><%=eventoS.getTitolo() %></h1>
	
	
	
		<%
	String message = (String)request.getAttribute("messageEv");
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
	Iterator<?> it = ticketEventoC.iterator();

	while(it.hasNext()){
		tk = (TicketBean)it.next();

%>	
		<tr>
			<td><%=tk.getCodiceBiglietto() %></td>
			<td><%=tk.getSettore() %></td>
			<td><%=tk.getQuantità() %></td>
			<td><%=tk.getEventoECodiceId() %></td>
			<td><%=eventoS.getTitolo() %></td>
			<td><%=eventoS.getDataEvento() %></td>
			<td><%=eventoS.getStadioNome() %></td>
			<td><%=tk.getCosto() %></td>
			<td><a href="<%=response.encodeURL("EventoServlet?action=addCart&id=" + tk.getCodiceBiglietto())%>">Aggiungi al carrello</a></td>
		</tr>
<%} %>

	</table>
	</div>
</body>
</html>