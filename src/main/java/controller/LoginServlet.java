package controller;

import java.io.IOException;


import java.sql.SQLException;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.UserDAO;
import model.connectionDAO;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final String ADMIN_EMAIL = "admin@gmail.com";
    private static final String ADMIN_PASSWORD = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");

         
            if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Email and password are required.");
                response.sendRedirect("login.jsp");
                return;
            }

        
            if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            
                User adminUser = new User();
                adminUser.setEmail(email);
                adminUser.setPassword(password); 
                session.setAttribute("user", adminUser);
              

            
                if ("on".equals(remember)) {
                    String token = UUID.randomUUID().toString();
                    Cookie emailCookie = new Cookie("userEmail", email);
                    Cookie tokenCookie = new Cookie("loginToken", token);
                    emailCookie.setMaxAge(30 * 24 * 60 * 60); 
                    tokenCookie.setMaxAge(30 * 24 * 60 * 60);
                    response.addCookie(emailCookie);
                    response.addCookie(tokenCookie);
                }

                response.sendRedirect("admin/home.jsp");
                return;
            }

          
            UserDAO dao = new UserDAO(connectionDAO.getconn());
            User user = dao.getUserByEmail(email);

            if (user == null) {
                session.setAttribute("errorMessage", "Invalid email or password.");
                response.sendRedirect("login.jsp");
                return;
            }

            
            if (!BCrypt.checkpw(password, user.getPassword())) {
                session.setAttribute("errorMessage", "Invalid email or password.");
                response.sendRedirect("login.jsp");
                return;
            }

         
            session.setAttribute("user", user);

        
            if ("on".equals(remember)) {
                String token = UUID.randomUUID().toString();
                Cookie emailCookie = new Cookie("userEmail", email);
                Cookie tokenCookie = new Cookie("loginToken", token);
                emailCookie.setMaxAge(30 * 24 * 60 * 60); 
                tokenCookie.setMaxAge(30 * 24 * 60 * 60); 
                response.addCookie(emailCookie);
                response.addCookie(tokenCookie);
            }

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        String userEmail = null;
        String loginToken = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userEmail".equals(cookie.getName())) {
                    userEmail = cookie.getValue();
                }
                if ("loginToken".equals(cookie.getName())) {
                    loginToken = cookie.getValue();
                }
            }
        }

        if (userEmail != null && loginToken != null) {
            try {
               
                if (ADMIN_EMAIL.equals(userEmail)) {
                    User adminUser = new User();
                    adminUser.setEmail(userEmail);
                    adminUser.setPassword(ADMIN_PASSWORD); 
                    session.setAttribute("user", adminUser);
                    response.sendRedirect("admin/home.jsp");
                    return;
                }

                // Regular user
                UserDAO dao = new UserDAO(connectionDAO.getconn());
                User user = dao.getUserByEmail(userEmail);
                if (user != null) {
                    session.setAttribute("user", user);
                    response.sendRedirect("index.jsp");
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}