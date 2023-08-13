<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Refresh" content="3;URL=../html, css/homepage_second.html">
	<title>Insert title here</title>
</head>
<body>

		<jsp:useBean id="user" class="entities.User" scope="session"></jsp:useBean>
		
		<h2 align="center">Dear <jsp:getProperty property="name" name="user"/>,</h2><br>
		<h4 align="center">Thank you for registering.</h4>
		<p align="center">
			Name : <jsp:getProperty property="name" name="user"/><br>
			Phone number : <jsp:getProperty property="phone" name="user"/><br>
			Email : <jsp:getProperty property="email" name="user"/><br>
			Password : <jsp:getProperty property="password" name="user"/><br>
			Employee : <jsp:getProperty property="employee" name="user"/><br>
		</p>
		
</body>
</html>