<%@page import="it.progetto.model.StadioBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="it.progetto.model.EventoBean"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>

<%
Collection<EventoBean> eventCollection = (Collection<EventoBean>)request.getAttribute("eventStadio");
String stadioName = (String)request.getParameter("stadioName");

StadioBean stadio = (StadioBean)request.getAttribute("stadioS");


if(stadio == null && eventCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./EventStadioServlet"));
	return;
}

EventoBean event = new EventoBean();

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="Home2.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><%=stadioName %></title>
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
  		<li><a href="Login.html" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
  		<li><a href="Carrello.jsp" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  		
	</ul>
	<div class="burger">
		<div class="line1"></div>
		<div class="line2"></div>
		<div class="line3"></div>
	</div>
</nav>
	
	
	
	<h1><%=stadioName %></h1>	
	
<img alt="<%=stadio.getNome() %>" src="foto/<%=stadio.getNome() + ".jpg"%>" height="200">	
	
	
	
	<p><%=stadio.getDescrizione() %></p>
	
	<div>
		<h2>Lista eventi</h2>
	
		<table>
			<tr>
				<th>Codice Evento</th>
				<th>Titolo</th>
				<th> Data dell'evento</th>
			</tr>
		
<%
	Iterator<?> it = eventCollection.iterator();

	while(it.hasNext()){
		event = (EventoBean)it.next();
		String id = "" + event.geteCodiceID();
%>		
	<tr>
				<td><%=id%></td>
				<%System.out.println(""+id); %>
				<td><a href="<%=response.encodeURL("./EventoServlet?idEvent=" + id)%>"><%=event.getTitolo() %></a></td>		
				<td><%=event.getDataEvento() %></td>
			</tr>	
		
<%} %>		
		
		</table>

	
	
	
	</div>

<script src="NavBar.js"></script>


</body>
</html>