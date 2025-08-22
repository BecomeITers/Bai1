package Demo;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Demo.User;

@WebServlet("/emaillist")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Thêm "throws ServletException, IOException" vào đây
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		User user = new User(email, firstName, lastName);
		
		System.out.println("User data receive: "+user.toString());
		
		request.setAttribute("user", user);	
		
		request.getRequestDispatcher("/thanks.jsp").forward(request, response);
	}
}