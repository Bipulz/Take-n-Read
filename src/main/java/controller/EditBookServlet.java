package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.connectionDAO;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/EditBookServlet")
@MultipartConfig
public class EditBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String bookIdStr = request.getParameter("bookId");
        String bookName = request.getParameter("bookName");
        String authorName = request.getParameter("authorName");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");
        String status = request.getParameter("status");

        // Validate parameters
        int bookId;
        double price;
        try {
            bookId = Integer.parseInt(bookIdStr);
            price = Double.parseDouble(priceStr);
            if (bookName == null || bookName.trim().isEmpty() || authorName == null || authorName.trim().isEmpty()) {
                response.sendRedirect("admin/allBook.jsp?error=Book+name+and+author+name+are+required");
                return;
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("admin/allBook.jsp?error=Invalid+book+ID+or+price");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = connectionDAO.getconn();
           
            String checkSql = "SELECT user_email FROM book WHERE bookId = ?";
            stmt = conn.prepareStatement(checkSql);
            stmt.setInt(1, bookId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                String userEmail = rs.getString("user_email");
                if (!"admin@gmail.com".equals(userEmail)) {
                    response.sendRedirect("admin/allBook.jsp?error=Only+admin+can+edit+this+book");
                    return;
                }
            } else {
                response.sendRedirect("admin/allBook.jsp?error=Book+not+found");
                return;
            }
            rs.close();
            stmt.close();

            // Update the book
            String updateSql = "UPDATE book SET bookname = ?, author = ?, price = ?, bookCategory = ?, status = ? WHERE bookId = ?";
            stmt = conn.prepareStatement(updateSql);
            stmt.setString(1, bookName);
            stmt.setString(2, authorName);
            stmt.setDouble(3, price);
            stmt.setString(4, category != null && !category.isEmpty() ? category : null);
            stmt.setString(5, status != null && !status.isEmpty() ? status : null);
            stmt.setInt(6, bookId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("admin/allBook.jsp?success=Book+updated+successfully");
            } else {
                response.sendRedirect("admin/allBook.jsp?error=Failed+to+update+book");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("admin/allBook.jsp?error=Database+error+occurred");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

   

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect("admin/allBook.jsp");
    }
}