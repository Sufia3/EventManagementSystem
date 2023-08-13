package entities;


// declaring Event class
public class Event {

	
	// class members
	private int id;
	private String name;
	
	
	// constructor
	public Event(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	
	// getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	// overriding the toString() method
	@Override
	public String toString() {
		return "Event [id=" + id + ", name=" + name + "]";
	}
	
}
