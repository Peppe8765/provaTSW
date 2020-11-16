<%@page import="it.progetto.model.EventoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,it.progetto.model.Cart,it.progetto.model.TicketBean"%>


<%
String nomeUtente = (String)request.getSession().getAttribute("user");
System.out.println(nomeUtente);
if(nomeUtente == null){
	response.sendRedirect("./Login.html");
	return;
}


	Cart<TicketBean> cart = (Cart<TicketBean>)request.getAttribute("carrello");
	Collection<EventoBean> eC = (Collection<EventoBean>)request.getAttribute("eC");
	
	if(cart == null){
		response.sendRedirect(response.encodeRedirectURL("./CartControl"));
		return;
	}
	
	if(eC == null){
		response.sendRedirect(response.encodeRedirectURL("./CartControl"));
		return;
	}
	
	
	double totale = (Double)request.getAttribute("totale");
	
	Collection<TicketBean> tC = cart.getItems();
	
	TicketBean tk = new TicketBean();
	EventoBean ev = new EventoBean();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="Home2.css" rel="stylesheet" type="text/css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>Carrello</title>
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


	
	

		<div class="carrello col-8 col-s-10">
		<h1>Carrello e Pagamento</h1>
		
		
		
		
		
		<a href="<%=response.encodeURL("CartControl?action=clearCart")%>">svuota carrello</a>
		
		<table class="table">
			<tr>
				<th>Codice Biglietto</th>
				<th>Settore</th>
				<th>Nome evento</th>
				<th>Data</th>
				<th>Stadio</th>
				<th>Costo</th>
			</tr>
		
		<%
		List<TicketBean> listCartItem = cart.getItems();
		
		if(listCartItem.size() > 0){
		
			Iterator<?> itTk = tC.iterator();
			Iterator<?> itEv = eC.iterator();
			
			while(itTk.hasNext()){
				tk = (TicketBean)itTk.next();
				while(itEv.hasNext()){
					EventoBean OldEvent= (EventoBean)itEv.next();
					if(tk.getEventoECodiceId() == OldEvent.geteCodiceID()){
						ev = OldEvent;
					
					}

		}
				itEv = eC.iterator();
		%>
			<tr>
				<td><%=tk.getCodiceBiglietto() %></td>
				<td><%=tk.getSettore() %></td>
				<td><%=ev.getTitolo() %></td>
				<td><%=ev.getDataEvento() %></td>
				<td><%=ev.getStadioNome() %></td>
				<td><%=tk.getCosto()%></td>
				<td><a href="<%= response.encodeURL("CartControl?action=deleteCart&id=" + tk.getCodiceBiglietto())%>">cancella</a></td>
				<td><a href="<%= response.encodeURL("CartControl?action=addCart&id=" + tk.getCodiceBiglietto())%>">aggiungi di nuovo</a></td>
			</tr>
			
			
		<%} %>
			
			<tr>
				<td colspan="5">Totale: </td>
				<td><%=totale %></td>
			</tr>
		
				
		<%} else {
		%>
		
		<tr>
			<td colspan="6">Non ci sono prodotti nel carrello</td>
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



		<div class="pagamento col-4 col-s-8">
	
	<%
	String messageP = (String)request.getAttribute("messageP");
	if(messageP != null && !messageP.equals("")) {
%>
	<p style="color: green;"><%=messageP %></p>
<%}%>
	
	
		<h2>Pagamento</h2>
		<form action="<%=response.encodeURL("CartControl")%>" method="GET" id="formCar" name="formCar" onsubmit="funzione()">
			<input type="hidden" name="action" value="payment">
			<label class="labelcar" for="Indirizzo">Indirizzo:</label><br>
			<input class="rettangoli rettangolicar" type="text" id="Indirizzo" name="Indirizzo" placeholder="Via/Viale" required><br>
			<label class="labelcar" for="Destinatario">Destinatario:</label><br>
			<input class="rettangoli rettangolicar" type="text" id="Destinatario" name="Destinatario" placeholder="Nome Cognome" required><br>
			<label class="labelcar" for="Telefono">Telefono:</label><br>
			<input class="rettangoli rettangolicar" type="text" id="Telefono" name="Telefono" placeholder="000 0000000" required><br>
			<p id="validtel"></p>
			<input class="buttoncino buttoncinocar" type="submit" value="Acquista" >
		</form>
		
	
	</div>

<script src="FormValCar2.js"></script>
<script src="NavBar.js"></script>

</body>
</html>