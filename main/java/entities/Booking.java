package entities;


// declaring Booking class
public class Booking {

	// class members
	private int id;
	private String date;
	private char session;
	private int guestNo;
	private int userId;
	private int eventId;
	private int venueId;
	
	
	// constructor
	public Booking() {}
	
	public Booking(int id, String date, char session, int guestNo, int userId, int eventId, int venueId) {
		this.id = id;
		this.date = date;
		this.session = session;
		this.guestNo = guestNo;
		this.userId = userId;
		this.eventId = eventId;
		this.venueId = venueId;
	}
	
	
	// getters and setters
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}

	public char getSession() {
		return session;
	}
	
	public void setSession(char session) {
		this.session = session;
	}
	
	public int getGuestNo() {
		return guestNo;
	}
	
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getEventId() {
		return eventId;
	}
	
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	
	public int getVenueId() {
		return venueId;
	}
	
	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}
	
	
	// overriding the toString() method
	@Override
	public String toString() {
		return "Booking [id=" + id + ", date=" + date + ", session=" + session + ", guestNo=" + guestNo + ", userId=" + userId + ", eventId="
				+ eventId + ", venueId=" + venueId + "]";
	}
	
}
