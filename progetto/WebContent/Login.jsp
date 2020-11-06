<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test per il form di login</title>
</head>
<body>
	<h1> Pagina di test per il form di login </h1>
	
	<div class="scelta">
		<button>Registrazione</button>
		<button>Login</button>
		<button>Admin Login</button>
	</div>
	
		<%
	String message = (String)request.getAttribute("regMess");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
	
<%}%>
	

	
	<div class="registrazione">
		<form action="RegisterServlet" method="post">
			<label for="email">Email</label><br>
			<input type="email" id="email" name="email" required><br>
			<label for="uname">Nome utente:</label><br>
			<input type="text" id="uname" name="uname" required><br>
			<label for="pass">Password:</label><br>
			<input type="password" id="pass" name="pass" required><br>
			<label for="pass2">Ripeti la Password</label><br>
			<input type="password" id="pass2" name="pass2"required><br>
			
			<input type="submit" value="Invia">
		</form>		
	</div>
	
	
	<div class="login">
		<form action="LoginServlet" method="post">
			<label for="uname">Nome utente:</label><br>
			<input type="text" id="uname" name="uname" required><br>
			<label for="pass">Password:</label><br>
			<input type="password" id="pass" name="pass" required><br>
			<input type="submit" value="Login">
		</form>
		
	</div>
	
	
	<div class="loginAdmin">
		<form action="AdminLoginServlet" method="post">
		<label for="uname">Nome utente:</label><br>
			<input type="text" id="uname" name="uname" required><br>
			<label for="pass">Password:</label><br>
			<input type="password" id="pass" name="pass" required><br>
			<label for="codiceAdmin"> Codice di accesso Admin</label><br>
			<input type="number" id="codiceAdmin" name="codiceAdmin" min = 0  max = 999999 required><br>
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>