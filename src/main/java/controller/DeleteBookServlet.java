package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.connectionDAO;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the bookId parameter from the request
        String bookIdStr = request.getParameter("bookId");
        int bookId;
        
        // Validate bookId
        try {
            bookId = Integer.parseInt(bookIdStr);
        } catch (NumberFormatException e) {
            // If bookId is invalid, redirect back with an error message
            response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?error=Invalid+book+ID");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Establish database connection
            conn = connectionDAO.getconn();
            
            // Prepare the DELETE SQL statement
            String sql = "DELETE FROM book WHERE bookId = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bookId);
            
            // Execute the deletion
            int rowsAffected = stmt.executeUpdate();
            
            // Redirect back to allBook.jsp with a success or failure message
            if (rowsAffected > 0) {
                response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?success=Book+deleted+successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?error=Book+not+found");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect with error message if deletion fails
            response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?error=Database+error+occurred");
        } finally {
            // Close resources
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If the request comes via POST, delegate to doGet
        doGet(request, response);
    }
}