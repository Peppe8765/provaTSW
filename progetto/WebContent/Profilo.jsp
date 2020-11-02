<%@page import="com.mysql.cj.jdbc.Blob"%>
<%@page import="it.progetto.model.UtenteBean"%>
<%@ page import="it.progetto.model.EventoBean" %>
<%@page import="it.progetto.model.EventoModelDM"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Collection"%>
<%@page import="it.progetto.model.TicketBean"%>
<%@page import="it.progetto.model.TicketModelDM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Collection<TicketBean> tCollection = (Collection<TicketBean>)request.getAttribute("ticketsComponent");
Collection<EventoBean> eCollection = (Collection<EventoBean>)request.getAttribute("eventsComponent");
UtenteBean user = (UtenteBean)request.getAttribute("utente");

if(tCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./ProfiloServlet"));
	return;
}

if(eCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./ProfiloServlet"));
	return;
}

if(user == null){
	response.sendRedirect(response.encodeRedirectURL("./ProfiloServlet"));
	return;
}



TicketBean tbean = new TicketBean();
EventoBean event = new EventoBean();

Blob foto = (Blob)user.getFotoProfilo();

%>    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket S Profilo</title>
</head>
<link rel="stylesheet" href="Home2.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>




<!-- Navigation Bar -->

<ul class= "NavBar1" id= "myNavBar1">
  	<li><a class= "sinistra" href="#home">HOME</a></li>
  	<li><a class= "sinistra" href="#stadi">STADI</a></li>
  	<li><a class= "sinistra" href="#eventi">EVENTI</a></li>
  	<li><a class= "sinistra" href="#biglietti">BIGLIETTI</a></li>
 	<li><a class= "sinistra" href="#about">ABOUT</a>
 		<a href="javascript:void(0);" class="icon" onclick="myFunction()"><b>&#9776;</b></a></li>
  	<li><a class= "destra" href="#carrello" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  	<li><a class= "destra active" href="#login"  data-placement="left"><i class='fas fa-user-alt'></i></a></li>
</ul>

	<div>
		<div>
			<% if(foto != null) {%>
			<img alt="foto/foto_profilo_vuota.png" src="./MostraFotoServlet" height="150"><br>
			<%} else{ %>
			<img alt="foto/foto_profilo_vuota.png" src="foto/foto_profilo_vuota.png" height="150"><br>
			<%} %>
			<form action="ProfiloServlet" method="post" enctype="multipart/form-data">
  				<input type="file" name="foto" required><br>
  				<input type="submit" value="Cambia Foto">
</form>
			
			
		</div>
	
		<p>Nome Utente : <%=request.getAttribute("nomeUtente") %></p>
		<p>Email: <%=request.getAttribute("email") %></p>
		
		<button id="adminPage" type="button" onclick="location.href='./AdminPage.jsp'">Pannello di controllo</button><br><br>	
	
		
		<button type="button" onclick="location.href='./LogoutServlet'">Logout</button> <!-- il bottone è reso funzionate da un breve codice js -->
	</div>
	
	
		
	
	
	<div>
		<h2>Cronologia bigietti acquistati</h2>
		
		<table>
			<tr>
				<th>Codice Biglietto</th>
				<th>Settore</th>
				<th>Codice ID evento</th>
				<th>Nome evento</th>
				<th>Data</th>
				<th>Stadio</th>
				<th>Costo</th>
			</tr>
			
		<% 
			Iterator<?> it = tCollection.iterator();
			Iterator<?> it2 = eCollection.iterator();
			
			while(it.hasNext() && it2.hasNext()){
				tbean = (TicketBean)it.next();
				event = (EventoBean)it2.next();
		
		%>	
					
			<tr>
				<td><%=tbean.getCodiceBiglietto() %></td>
				<td><%=tbean.getSettore() %></td>
				<td><%=tbean.getEventoECodiceId() %></td>
				<td><%=event.getTitolo()%></td>
				<td><%=event.getDataEvento()%></td>
				<td><%=event.getStadioNome()%></td>
				<td><%=tbean.getCosto() %></td>
			</tr>	
		
		<%} %>	
			
			
		</table>
	</div>
</body>
</html>