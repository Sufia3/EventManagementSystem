<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="database" class="database.JDBC" scope="session"></jsp:useBean>
	<jsp:useBean id="user" class="entities.User" scope="session"></jsp:useBean>
	
	<jsp:setProperty property="email" name="user" value='<%=request.getParameter("email") %>' />	
	<jsp:setProperty property="password" name="user" value='<%=request.getParameter("password") %>' />
	
	<%
	String email = user.getEmail();
	String password = user.getPassword();
	%>
	
	<% if(database.loginUser(email, password)) { %>
	<jsp:forward page="success.jsp" />
	<% } else { %>
	<jsp:forward page="failed.jsp" />
	<% } %>
	
</body>
</html>