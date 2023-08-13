<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>BOOKING-CONTINUUM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../html, css/header_footer.css">
    <link rel="stylesheet" href="../html, css/booking_page.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

	<jsp:useBean id="booking" class="entities.Booking" scope="session"></jsp:useBean>
	<jsp:setProperty property="id" name="booking" value='<%= Integer.parseInt(request.getParameter("bId")) %>' />

    <!-- HEADER PART -->
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
                        <li><a href="../jsp/bookingList.jsp">See Bookings</a></li>
                    </div>
                    <div class="item">
                        <li><a href="../jsp/userLogout.jsp">Logout</a></li>
                    </div>
                    <div class="item">
                        <li><a href="booking_page.html"><button class="header_book_btn">Book Now</button></a></li>
                    </div>
                </ul>
            </div>
        </header>
    </div>

    
<!-- MIDDLE PART -->
    <div class="main_booking_container">
        <div class="booking_withdetails_container">
            <div class="booking_heading_container">
                Edit Booking Details
            </div>
            <div class="form_box">
                <form action="editUserBooking.jsp">
                
                    <div class="basic_info">
                        <label for="eventdate" class="required">Date : </label><br>
                        <input type="date" id="eventdate" name="eventdate" value="" required>
                    </div>
                    
                    <div class="basic_info">
                        <p style="color: black; font-size: 1.3em; margin:auto;" class="required" required>Session :</p><br>
					    <input style="width: 1em; height: 1em;" type="radio" id="morning" name="session" value="m" required>
					    <label for="morning">Morning</label>
					    <input style="width: 1em; height: 1em;" type="radio" id="evening" name="session" value="n">
					    <label for="evening">Night</label>					
					</div>
    
                    <div class="basic_info">
                        <label for="eventtype" class="required">Event Type : </label><br>
                        <!-- <input type="text" id="eventtype" name="eventtype" required> -->
                        <select name="eventtype" id="eventtype" required>
                            <option value="1">Conferences and Seminars</option>
                            <option value="2">Trade Shows and Exhibitions</option>
                            <option value="3">Corporate</option>
                            <option value="4">Networking</option>
                            <option value="5">Charity and Fundraising</option>
                            <option value="6">Social and Cultural</option>
                            <option value="7">Concerts and Music</option>
                            <option value="8">Sports</option>
                            <option value="9">Art Exhibitions and Performance</option>
                            <option value="10">Wedding and Receptions</option>
                            <option value="11">Education</option>
                            <option value="12">Product Launching</option>
                            <option value="13">Birthday Celebration</option>
                        </select>
                    </div>
    
                    <div class="basic_info">
                        <label for="eventvenue" class="required">Event Venue : </label><br>
                        <!-- <input type="text" id="eventtype" name="eventtype" required> -->
                        <select name="eventvenue" id="eventvenue" required>
                            <option value="1">Conference Center</option>
                            <option value="2">Hotel</option>
                            <option value="3">Convention Center</option>
                            <option value="4">Stadium and Arena</option>
                            <option value="5">Theatre</option>
                            <option value="6">Auditorium</option>
                            <option value="7">Outdoor Space</option>
                            <option value="8">Museum</option>
                            <option value="9">Gallary</option>
                            <option value="10">Community Hall</option>
                            <option value="11">Restaurant</option>
                            <option value="12">Banquet Hall</option>
                            <option value="13">Exhibition Center</option>
                            <option value="14">Cruise Ship and Boat</option>
                        </select>
                    </div>
    
                    <div class="basic_info">
                        <label for="guestno" class="required">Number of guests : </label><br>
                        <input type="number" id="guestno" name="guestno" required>
                    </div>
    
                    <button class="submit" value="submit" id="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>





    


     <!-- FOOTER PART -->
     <footer class="footer">
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