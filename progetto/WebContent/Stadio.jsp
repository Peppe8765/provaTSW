<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="it.progetto.model.EventoBean"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>

<%
Collection<EventoBean> eventCollection = (Collection<EventoBean>)request.getAttribute("eventStadio");
String stadioName = (String)request.getParameter("stadioName");

if(eventCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./EventStadioServlet?stadioName="+stadioName));
	return;
}

EventoBean event = new EventoBean();

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="ProductStyle.css" rel="stylesheet" type="text/css">

<title>Insert title here</title>
</head>
<body>
	<div>Navbar</div>
	
	<h1>Lista eventi dello stadio</h1>	
	
	<div>
		<table>
			<tr>
				<th>Codice Evento</th>
				<th>Titolo</th>
				<th> Data dell'evento</th>
				<th> Nome dello stadio</th>
			</tr>
		
<%
	Iterator<?> it = eventCollection.iterator();

	while(it.hasNext()){
		event = (EventoBean)it.next();
	
%>		
	<tr>
				<td><%=event.geteCodiceID() %></td>
				<td><a href="<%=response.encodeURL("EventoStadioServlet?idEvent=" + event.geteCodiceID())%>"><%=event.getTitolo() %></a></td>		
				<td><%=event.getDataEvento() %></td>
				<td><a href="<%=response.encodeURL("StadioServlet?stadioName=" + event.getStadioNome())%>"><%=event.getStadioNome() %></a></td>
			</tr>	
		
<%} %>		
		
		</table>
	
	
	
	
	</div>

</body>
</html>