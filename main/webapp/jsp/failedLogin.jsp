<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Refresh" content="3;URL=../html, css/loginpage.html">
	<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="user" class="entities.User" scope="request"></jsp:useBean>
	
	<h2 align="center">Dear, User</h2><br>
	<h4 align="center">Login failed... <br> Incorrect username or password...</h4>

</body>
</html>