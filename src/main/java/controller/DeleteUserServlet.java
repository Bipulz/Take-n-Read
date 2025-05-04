package controller;

import model.UserDAO;


import model.connectionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        try {
			userDAO = new UserDAO(connectionDAO.getconn());
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        String redirectUrl = request.getContextPath() + "/admin/userDetails.jsp";

        try {
            int userId = Integer.parseInt(userIdStr);
            boolean deleted = userDAO.deleteUser(userId);
            if (deleted) {
                System.out.println("User with ID " + userId + " deleted successfully");
                redirectUrl += "?success=" + URLEncoder.encode("User deleted successfully", "UTF-8");
            } else {
                System.out.println("Failed to delete user with ID " + userId + " (possibly admin or not found)");
                redirectUrl += "?error=" + URLEncoder.encode("Cannot delete user (admin or not found)", "UTF-8");
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid userId format: " + userIdStr);
            e.printStackTrace();
            redirectUrl += "?error=" + URLEncoder.encode("Invalid user ID", "UTF-8");
        }

        response.sendRedirect(redirectUrl);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}