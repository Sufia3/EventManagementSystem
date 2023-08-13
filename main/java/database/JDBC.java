package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import entities.Booking;
import entities.Event;
import entities.User;
import entities.Venue;  


public class JDBC{  
	
	// connection method
	static private void getConnection() {
		try{  
			//load the driver class  
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//create  the connection object  
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Employee","Employee123");  
			  
			//create the statement object  
			stmt = con.createStatement(); 
			
		}catch(Exception e){ 
			System.out.println(e);
		}
	}
	
	
	
	
	// method for getting all existing users
	static protected HashMap<String, String> getUsers(){
		
		getConnection();
		
		HashMap<String, String> users = new HashMap<>();
		
		try {
			ResultSet rs = stmt.executeQuery("SELECT email, password FROM Users");
			
			while(rs.next()) {
				
				// populating the hashSet
				users.put(rs.getString(1), rs.getString(2));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}

	
	// method for getting userId
	static public int getUserId(String email, String password) {
		
		// getting connection
		getConnection();
		
		int id = 0;
		
		try {
			
			// execute the query
			ResultSet rs = stmt.executeQuery(String.format("SELECT id FROM Users WHERE email='%s' AND password='%s'", email, password));
			
			while(rs.next()) {
				id = rs.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	
	// method for getting name of the user
	static public String getName(int id) {
		String name = "";
		
		// getting the connection
		getConnection();
		
		try {
			
			// executing the query
			ResultSet rs = stmt.executeQuery(String.format("SELECT name FROM Users WHERE id=%d", id));
			
			while(rs.next()) {
				name = rs.getString(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return name;
		
	}
	
		
	// method for getting name of the user
	static public String getName(String email) {
		String name = "";
		
		// getting the connection
		getConnection();
		
		try {
			
			// executing the query
			ResultSet rs = stmt.executeQuery(String.format("SELECT name FROM Users WHERE email='%s'", email));
			
			while(rs.next()) {
				name = rs.getString(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return name;
		
	}
	
	
	// registering user
	static public boolean registerUser(User u) {
		
		boolean userRegistered = false;
		
		getConnection();
		
		if(!getUsers().containsKey(u.getEmail())) {
			if(!(getUsers().get(u.getEmail()) == u.getPassword())) {
				try {
					int row = stmt.executeUpdate(String.format("INSERT INTO Users(name, phone, email, password, employee) VALUES('%s', %d, '%s', '%s', '%c')", u.getName(), u.getPhone(), u.getEmail(), u.getPassword(), u.getEmployee()));
					
					if(row > 0) {
						userRegistered = true;
					}
					
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return userRegistered;
		
	}
	
	
	// logging in user
	static public boolean loginUser(String email, String password) {
		
		boolean userLogged = false;
		
		getConnection();
		
		if(getUsers().containsKey(email)) {
			if(getUsers().get(email).equals(password)) {
				userLogged = true;
			}
		}
		
		return userLogged;
		
	}
	
	 
	// method for getting all events
	static public ArrayList<Event> getAllEvents() {
		
		// getting the connection
		getConnection();
		
		ArrayList<Event> eventArr = new ArrayList<>();
		
		try {	  
		
			// executing query  
			ResultSet rs = stmt.executeQuery("select * from Events");
			
			while(rs.next()) {
				
				// populating the arrayList
				eventArr.add(new Event(rs.getInt(1), rs.getString(2)));
			}
			
			  
			//close the connection object  
			con.close();
		  
		}catch(Exception e){ 
			System.out.println(e);
		}
		
		return eventArr;
		  
	}
	
	
	// method for getting all venues
	static public ArrayList<Venue> getAllVenues() {
		
		// getting the connection
		getConnection();
		
		ArrayList<Venue> venueArr = new ArrayList<>();
		
		try {	  
		
			// executing query  
			ResultSet rs = stmt.executeQuery("select * from Venues");
			
			while(rs.next()) {
				
				// populating the arrayList
				venueArr.add(new Venue(rs.getInt(1), rs.getString(2)));
			}
			
			  
			//close the connection object  
			con.close();
		  
		}catch(Exception e){ 
			System.out.println(e);
		}
		
		return venueArr;
		
	}
	
	
	// method for registering bookings
	static public boolean registerBooking(Booking b) {
		
		boolean bookingRegistered = false;
		
		// getting the connection
		getConnection();
		
		try {	  
			
			// executing query  
			int row = stmt.executeUpdate(String.format("INSERT INTO Bookings(eventDate, bookSession, guestNumber, userId, eventId, venueId) VALUES(DATE '%s', '%c', %d, %d, %d, %d)", b.getDate(), b.getSession(), b.getGuestNo(), b.getUserId(), b.getEventId(), b.getVenueId()));
			
			if(row > 0) {
				bookingRegistered = true;
			}
			
			//close the connection object  
			con.close();
		
		}catch(Exception e){ 
			System.out.println(e);
		}
		
		return bookingRegistered;
		
	}
	
	
	//method for updating booking
	static public void updateBooking(Booking b) {
		
		// getting the connection
		getConnection();
		
		try {	  
			
			// executing query  
			int row = stmt.executeUpdate(String.format("UPDATE Bookings SET eventDate=DATE '%s', bookSession='%c', guestNumber=%d, eventId=%d, venueId=%d WHERE id=%d", b.getDate(), b.getSession(), b.getGuestNo(), b.getEventId(), b.getVenueId(), b.getId()));
			
			//close the connection object  
			con.close();
		
		}catch(Exception e){ 
			System.out.println(e);
		}
		
	}
		
		
	// method for getting all bookings
	static public ArrayList<Booking> getAllBookings(int id) {
		
		boolean isEmployee = false;
		
		// getting the connection
		getConnection();
		
		ArrayList<Booking> bookingArr = new ArrayList<>();
		
		try {
			
			ResultSet rs = stmt.executeQuery(String.format("SELECT employee FROM Users WHERE id=%d", id));
		
			while(rs.next()) {
				if(rs.getString(1).charAt(0) == 'y') {
					isEmployee = true;
				}
			}
			
			// executing query
			if(isEmployee)
				rs = stmt.executeQuery("SELECT * FROM Bookings");
			else
				rs = stmt.executeQuery(String.format("SELECT * FROM Bookings WHERE userId=%d", id));
			
			while(rs.next()) {
				
				// populating the arrayList
				bookingArr.add(new Booking(rs.getInt(1), rs.getString(2), rs.getString(3).charAt(0), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7)));
			}
			
			  
			//close the connection object  
			con.close();
		
		}catch(Exception e){ 
			System.out.println(e);
		}
		
		return bookingArr;
		  
	}
	
	
	// method to delete booking
	public static void deleteBooking(int id) {
		
		// getting the connection
		getConnection();
		
		try {	  
			
			// executing query  
			int row = stmt.executeUpdate(String.format("DELETE FROM Bookings WHERE id=%d", id));
			
			//close the connection object  
			con.close();
		
		}catch(Exception e){ 
			System.out.println(e);
		}
		
	}
	
	
	// method to delete all bookings
	public static void deleteAllBookings(int id) {
		
		// getting the connection
		getConnection();
		
		try {	  
			
			// executing query  
			int row = stmt.executeUpdate(String.format("DELETE FROM Bookings WHERE userId=%d", id));
			
			//close the connection object  
			con.close();
		
		}catch(Exception e){ 
			System.out.println(e);
		}
		
	}
	
	
	// class members
	private static Connection con; 
	private static Statement stmt;

}  