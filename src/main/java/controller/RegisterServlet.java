package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.UserDAO;
import model.connectionDAO;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            // Get form parameters
            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String acceptTerms = request.getParameter("acceptTerms");

            // Log received data
            System.out.println("Received form data: name=" + name + ", email=" + email + ", phno=" + phno + 
                               ", password=" + password + ", address=" + address + ", city=" + city + 
                               ", state=" + state + ", acceptTerms=" + acceptTerms);

            // Validate NOT NULL fields
            if (name == null || email == null || phno == null || password == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || phno.trim().isEmpty() || 
                password.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Name, email, phone number, and password are required.");
                System.out.println("Validation failed: Missing or empty NOT NULL fields");
                response.sendRedirect("register.jsp");
                return;
            }

            // Validate email format
            if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                session.setAttribute("errorMessage", "Invalid email format.");
                System.out.println("Validation failed: Invalid email format");
                response.sendRedirect("register.jsp");
                return;
            }

            // Validate terms
            if (!"on".equals(acceptTerms)) {
                session.setAttribute("errorMessage", "You must accept the terms and conditions.");
                System.out.println("Validation failed: Terms not accepted");
                response.sendRedirect("register.jsp");
                return;
            }

            // Check email uniqueness
            UserDAO dao = new UserDAO(connectionDAO.getconn());
            if (dao.getUserByEmail(email) != null) {
                session.setAttribute("errorMessage", "Email is already registered.");
                System.out.println("Validation failed: Email already exists");
                response.sendRedirect("register.jsp");
                return;
            }

            // Create User object
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
            us.setAddress(address); // Can be null
            us.setCity(city); // Can be null
            us.setState(state); // Can be null
            us.setLandmark(null); // Not in form
            us.setZip(null); // Not in form
            us.setAcceptTerms("on".equals(acceptTerms));

            // Register user
            boolean success = dao.userRegister(us);
            System.out.println("Registration result: " + success);

            if (success) {
                session.setAttribute("successMessage", "Registered successfully! Please log in.");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMessage", "Registration failed. Please try again.");
                System.out.println("Registration failed: Database insertion failed");
                response.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            System.err.println("Error in RegisterServlet: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect("register.jsp");
        }
    }
}