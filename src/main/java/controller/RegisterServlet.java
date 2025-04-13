package controller;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.UserDAOImplemented;
import model.connectionDAO;



@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String name=request.getParameter("fname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String password=request.getParameter("password");
			 
			System.out.println(name+""+email+""+phno+""+password);
			
			
		
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			
			UserDAOImplemented dao = new UserDAOImplemented(connectionDAO.getconn());
			boolean f =dao.userRegister(us);
			
			if(f){
				
				System.out.println("Registered Successfully");
			}else {
				
				System.out.println("stg went wrong	");
			}
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}

	}

}
