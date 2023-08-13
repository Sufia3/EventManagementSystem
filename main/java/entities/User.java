package entities;

public class User {
	
	// class variables
	private String name;
	private long phone;
	private String email;
	private String password;
	private char employee;
	
	
	// constructors
	public User(String name, long phone, String email, String password, char employee) {
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.employee = employee;
	}
	
	public User() {}
	



	// getters and setters
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public long getPhone() {
		return phone;
	}


	public void setPhone(long phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public char getEmployee() {
		return employee;
	}


	public void setEmployee(char employee) {
		this.employee = employee;
	}


	@Override
	public String toString() {
		return "User [name=" + name + ", phone=" + phone + ", email=" + email + ", password=" + password + ", employee="
				+ employee + "]";
	}
	
	
}
