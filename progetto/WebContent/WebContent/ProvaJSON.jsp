<%@page import="it.progetto.model.TicketBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
TicketBean tk = new TicketBean();
tk.setCodiceBiglietto(1);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#button').click(function() {
		$.ajax({
			"type": "POST",
			"data": "param=<%= tk.getCodiceBiglietto()%>",
			"url": "./Provajson",
			"success": function(risposta) {
				$("#poo").html(risposta);
			}
		});
	});
});
</script>

<title>Prova json</title>



</head>
<body>
	
	<button type="button" id="button">cose</button>
	
	
	<p id = "poo"></p>
</body>
</html>