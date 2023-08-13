<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.text.SimpleDateFormat, java.util.Date, java.util.ArrayList, entities.Event, entities.Venue"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="user" class="entities.User" scope="session"></jsp:useBean>
	<jsp:useBean id="booking" class="entities.Booking" scope="session"></jsp:useBean>
	<jsp:useBean id="database" class="database.JDBC" scope="application"></jsp:useBean>

	<%
		int eventId = Integer.parseInt(request.getParameter("eventtype"));
		String eventName = "";
		ArrayList<Event> events = database.getAllEvents();
		for(Event e : events)
			if(e.getId() == eventId)
				eventName = e.getName();
		
		int venueId = Integer.parseInt(request.getParameter("eventvenue"));
		String venueLoc = "";
		ArrayList<Venue> venues = database.getAllVenues();
		for(Venue v : venues)
			if(v.getId() == venueId)
				venueLoc = v.getLoc();
	%>
	
	
	<jsp:setProperty property="date" name="booking" value='<%= request.getParameter("eventdate")  %>'/>
	<jsp:setProperty property="session" name="booking" value='<%= request.getParameter("session").charAt(0) %>' />
	<jsp:setProperty property="guestNo" name="booking" value='<%= Integer.parseInt(request.getParameter("guestno")) %>' />
	<jsp:setProperty property="eventId" name="booking" value='<%= Integer.parseInt(request.getParameter("eventtype")) %>' />
	<jsp:setProperty property="venueId" name="booking" value='<%= Integer.parseInt(request.getParameter("eventvenue")) %>' />
	
	
	<% database.updateBooking(booking); %>
	<jsp:forward page="bookingList.jsp" />
	

</body>
</html>