<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="database" class="database.JDBC" scope="application"></jsp:useBean>
	<jsp:useBean id="booking" class="entities.Booking" scope="session"></jsp:useBean>
	
	<jsp:setProperty property="id" name="booking" value='<%= Integer.parseInt(request.getParameter("bId")) %>' />
	
	<% database.deleteBooking(booking.getId()); %>
	<jsp:forward page="bookingList.jsp" />

</body>
</html>