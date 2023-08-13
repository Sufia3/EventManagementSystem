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
		int userId = database.getUserId(user.getEmail(), user.getPassword());

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
	<jsp:setProperty property="userId" name="booking" value='<%= userId %>' />
	<jsp:setProperty property="eventId" name="booking" value='<%= Integer.parseInt(request.getParameter("eventtype")) %>' />
	<jsp:setProperty property="venueId" name="booking" value='<%= Integer.parseInt(request.getParameter("eventvenue")) %>' />
	
	<jsp:setProperty property="name" name="user" value='<%= database.getName(user.getEmail()) %>'/>
	
	<h2 style="text-align:center">Confirm Booking</h2>
	
	<p style="text-align: center">
		Name : <jsp:getProperty property="name" name="user" /><br>
		Event Date : <jsp:getProperty property="date" name="booking" /><br>
		Booking time : <jsp:getProperty property="session" name="booking" /><br>
		Number of guests will be present : <jsp:getProperty property="guestNo" name="booking" /><br>
		Event Type : <%= eventName %> <br>
		Venue : <%= venueLoc %> <br>
		
		<button onclick="window.location.href = 'userBooking.jsp'">Confirm?</button> <button onclick="window.location.href = '../html, css/homepage_second.html'">Cancel</button>
		
	</p>

</body>
</html>