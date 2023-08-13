package entities;


// declaring the Venue class
public class Venue {

	// class members
	private int id;
	private String loc;

	
	// constructor
	public Venue(int id, String loc) {
		super();
		this.id = id;
		this.loc = loc;
	}


	// getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}


	// overriding the toString() method
	@Override
	public String toString() {
		return "Venue [id=" + id + ", loc=" + loc + "]";
	}	
	
}
