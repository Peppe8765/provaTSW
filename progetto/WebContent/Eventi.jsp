<%@page import="java.util.Iterator"%>
<%@page import="it.progetto.model.EventoBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>


<%
Collection<EventoBean> eCollection = (Collection<EventoBean>)request.getAttribute("events");

if(eCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./EventiServlet"));
	return;
}

EventoBean ev = new EventoBean();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="ProductStyle.css" rel="stylesheet" type="text/css">

<title>Eventi</title>
</head>
<body>
	<div>Navbar</div>
	
	<h1> Lista degli eventi </h1>
	
	
	<div>
		<table>
			<tr>
				<th>Codice Evento</th>
				<th>Titolo</th>
				<th> Data dell'evento</th>
				<th> Nome dello stadio</th>
			</tr>
		
		<%
			Iterator<?> it = eCollection.iterator();
			
			while(it.hasNext()){
				ev = (EventoBean)it.next();
		%>		
			<tr>
				<td><%=ev.geteCodiceID() %></td>
				<td><a href="<%=response.encodeURL("./EventStadioServlet?idEvent=" + ev.geteCodiceID())%>"><%=ev.getTitolo() %></a></td>		
				<td><%=ev.getDataEvento() %></td>
				<td><a href="<%=response.encodeURL("./EventStadioServlet?stadioName=" + ev.getStadioNome())%>"><%=ev.getStadioNome() %></a></td>
			</tr>
		<%} %>
		
		
		
		</table>
	
	
	</div>
	
	
</body>
</html>