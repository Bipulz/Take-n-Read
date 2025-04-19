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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            session.setAttribute("errorMessage", "Please log in to view your profile.");
            System.out.println("Profile access denied: User not logged in");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            UserDAO dao = new UserDAO(connectionDAO.getconn());
            User updatedUser = dao.getUserByEmail(user.getEmail());
            if (updatedUser != null) {
                request.setAttribute("user", updatedUser);
                request.getRequestDispatcher("/view/essentials/profile.jsp").forward(request, response);
            } else {
                session.setAttribute("errorMessage", "User not found.");
                System.out.println("Profile error: User not found for email: " + user.getEmail());
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        } catch (Exception e) {
            System.err.println("Error in ProfileServlet: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "An error occurred. Please try again.");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}