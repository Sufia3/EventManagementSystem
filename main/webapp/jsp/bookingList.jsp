<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.util.ArrayList, entities.Booking, entities.Event, entities.Venue"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../html, css/homepage.css">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../html, css/header_footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>


	<div class="header_container">
        <header class="header">
            <!-- For logo -->
            <div class="left">
                <img src="../html, css/img/event_logo.png" alt="" width="300px" height="50px">
            </div>
            <!-- For navbar -->
            <div class="mid">
                <ul class="navbar">
                    <div class="item">
                        <li><a href="bookingList.jsp">See Bookings</a></li>
                    </div>
                    <div class="item">
                        <li><a href="userLogout.jsp" target="_blank" rel="noopener noreferrer">Logout</a></li>
                    </div>
                    <div class="item">
                        <li><a href="../html, css/booking_page.html"><button class="header_book_btn">Book Now</button></a></li>
                    </div>
                    <!-- <li><a href="bookingpage.html"><button class="header_book_btn">Book Now</button></a></li> -->
                    <!-- <li><button class="header_book_btn">Book Now</button></li> -->
                    <!-- <li><a href="#">Book Now</a></li> -->
                </ul>
            </div>
        </header>
    </div>


	<jsp:useBean id="user" class="entities.User" scope="session"></jsp:useBean>
	<jsp:useBean id="booking" class="entities.Booking" scope="session"></jsp:useBean>
	<jsp:useBean id="database" class="database.JDBC" scope="application"></jsp:useBean>
	

	<table style="margin-left: auto; margin-right: auto; margin-top: 1rem; color: black; border: 1px solid black; border-radius: 10px; text-align: center; width:70vw; height:10vh">
		<tr>
			<th>Booking ID</th>
			<th>Name</th>
			<th>Date</th>
			<th>Session</th>
			<th>Number of guests</th>
			<th>Event type</th>
			<th>Venue</th>
			<th></th>
		</tr>
		
		
		<%
		ArrayList<Booking> bookings = database.getAllBookings(database.getUserId(user.getEmail(), user.getPassword()));
		for(Booking b : bookings) {
		%>
		<tr>
			<td><%= b.getId() %></td>
			<td><%= database.getName(b.getUserId()) %></td>
			<td><%= b.getDate().split(" ", 2)[0] %></td>
			<td><%= (b.getSession() == 'm' ? "morning" : "night") %></td>
			<td><%= b.getGuestNo() %></td>
			<td>
			<%
			for(Event e : database.getAllEvents())
				if(e.getId() == b.getEventId())
					out.print(e.getName());
			%>
			</td>
			<td>
			<%
			for(Venue v : database.getAllVenues())
				if(v.getId() == b.getVenueId())
					out.print(v.getLoc());
			%>
			</td>
			<td><form action="editBooking.jsp" method="post"><button name="bId" value="<%= b.getId() %>">Edit</button></form></td>
			<td><form action="confirmDelete.jsp" method="post"><button name="bId" value="<%= b.getId() %>">Delete</button></form></td>
		</tr>
		<% } %>
		
	</table>

	<p id="index"></p>

	<!-- FOOTER PART -->
    <footer class="footer" style="position: fixed; width: 100%; bottom: 0">
        <div class="footer_container">
            <!-- <div class="footer_row"> -->

            <div class="footer_col1">
                <div class="img_container">
                    <img src="../html, css/img/CE.png" alt="" width="300px" height="300px">
                </div>
            </div>



            <div class="footer_col2">
                <div class="contact_info_container">
                    <h2>Contact</h2>
                    <ul>
                        <!-- <li><a href="#">RCC Institute of Information Technology</a> </li>         
                        <li><a href="#">cosaevents@gmail.com</a> </li>
                        <li><a href="#">123-567-137</a> </li> -->
                        <div class="address_container">
                            <i class="fa fa-home" style="font-size:24px"></i>
                            <li>RCC Institute of Information Technology</li>
                        </div>
                        <div class="email_container">
                            <i class="fa fa-envelope" style="font-size:24px"></i>
                            <li>continuumEvents@gmail.com</li>
                        </div>
                        <div class="phone_container">
                            <i class="fa fa-phone" style="font-size:24px"></i>
                            <li>123-567-137</li>
                        </div>

                    </ul>
                </div>

            </div>
            <!-- </div> -->
        </div>
    </footer>

</body>
</html>