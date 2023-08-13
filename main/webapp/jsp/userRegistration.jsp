<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>User Details</title>
</head>
<body>


	<!-- JavaBean for JDBC class -->
	<jsp:useBean id="database" class="database.JDBC" scope="application"></jsp:useBean>	
	
	<!-- JavaBean for User class -->
	<jsp:useBean id="user" class="entities.User" scope="session"></jsp:useBean>
	
	<!-- Setting bean properties -->
	<jsp:setProperty property="name" name="user" value='<%=session.getAttribute("name").toString() %>' />	
	<jsp:setProperty property="phone" name="user" value='<%=Long.parseLong(session.getAttribute("phone").toString()) %>' />
	<jsp:setProperty property="email" name="user" value='<%=session.getAttribute("email").toString() %>' />
	<jsp:setProperty property="password" name="user" value='<%=session.getAttribute("password").toString() %>' />
	<jsp:setProperty property="employee" name="user" value='<%=session.getAttribute("employee").toString().charAt(0) %>' />



	
	
	<!-- inserting into database and acknowledgement -->
	<%
		if(database.registerUser(user)) {
	%>
	<jsp:forward page="successRegistration.jsp" />
	<%
		} else {
	%>
	<jsp:forward page="failedRegistration.jsp" />
	<% 
		}
	%>
	
	
	
</body>
</html>