<%@page import="it.progetto.model.EventoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,it.progetto.model.Cart,it.progetto.model.TicketBean"%>


<%

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
<title>Ticket S Carrello</title>
</head>
<link rel="stylesheet" href="Home2.css" >
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


	<div class="carrello col-8 col-s-10">
		<h2> Carrello</h2>
		
		
		
	<%
		List<TicketBean> ticketCart = cart.getItems();
		
		if(ticketCart.size() > 0){
	%>	
		
	
		
	<% } %>
		
		<a href="<%=response.encodeURL("CartControl?action=clearCart")%>">svuota carrello</a>
		
		
		<table id="carrellotable">
			<tr>
				<th>Codice Biglietto</th>
				<th>Settore</th>
				<th>Codice ID evento</th>
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
		<form action="<%=response.encodeURL("CartControl")%>" method="GET" onsubmit="return alert()" name="formCar">
			<input type="hidden" name="action" value="payment">
			<label class="label" for="Indirizzo">Indirizzo:</label><br>
			<input class="rettangoli" type="text" id="indCar" name="Indirizzo" placeholder="Via/Viale"><br>
			<label class="label" for="Destinatario">Destinatario:</label><br>
			<input class="rettangoli" type="text" id="destCar" name="Destinatario" placeholder="Nome Cognome"><br>
			<label class="label" for="Telefono">Telefono:</label><br>
			<input class="rettangoli" type="text" id="telCar" name="Telefono" placeholder="000 0000000" pattern=".{10,}" ><br>
			<p id="validTel"></p>
	
			<input class="buttoncino" type = "submit" value = "Acquista">
		</form>
		
	
	</div>






<script src="FormValCar.js"></script>
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