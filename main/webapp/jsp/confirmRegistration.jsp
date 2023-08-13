<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	
	<h2 style="text-align:center">Confirm Details</h2>
	
	<p style="text-align:center">
		<!-- Getting the data from the form -->
		<% String name = request.getParameter("firstname") + " " + request.getParameter("lastname"); %>
		Name : <%= name %>
		<br>
		
		<% long phone = Long.parseLong(request.getParameter("mobileno")); %>
		Phone number : <%= phone %>
		<br>
		
		<% String email = request.getParameter("email"); %>
		Email : <%= email %>
		<br>
		
		<% String password = request.getParameter("password"); %>
		Password : <%= password %>
		<br>
		
		<% String employee = request.getParameter("employee"); %>
		Employee : <%= employee %>
		<br>




		<%
		// Taking the attributes in the application store
		session.setAttribute("name", name);
		session.setAttribute("phone", phone);
		session.setAttribute("email", email);
		session.setAttribute("password", password);
		session.setAttribute("employee", employee);
		%>
	
		<button onclick="window.location.href = 'userRegistration.jsp'">Confirm?</button> <button onclick="window.location.href = '../html, css/homepage.html'">Cancel</button>

	</p>
	
</body>
</html>