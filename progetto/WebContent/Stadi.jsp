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
<title>Ticket S Stadi</title>
</head>
<link rel="stylesheet" href="Home2.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	
	
	<ul class= "NavBar1" id= "myNavBar1">
  	<li><a class= "sinistra" href="#home">HOME</a></li>
  	<li><a class= "sinistra active" href="#stadi">STADI</a></li>
  	<li><a class= "sinistra" href="#eventi">EVENTI</a></li>
  	<li><a class= "sinistra" href="#biglietti">BIGLIETTI</a></li>
 	<li><a class= "sinistra" href="#about">ABOUT</a>
 		<a href="javascript:void(0);" class="icon" onclick="myFunction()"><b>&#9776;</b></a></li>
  	<li><a class= "destra" href="#carrello" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  	<li><a class= "destra" href="#login" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
</ul>


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
				<td><a href="<%=response.encodeURL("./EventStadioServlet?stadioName=" + stadio.getNome())%>"><%= stadio.getNome()%></a></td>
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