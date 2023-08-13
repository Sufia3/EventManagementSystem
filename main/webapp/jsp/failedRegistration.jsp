<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Refresh" content="3;URL=../html, css/loginpage.html">
	<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="user" class="entities.User" scope="request"></jsp:useBean>

	<h2 align="center">Dear <jsp:getProperty property="name" name="user"/>,</h2><br>
	<h4 align="center">Already registered. Try to login.</h4>
		
</body>
</html>