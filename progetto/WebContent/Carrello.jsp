<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,it.progetto.model.Cart,it.progetto.model.TicketBean"%>


<%

	Cart<TicketBean> cart = (Cart<TicketBean>)request.getAttribute("carrello");
	
	if(cart == null){
		response.sendRedirect(response.encodeRedirectURL("./CartControl"));
		return;
	}
	
	int codiceBiglietto;
	double costo ;
	double totale = 0;
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Carrello</title>
</head>
<body>
	<h1>Carrello e pagamento</h1>

	<div>
		<p>Qua ci va la Navbar</p>
	</div>
	
	<div>
		<h2> Carrello</h2>
		
		
		
	<%
		List<TicketBean> ticketCart = cart.getItems();
		
		if(ticketCart.size() > 0){
	%>	
		
	
		
	<% } %>
		
		
		<a href="<%=response.encodeURL("CartControl?action=clearCart")%>">svuota carrello</a>
		<table>
			<tr>
				<th>Codice Biglietto</th>
				<th>Settore</th>
				<th>Codice ID evento</th>
				<th>Costo</th>
			</tr>
		
		<%
			if(ticketCart.size() > 0){
				
				for(TicketBean tk : ticketCart){	
					
					codiceBiglietto = tk.getCodiceBiglietto();
					costo = tk.getCosto();
					totale += costo;
		%>
			<tr>
				<td><%=codiceBiglietto %></td>
				<td><%=tk.getSettore() %></td>
				<td><%=tk.getEventoECodiceId() %></td>
				<td><%=costo%></td>
				<td><a href="<%= response.encodeURL("CartControl?action=deleteCart&id=" + codiceBiglietto)%>">cancella</a></td>
				<td><a href="<%= response.encodeURL("CartControl?action=addCart&id=" + codiceBiglietto)%>">aggiungi di nuovo</a></td>
			</tr>
			
			
		<%} %>
			
			<tr>
				<td colspan="3">Totale: </td>
				<td><%=totale %></td>
			</tr>
		
				
		<%} else {
		%>
		
		<tr>
			<td colspan="5">Non ci sono prodotti nel carrello</td>
		</tr>
		<%} %>
		
		
		
		</table>
			
<%
	String message = (String)request.getAttribute("messageCart");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
<%}%>
	
	</div>



	<div>
	
	<%
	String messageP = (String)request.getAttribute("messageP");
	if(messageP != null && !messageP.equals("")) {
%>
	<p style="color: green;"><%=messageP %></p>
<%}%>
	
	
		<h2>Pagamento</h2>
		<form action="<%=response.encodeURL("CartControl")%>" method="GET">
			<input type="hidden" name="action" value="payment">
			<label for="Indirizzo">Indirizzo:</label><br>
			<input type="text" id="Indirizzo" name="Indirizzo" placeholder="Via/Viale" maxlength="100" required><br>
			<label for="Destonatario">Destonatario:</label><br>
			<input type="text" id="Destonatario" name="Destonatario" placeholder="Nome Cognome" maxlength="50" required><br>
			<label for="Telefono">Telefono:</label><br>
			<input type="text" id="Telefono" name="Telefono" placeholder="000 0000000" min="0000000000" maxlength="10" required><br>
	
			<input type = "submit" value = "Acquista">
		</form>
		
	
	</div>


</body>
</html>