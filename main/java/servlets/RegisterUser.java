package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import database.JDBC;
import entities.User;

/**
 * Servlet implementation class registerUser
 */
@WebServlet("/registerUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("firstname") + request.getParameter("lastname");
		long phone = Long.parseLong(request.getParameter("mobileno"));
		String email = request.getParameter("email");
		String password = request.getParameter("confirm_password");
		char employee = request.getParameter("employee").charAt(0);
		System.out.println(name + phone);
		User newUser = new User(name, phone, email, password, employee);
		System.out.println(JDBC.registerUser(newUser));
		if(JDBC.registerUser(newUser)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/success.jsp");
			dispatcher.forward(request, response);
		} else {
			out.print("Wrong username or password....");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/failed.jsp");
			dispatcher.include(request, response);
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
