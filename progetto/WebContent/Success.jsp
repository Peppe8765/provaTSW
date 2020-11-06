<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1> pagina di successo</h1>
<%
	String user = null;
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
		else
			user = (String )session.getAttribute("user");
%>

<h3> hi, ${user}</h3>
<a href = "${pageContext.request.contextPath}/LogoutServlet"> logout</a>

</body>
</html>