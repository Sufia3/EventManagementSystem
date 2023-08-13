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

	<h4 style="text-align: center">Dear, <jsp:getProperty property="name" name="user" /></h4><br>
	<h2 style="text-align: center">Thank you for sharing time with us.</h2><br>

</body>
</html>