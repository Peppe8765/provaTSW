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
		<form action="AdminServlet" method="get">
			<p>Aggiungere uno stadio</p>
			<input type="text" id="action" name="action" value="addStadio" hidden="true">
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
			<label for="Comune">Comune</label><br>
			<input class="rettangoli" type="text" id="Comune" name="Comune" ><br>
			<label for="Società">Società</label><br>
			<input class="rettangoli" type="text" id="Società" name="Società" ><br>
			<label for="AnnoFondazione">Anno di fondazione</label><br>
			<input class="rettangoli" type="number" id="AnnoFondazione" name="AnnoFondazione" ><br>
			<input class="buttoncino" type="submit" value="Aggiungi">
		</form>
	
	</div>
	
	<div id="RemoveStadio" class="tabcontent">
		<form action="AdminServlet" method="get">
		<input type="text" id="action" name="action" value="removeStadio" hidden="true">
			<p>Rimuovere uno stadio</p>
			<label for="NomeStadio">Inserire il nome dello stadio da eliminare:</label><br>
			<input class="rettangoli" type="text" id="NomeStadio" name="NomeStadio" required="required"><br>
			<input class="buttoncino" type="submit" value="Rimuovi"><br>
		</form>
	
	
	</div>
	
	<div id="AddEvent" class="tabcontent">
		<form action="">
			<p>Aggiungere un evento</p>
			<input type="text" id="action" name="action" value="addEvent" hidden="true">
			<label for="Titolo">Titolo</label><br>
			<input class="rettangoli" type="text" id="Titolo" name="Titolo" required="required"><br>
			<label for="DataEvento">Data Evento</label><br>
			<input class="rettangoli" type="text" id="DataEvento" name="DataEvento" required="required"><br>
			<label for="StadioEvento">Nome dello Stadio</label><br>
			<input class="rettangoli" type="text" id="StadioEvento" name="StadioEvento" required="required"><br>
			<p>Selezionare il tipo di evento</p>
			<input class="rettangoli" type="radio" onclick="openCity1(evt, concerto)" id="RadioConcerto" name="Radiobutton" required="required">
			<label for="Radiobutton1">Concerto</label><br>
			<input class="rettangoli" type="radio" onclick="openCity1(evt, eventoSportivo)" id="RadioEventoSportivo" name="Radiobutton" required="required">
			<label for="Radiobutton1">Evento sportivo</label><br>
		</form>
		
		<div id="concerto" class="tabcontent tabcontent1">
			<form action="">
				<p>Inserire il concerto</p>
				<label for="Artista">Artista / Band</label><br>
				<input class="rettangoli" type="text" id="Artista" name="Artista" required="required"><br>
				</form>
		</div>
			
		<div id="eventoSportivo" class="tabcontent tabcontent1">
			<form action="">
				<p>Inserire l'evento sportivo</p>
				<label for="Tipo">Tipo</label><br>
				<input class="rettangoli" type="text" id="Tipo" name="Tipo" required="required"><br>
				<label for="Squadra1">Squadra1</label><br>
				<input class="rettangoli" type="text" id="Squadra1" name="Squadra1" required="required"><br>
				<label for="Squadra2">Squadra2</label><br>
				<input class="rettangoli" type="text" id="Squadra2" name="Squadra2" required="required"><br>
				</form>
		</div>
	</div>
	
<div id="RemoveEvent" class="tabcontent">
		<form action="AdminServlet" method="get">
			<p>Rimuovere un evento</p>
			<input type="text" id="action" name="action" value="removeEvent" hidden="true">
			<label for="CodiceEvento">Inserire il codice dell'evento da eliminare:</label><br>
			<input class="rettangoli" type="text" id="CodiceEvento" name="CodiceEvento" required="required"><br>
			<input class="buttoncino" type="submit" value="Rimuovi"><br>
		</form>
	</div>
	
		<div id="AddTicket" class="tabcontent">
		<form action="AdminServlet" method="get">
			<p>Aggiungere un biglietto</p>
			<input type="text" id="action" name="action" value="addTicket" hidden="true">
			<label for="Settore">Settore</label><br>
			<input class="rettangoli" type="text" id="Settore" name="Settore" required="required"><br>
			<label for="Costo">Costo</label><br>
			<input class="rettangoli" type="number" id="Costo" name="Costo" required="required"><br>
			<label for="Quantità">Quantità</label><br>
			<input class="rettangoli" type="number" id="Quantità" name="Quantità" required="required"><br>
			<label for="CodiceEventoBiglietto">Codice evento</label><br>
			<input class="rettangoli" type="number" id="CodiceEventoBiglietto" name="CodiceEventoBiglietto" required="required"><br>
			<input class="buttoncino" type="submit" value="Aggiungi"><br>
		</form>
	</div>
	
<div id="RemoveTicket" class="tabcontent">
		<form action="AdminServlet" method="get">
			<p>Rimuovere un biglietto</p>
			<input type="text" id="action" name="action" value="removeTicket" hidden="true">
			<label for="CodiceBiglietto">Inserire codice del biglietto da eliminare:</label><br>
			<input class="rettangoli" type="number" id="CodiceBiglietto" name="CodiceBiglietto" required="required"><br>
			<input class="buttoncino" type="submit" value="Rimuovi"><br>
		</form>
	
	</div>
	
<div id="AddAdmin" class="tabcontent">
		<form action="AdminServlet" method="get">
			<p>Promuovere un utente ad admin</p>
			<input type="text" id="action" name="action" value="addAdmin" hidden="true">
			<label for="NomeUtente">Inserire il nome dell'utente da promuovere ad admin:</label><br>
			<input class="rettangoli" type="text" id="NomeUtente" name="NomeUtente" required="required"><br>
			<label for="CodiceAdmin">Inserire il codice admin:</label><br>
			<input class="rettangoli" type="number" id="CodiceAdmin" name="CodiceAdmin" required="required"><br>
			<input class="buttoncino" type="submit" value="Promuovi"><br>
		</form>
	
	</div>
	
<div id="RemoveAdmin" class="tabcontent">
		<form action="AdminServlet" method="get">
			<p>Rimuovere un admin</p>
			<input type="text" id="action" name="action" value="removeAdmin" hidden="true">
			<label for="NomeAdmin">Inserire il nome dell'admin da declassare:</label><br>
			<input class="rettangoli" type="text" id="NomeAdmin" name="NomeAdmin" required="required"><br>
			<input class="buttoncino" type="submit" value="Rimuovi"><br>
		</form>
	</div>
	
	<div id="RemoveUser" class="tabcontent">
		<form action="AdminServlet" method="get">
			<p>Rimuovere un utente</p>
			<input type="text" id="action" name="action" value="removeUser" hidden="true">
			<label for="NomeUtente">Inserire il nome dell'utente da eliminare:</label><br>
			<input class="rettangoli" type="text" id="NomeUtente" name="NomeUtente" required="required"><br>
			<input class="buttoncino" type="submit" value="Rimuovi"><br>
		</form>
	</div>
	
	<script src="AdminPage.js"></script>
	<script src="NavBar.js"></script>
</body>
</html>