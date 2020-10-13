<%@page import="java.util.Iterator"%>
<%@page import="it.progetto.model.StadioBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Collection<StadioBean> sCollection = (Collection<StadioBean>)request.getAttribute("stadii");

if(sCollection == null){
	response.sendRedirect(response.encodeRedirectURL("./StadiServlet"));
	return;
}

StadioBean stadio = new StadioBean();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="ProductStyle.css" rel="stylesheet" type="text/css">

<title>Stadi</title>
</head>
<body>
	
	<div>Lista degli stadi</div>
	
	<div>
		<table>
			<tr>
				<th>Nome</th>
				<th>Nazione</th>
				<th>Città</th>
				<th>Indirizzo</th>
				<th>Capienza</th>
				<th>Descrizione</th>
			</tr>
		
		<%
			Iterator<?> it = sCollection.iterator();
			
			while(it.hasNext()){
				stadio = (StadioBean)it.next();
		%>		
			<tr>
				<td><a href="<%=response.encodeURL("StadioServlet?nameStadio=" + stadio.getNome())%>"><%= stadio.getNome()%></a></td>
				<td><%= stadio.getNazione() %></td>
				<td><%= stadio.getCittà() %></td>
				<td><%= stadio.getIndirizzo() %></td>
				<td><%= stadio.getCapienza() %></td>
				<td><%= stadio.getDescrizione()%></td>
			</tr>
		<%} %>
		
		
		
		</table>
	
	
	</div>
	
	
</body>
</html>