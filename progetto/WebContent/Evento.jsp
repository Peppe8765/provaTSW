<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.nio.charset.CodingErrorAction"%>
<%@page import="java.util.Iterator"%>
<%@page import="it.progetto.model.TicketBean"%>
<%@page import="java.util.Collection"%>
<%@page import="it.progetto.model.EventoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Collection<TicketBean> ticketEventoC = (Collection<TicketBean>)request.getAttribute("ticketEventoC");
EventoBean eventoS = (EventoBean)request.getAttribute("eventoS");
String idEvent = request.getParameter("idEvent");




if(eventoS == null && ticketEventoC == null) {
	response.sendRedirect(response.encodeRedirectURL("./EventoServlet?IdEvent=" + idEvent));
	return;
}


TicketBean tk = new TicketBean();
tk.setCodiceBiglietto(1);
ArrayList<Integer> ids = new ArrayList<Integer>(); 
%> 
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="ProductStyle.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>





<title><%=eventoS.getTitolo() %></title>
</head>
<body>

	<div>Navbar</div>
	
	<h1><%=eventoS.getTitolo() %></h1>
	

	

	<p id="message" style="color: green;"></p>

	
	
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
	int codiceBiglietto;
	while(it.hasNext()){
		tk = (TicketBean)it.next();
		codiceBiglietto = tk.getCodiceBiglietto();
		
		ids.add(codiceBiglietto);
		
%>	

		<tr>
			<td><%=codiceBiglietto%></td>
			<td><%=tk.getSettore() %></td>
			<td><%=tk.getQuantità() %></td>
			<td><%=tk.getEventoECodiceId() %></td>
			<td><%=eventoS.getTitolo() %></td>
			<td><%=eventoS.getDataEvento() %></td>
			<td><%=eventoS.getStadioNome() %></td>
			<td><%=tk.getCosto() %></td>
			<td><button id="button" onclick='$.ajax({"type": "POST","data": "param=<%=tk.getCodiceBiglietto()%>","url": "./Provajson","success": function(risposta) { $("#message").html(risposta);}});'>Aggiungi al carrello</button></td>
			
		</tr>
		
<%} %>

	</table>
	<script type="text/javascript">
		var ids = [<%= ids%>]
		console.log(ids);
	</script>
	</div>
	
	<script>
		function myFunction() {
			$.ajax({
				"type": "POST",
				"data": "param=<%=tk.getCodiceBiglietto()%>",
				"url": "./Provajson",
				"success": function (risposta) {
					$("#message").html(data);
				}
			});
		}
		'function myFunction() {$.ajax({"type": "POST","data":"param=<%=tk.getCodiceBiglietto()%>","url": "./Provajson","success": function (risposta) {$("#message").html(data);}});}'
	</script>
	
</body>

</html>