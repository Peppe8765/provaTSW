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

<link href="ProductStyle.css" rel="stylesheet" type="text/css">

<title><%=eventoS.getTitolo() %></title>
</head>
<body>

	<div>Navbar</div>
	
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