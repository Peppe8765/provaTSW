<%@page import="it.progetto.model.UtenteBean"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="Home2.css" >
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'infoAdmin')" type="button" id="defaultOpen">Profilo</button>
		<button class="tablinks" onclick="openCity(event, 'AddStadio')" type="button">Aggiungi Stadio</button>
		<button class="tablinks" onclick="openCity(event, 'RemoveStadio')" type="button">Rimuovi Stadio</button>
		<button class="tablinks" onclick="openCity(event, 'AddEvent')" type="button">Aggiungi Evento</button>
		<button class="tablinks" onclick="openCity(event, 'RemoveEvent')" type="button">Rimuovi Evento</button>
		<button class="tablinks" onclick="openCity(event, 'AddTicket')" type="button">Aggiungi Biglietto</button>
		<button class="tablinks" onclick="openCity(event, 'RemoveTicket')" type="button">Rimuovi Biglietto</button>
		<button class="tablinks" onclick="openCity(event, 'AddAdmin')" type="button">Aggiungi Admin</button>
		<button class="tablinks" onclick="openCity(event, 'RemoveAdmin')" type="button">Rimuovi Admin</button>
		<button class="tablinks" onclick="openCity(event, 'RemoveUser')" type="button">Rimuovi utente</button>
	</div>
	
	<div id="infoAdmin" class="tabcontent">
		<p>Nome: <%=admin.getNomeUtente() %></p>
		<p>Email: <%=admin.getEmail() %></p>
		<p>Codice Admin: <%=admin.getCodiceAdmin() %></p>
	</div>

	
	<div id="AddStadio" class="tabcontent">
		<form action="">
			<p>Aggiungere uno stadio</p>
			<label for="NomeStadio">Nome</label><br>
			<input type="text" id="NomeStadio" name="NomeStadio" required="required"><br>
			<label for="Nazione">Nazione</label><br>
			<input type="text" id="Nazione" name="Nazione" required="required"><br>
			<label for="Città">Città</label><br>
			<input type="text" id="Città" name="Città" required="required"><br>
			<label for="Indirizzo">Indirizzo</label><br>
			<input type="text" id="Indirizzo" name="Indirizzo" required="required"><br>
			<label for="Capienza">Capienza</label><br>
			<input type="number" id="Capienza" name="Capienza" required="required"><br>
			<label for="Descrizione">Descrizione</label><br>
			<input type="text" id="Descrizione" name="Descrizione" required="required"><br>
		</form>
	
	</div>
	
	<div id="RemoveStadio" class="tabcontent">
		<p>Rimuovere uno stadio</p>
	
	
	</div>
	
	<div id="AddEvent" class="tabcontent">
		<p>Aggiungere un evento</p>
		<label for="Titolo">Titolo</label><br>
		<input type="text" id="Titolo" name="Titolo" required="required"><br>
		<label for="DataEvento">Data Evento</label><br>
		<input type="text" id="DataEvento" name="DataEvento" required="required"><br>
		<label for="StadioEvento">Nome dello Stadio</label><br>
		<input type="text" id="StadioEvento" name="StadioEvento" required="required"><br>
		<p>Selezionare il tipo di evento</p>
		<input type="radio" onclick="openCity1(evt, concerto)" id="RadioConcerto" name="Radiobutton" required="required">
		<label for="Radiobutton1">Concerto</label><br>
		<input type="radio" onclick="openCity1(evt, eventoSportivo)" id="RadioEventoSportivo" name="Radiobutton" required="required">
		<label for="Radiobutton1">Evento sportivo</label><br>
		
		<div id="concerto" class="tabcontent tabcontent1">
			<p>Inserire il concerto</p>
			<label for="Artista">Artista / Band</label><br>
			<input type="text" id="Artista" name="Artista" required="required"><br>
			<label for="CodiceEventoConcerto">Codice evento</label><br>
			<input type="number" id="CodiceEventoConcerto" name="CodiceEventoConcerto" required="required"><br>
		</div>
		
		<div id="eventoSportivo" class="tabcontent tabcontent1">
			<p>Inserire l'evento sportivo</p>
			<label for="Tipo">Tipo</label><br>
			<input type="text" id="Tipo" name="Tipo" required="required"><br>
			<label for="Squadra1">Squadra1</label><br>
			<input type="text" id="Squadra1" name="Squadra1" required="required"><br>
			<label for="Squadra2">Squadra2</label><br>
			<input type="text" id="Squadra2" name="Squadra2" required="required"><br>
			<label for="CodiceEventoSportivo">Codice evento</label><br>
			<input type="number" id="CodiceEventoSportivo" name="CodiceEventoSportivo" required="required"><br>
		</div>
	</div>
	
	<div id="RemoveEvent" class="tabcontent">
		<p>Rimuovere un evento</p>
		
	
	</div>
	
	<div id="AddTicket" class="tabcontent">
		<p>Aggiungere un biglietto</p>
		<label for="Settore">Settore</label><br>
		<input type="text" id="Settore" name="Settore" required="required"><br>
		<label for="Costo">Costo</label><br>
		<input type="number" id="Costo" name="Costo:" required="required"><br>
		<label for="Quantità">Quantità</label><br>
		<input type="number" id="Quantità" name="Quantità" required="required"><br>
		<label for="CodiceEventoBiglietto">Codice evento</label><br>
		<input type="number" id="CodiceEventoBiglietto" name="CodiceEventoBiglietto" required="required"><br>
	
	</div>
	
	<div id="RemoveTicket" class="tabcontent">
		<p>Rimuovere un biglietto</p>
		
	
	
	</div>
	
	<div id="AddAdmin" class="tabcontent">
		<p>Aggiungere un admin</p>
		
	
	
	</div>
	
	<div id="RemoveAdmin" class="tabcontent">
		<p>Rimuovere un admin</p>
	
	
	</div>
	
	<div id="RemoveUser" class="tabcontent">
		<p>Rimuovere un utente</p>
	
	
	</div>
	
	<script src="AdminPage.js"></script>
	<script src="NavBar.js"></script>
</body>
</html>