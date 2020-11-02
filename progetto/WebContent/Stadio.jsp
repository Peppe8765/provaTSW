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

<link href="ProductStyle.css" rel="stylesheet" type="text/css">

<title><%=stadioName %></title>
</head>
<body>
	<div>Navbar</div>
	
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

</body>
</html>