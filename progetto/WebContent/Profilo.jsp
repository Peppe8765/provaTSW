  
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
String nomeUtente = (String)request.getSession().getAttribute("user");
if(nomeUtente == null){
	response.sendRedirect("./Login.html");
	return;
}
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

<link href="Home2.css" rel="stylesheet" type="text/css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="icon" href="foto/TicketS.png">
<title>Profilo</title>
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

<div class="profilo">
<h1>Profilo</h1>


	
		<div class="immagine col-3 col-s-4">
			<% if(foto != null) {%>
			<img alt="foto/foto_profilo_vuota.png" src="./MostraFotoServlet" height="150"><br>
			<%} else{ %>
			<img alt="foto/foto_profilo_vuota.png" src="foto/foto_profilo_vuota.png" height="150"><br>
			<%} %>
			<form action="ProfiloServlet" method="post" enctype="multipart/form-data">
  				<input type="file" name="foto" required><br>
  				<input class="buttoncino" type="submit" value="Cambia Foto">
</form>
			
			</div>
		
	<div class="coseProfilo col-3 col-s-3">
		<p>Nome Utente : <%=nomeUtente%></p>
		<p>Email: <%=request.getAttribute("email") %></p>
		<button class="buttoncino" type="button" onclick="location.href='./LogoutServlet'">Logout</button> <!-- il bottone è reso funzionate da un breve codice js -->
		</div>
		
		
		<div class="pannello col-3 col-s-3">
		<p> Se sei un admin verrai cliccando questo pulsante arriverai alla pagina di amministrazione propria degli Admin.<br>
		Altrimenti dovrai loggarti come Admin per accedervi.<p>
		<button class="buttoncino" id="adminPage" type="button" onclick="location.href='./AdminPage.jsp'">Pannello di controllo</button><br>
		</div>	
	
		
		
		
	</div>
	
	
		
	
	
	<div class="cronologia col-8 col-s-10">
		<h2>Cronologia biglietti acquistati</h2>
		
		<table class="table">
			<tr>
				<th>Codice Biglietto</th>
				<th>Stadio</th>
				<th>Settore</th>
				<th>Nome evento</th>
				<th>Data</th>
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
				<td><%=event.getStadioNome()%></td>
				<td><%=tbean.getSettore() %></td>
				<td><%=event.getTitolo()%></td>
				<td><%=event.getDataEvento()%></td>
				<td><%=tbean.getCosto() %></td>
			</tr>	
		
		<%} %>	
			
			
		</table>
	</div>
	<script src="NavBar.js"></script>
</body>
</html>