<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<link rel="stylesheet" href="Home2.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>


<!-- Navigation Bar -->

<ul class="navBar" id="myNavBar1">
  	<li><a class= "sinistra" href="#home">HOME</a></li>
  	<li><a class= "sinistra" href="#stadi">STADI</a></li>
  	<li><a class= "sinistra" href="#biglietti">BIGLIETTI</a></li>
  	<li><a class= "sinistra" href="#about">ABOUT</a>
  		<a href="javascript:void(0);" class="icon" onclick="myFunction()"><b>&#9776;</b></a></li>
  	<li><a class="destra" href="#carrello" data-toggle="tooltip" data-placement="left" title= "CARRELLO"><i class='fas fa-shopping-cart'></i></a></li>
  	<li><a class="destra active" href="#login" data-toggle="tooltip" data-placement="left" title="LOGIN"><i class='fas fa-user-alt'></i></a></li>
</ul>


	<div class="scelta col-8 col-s-10">
		<button class="button">Registrazione</button>
		<button class="button">Login</button>
		<button class="button">Admin Login</button>
	</div>

	<%
	String message = (String)request.getAttribute("regMess");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
	
<%}%>
	
	<div class="registrazione">
		<form action="RegisterServlet" method="post" name="formReg" onsubmit="">
			<label for="email">Email</label><br>
			<input class="rettangoli" type="email" id="email" name="email"><br>
			<p id="validEmailReg"></p>
			<label for="uname">Nome utente:</label><br>
			<input class="rettangoli" type="text" id="uname" name="uname"><br>
			<p id="validUnameReg"></p>
			<label for="pass">Password:</label><br>
			<input class="rettangoli" type="password" id="pass" name="pass"><br>
			<p id="validPassReg"></p>
			<label for="pass2">Ripeti la Password</label><br>
			<input class="rettangoli" type="password" id="pass2" name="pass"><br>
			<p id="validRPassReg"></p>
			<p id="error"></p>
			<input class="buttoncino" type="submit" value="Invia">
		</form>		
	</div>
	
	
	<div class="login">
		<form action="LoginServlet" method="post" name="formLog">
			<label for="uname">Nome utente:</label><br>
			<input class="rettangoli" type="text" id="uname" name="uname" pattern=".{8,}"><br>
			<p id="validUnameLog"></p>
			<label for="pass">Password:</label><br>
			<input class="rettangoli" type="password" id="pass" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"><br>
			<p id="validPassLog"></p>
			
			<input class="buttoncino" type="submit" value="Login">
		</form>
		
	</div>
	
	
	<div class="loginAdmin">
		<form action="AdminLoginServlet" method="post" name="formLogA" onsubmit="return alert()">
			<label for="uname">Nome utente:</label><br>
			<input class="rettangoli" type="text" id="uname" name="uname" pattern=".{8,}" required><br>
			<p id="validUnameLogA"></p>
			<label for="pass">Password:</label><br>
			<input class="rettangoli" type="password" id="pass" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required><br>
			<p id="validUnameLogA"></p>
			<label for="codiceAdmin"> Codice di accesso Admin</label><br>
			<input class="rettangoli" type="number" id="codiceAdmin" name="codiceAdmin" required><br>
			<p id="validUnameLogA"></p>
			
			<input class="buttoncino" type="submit" value="Login">
		</form>
	</div>

<script src="FormValLog2.js"></script>

</body>
</html>