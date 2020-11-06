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

<link href="ProductStyle.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<title>Pagina dei biglietti</title>
</head>
<body>
	<div>Qui ci va la navbar</div>

	<h1>Biglitti in vendita</h1>

	<%
	String message = (String)request.getAttribute("message");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
	
<%}%>
	<p id="ms" style="color: green;"></p>
	
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
				<td><button type ="button" onclick='$.ajax({"type": "POST","data": "param=<%=tbean.getCodiceBiglietto()%>","url": "./Provajson","success": function(risposta) { $("#ms").html(risposta);}});'> Aggiungi al carrello</button></td>
			</tr>	
	<%} %>		

		</table>
	

	</div>



</body>
</html>