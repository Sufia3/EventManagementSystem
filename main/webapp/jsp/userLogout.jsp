<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Refresh" content="3;URL=../html, css/homepage.html">	
	<title>Insert title here</title>
</head>
<body>
	
	<h2 align="center">Logged out.</h2>
	<h4 align="center">Thank you for using.</h4>

	<% session.invalidate(); %>

</body>
</html>