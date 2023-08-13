<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Refresh" content="3;URL=bookingList.jsp">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="user" class="entities.User" scope="session"></jsp:useBean>
	<jsp:useBean id="booking" class="entities.Booking" scope="session"></jsp:useBean>
	<jsp:useBean id="database" class="database.JDBC" scope="application"></jsp:useBean>

	<% database.deleteAllBookings(database.getUserId(user.getEmail(), user.getPassword())); %>
	<jsp:forward page="bookingList.jsp" />
	
</body>
</html>