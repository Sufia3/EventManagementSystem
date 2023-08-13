<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="database.JDBC"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Refresh" content="3;URL=../html, css/homepage_second.html">
	<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="user" class="entities.User" scope="session"></jsp:useBean>
	
	<h2 align="center">Dear, <%= JDBC.getName(user.getEmail()) %></h2><br>
	<h4 align="center">Login successful!!</h4>

</body>
</html>