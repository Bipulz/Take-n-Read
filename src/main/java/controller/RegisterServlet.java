
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
            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");
            String acceptTerms = request.getParameter("acceptTerms");

            System.out.println("Received form data: name=" + name + ", email=" + email + ", phno=" + phno + ", password=" + password + ", acceptTerms=" + acceptTerms);

            if (name == null || email == null || phno == null || password == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || phno.trim().isEmpty() || password.trim().isEmpty()) {
                session.setAttribute("errorMessage", "All fields are required.");
                response.sendRedirect("register.jsp");
                return;
            }

            if (!"on".equals(acceptTerms)) {
                session.setAttribute("errorMessage", "You must accept the terms and conditions.");
                response.sendRedirect("register.jsp");
                return;
            }

            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            // Hash the password using BCrypt
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            us.setPassword(hashedPassword);
            us.setAcceptTerms("on".equals(acceptTerms));

            System.out.println("Creating UserDAO object...");
            UserDAO dao = new UserDAO(connectionDAO.getconn());
            System.out.println("UserDAO object created successfully");

            boolean success = dao.userRegister(us);

            if (success) {
                session.setAttribute("successMessage", "Registered successfully!");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMessage", "Registration failed. Email may be taken.");
                response.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect("register.jsp");
        }
    }
}