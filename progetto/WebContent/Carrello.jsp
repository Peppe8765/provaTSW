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
<title>Ticket S Carrello</title>
</head>
<link rel="stylesheet" href="Home2.css" >
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



	<div class="pagamento col-4 col-s-8">
	
	<%
	String messageP = (String)request.getAttribute("messageP");
	if(messageP != null && !messageP.equals("")) {
%>
	<p style="color: green;"><%=messageP %></p>
<%}%>
	
	
		<h2>Pagamento</h2>
		<form action="<%=response.encodeURL("CartControl")%>" method="GET">
			<input type="hidden" name="action" value="payment">
			<label class="labelcar" for="Indirizzo">Indirizzo:</label><br>
			<input class="rettangolicar" type="text" id="Indirizzo" name="Indirizzo" placeholder="Via/Viale" maxlength="100" required><br>
			<label class="labelcar" for="Destinatario">Destinatario:</label><br>
			<input class="rettangolicar" type="text" id="Destinatario" name="Destinatario" placeholder="Nome Cognome" maxlength="50" pattern="[A-Za-z]{3}" title="Three letter country code" required><br>
			<label class="labelcar" for="Telefono">Telefono:</label><br>
			<input class="rettangolicar" type="text" id="TelefonoCarrello" name="Telefono" placeholder="000 0000000" min="0000000000" maxlength="10" required><br>
	
			<input class="buttoncinocar" type = "submit" value = "Acquista">
		</form>
		
	
	</div>







<script>

//Navigation Bar
function myFunction() {
	  var x = document.getElementById("myNavBar1");
	  if (x.className === "NavBar1") {
	    x.className += " responsive";
	  } else {
	    x.className = "NavBar1";
	  }
	}


//When the user scrolls the page, execute myFunction
window.onscroll = function() {stickyFunction()};


var navbar = document.getElementById("myNavBar1");

var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function stickyFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}

</script>

</body>
</html>