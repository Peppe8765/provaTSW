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

<link href="ProductStyle.css" rel="stylesheet" type="text/css">




<title>Profilo</title>
</head>
<body>

<h1>Profilo</h1>
	<div>Navbar</div>

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
	
		<p>Nome Utente : <%=nomeUtente%></p>
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