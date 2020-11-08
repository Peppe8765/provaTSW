<%@page import="it.progetto.model.UtenteBean"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%
Boolean adminRole = (Boolean)request.getSession().getAttribute("adminRole");
System.out.println(adminRole);
if((adminRole == null) || (!adminRole.booleanValue())){
	response.sendRedirect("./Login.html");
	return;
}


%>




<%
UtenteBean admin = (UtenteBean)request.getAttribute("Admin");

if(admin == null){
	response.sendRedirect(response.encodeRedirectURL("./AdminServlet"));
	return;
}

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pannello di controllo</title>
</head>
<body>
	<div>Navbar</div>
	
	<h1>Pannello di controllo</h1>
	
	<div>
		<button type="button" onclick="">Aggiungi Stadio</button>
		<button type="button" onclick="">Rimuovi Stadio</button>
		<button type="button" onclick="">Aggiungi Evento</button>
		<button type="button" onclick="">Rimuovi Evento</button>
		<button type="button" onclick="">Aggiungi Biglietto</button>
		<button type="button" onclick="">Rimuovi Biglietto</button>
		<button type="button" onclick="">Aggiungi Admin</button>
		<button type="button" onclick="">Rimuovi Admin</button>
		<button type="button" onclick="">Rimuovi utente</button>
	</div>
	
	<div id="infoAdmin">
		<p>Nome: <%=admin.getNomeUtente() %></p>
		<p>Email: <%=admin.getEmail() %></p>
		<p>Codice Admin: <%=admin.getCodiceAdmin() %></p>
	</div>

	
	<div id="AddStadio">
	
		<form action="">
			<label for="NomeStadio">Nome:</label>
			<input type="text" id="NomeStadio" name="NomeStadio" required="required"><br>
			<label for="Nazione">Nazione:</label>
			<input type="text" id="Nazione" name="Nazione" required="required"><br>
			<label for="Città">Città:</label>
			<input type="text" id="Città" name="Città" required="required"><br>
			<label for="Indirizzo">Indirizzo:</label>
			<input type="text" id="Indirizzo" name="Indirizzo" required="required"><br>
			<label for="Capienza">Capienza:</label>
			<input type="number" id="Capienza" name="Capienza" required="required"><br>
			<label for="Descrizione">Descrizione:</label>
			<input type="text" id="Descrizione" name="Descrizione" required="required"><br>
		</form>
	
	</div>
	
	<div id="RemoveStadio">
	
	
	</div>
	
	<div id="AddEvent">
		<label for="Titolo">Titolo:</label>
		<input type="text" id="Titolo" name="Titolo" required="required"><br>
		<label for="DataEvento">Data Evento:</label>
		<input type="text" id="DataEvento" name="DataEvento" required="required"><br>
		<label for="StadioEvento">Nome dello Stadio:</label>
		<input type="text" id="StadioEvento" name="StadioEvento" required="required"><br>
		
		<div id="concerto">
			<label for="Artista">Artista / Band</label>
			<input type="text" id="Artista" name="Artista" required="required"><br>
			<label for="CodiceEventoConcerto">Codice evento</label>
			<input type="number" id="CodiceEventoConcerto" name="CodiceEventoConcerto" required="required"><br>
		</div>
		
		<div id="evntoSportivo">
			<label for="Tipo">Tipo:</label>
			<input type="text" id="Tipo" name="Tipo" required="required"><br>
			<label for="Squadra1">Squadra1:</label>
			<input type="text" id="Squadra1" name="Squadra1" required="required"><br>
			<label for="Squadra2">Squadra2:</label>
			<input type="text" id="Squadra2" name="Squadra2" required="required"><br>
			<label for="CodiceEventoSportivo">Codice evento</label>
			<input type="number" id="CodiceEventoSportivo" name="CodiceEventoSportivo" required="required"><br>
		</div>
	</div>
	
	<div id="RemoveEvent">
		
	
	</div>
	
	<div id="AddTicket">
		<label for="Settore">Settore:</label>
		<input type="text" id="Settore" name="Settore" required="required"><br>
		<label for="Costo">Costo:</label>
		<input type="number" id="Costo" name="Costo:" required="required"><br>
		<label for="Quantità">Quantità:</label>
		<input type="number" id="Quantità" name="Quantità" required="required"><br>
		<label for="CodiceEventoBiglietto">Codice evento</label>
		<input type="number" id="CodiceEventoBiglietto" name="CodiceEventoBiglietto" required="required"><br>
	
	</div>
	
	<div id="RemoveTicket">
	
	
	</div>
	
	<div id="AddAdmin">
	
	
	</div>
	
	<div id="RemoveAdmin">
	
	
	</div>
	
	<div id="RemoveUser">
	
	
	</div>
</body>
</html>