package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.connectionDAO;

@WebServlet("/AdminAddBookServlet")
@MultipartConfig(maxFileSize = 10485760) 
public class AdminAddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String bookName = request.getParameter("bookName");
        String authorName = request.getParameter("authorName");
        String priceStr = request.getParameter("price");
        String bookCategory = request.getParameter("category");
        String status = request.getParameter("status");
        Part photoPart = request.getPart("photo");

        // Validate required fields
        if (bookName == null || bookName.trim().isEmpty() ||
            authorName == null || authorName.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty() ||
            photoPart == null || photoPart.getSize() == 0) {
            response.sendRedirect(request.getContextPath() + "/admin/addbook.jsp?error=All required fields must be filled");
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/addbook.jsp?error=Invalid price format");
            return;
        }

        String photo = photoPart.getSubmittedFileName();
        if (photo == null || photo.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/addbook.jsp?error=Photo upload failed");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connectionDAO.getconn();
            if (conn == null) {
                throw new SQLException("Failed to establish database connection");
            }

            // Save file to img directory within WebContent
            String uploadPath = getServletContext().getRealPath("") + "img";
            java.io.File fileSaveDir = new java.io.File(uploadPath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            // Ensure unique filename to avoid overwriting
            String fileName = System.currentTimeMillis() + "_" + photo;
            photoPart.write(uploadPath + java.io.File.separator + fileName);

            // SQL query to insert book
            String sql = "INSERT INTO book (bookname, author, price, bookCategory, status, photo, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, bookName);
            stmt.setString(2, authorName);
            stmt.setDouble(3, price);
            stmt.setString(4, bookCategory != null ? bookCategory : "uncategorized");
            stmt.setString(5, status != null ? status : "active");
            stmt.setString(6, fileName);
            stmt.setString(7, "admin@gmail.com");

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect(request.getContextPath() + "/admin/addbook.jsp?success=Book added successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/addbook.jsp?error=Failed to add book to database");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            String errorMessage = "Database error: " + e.getMessage() + " (SQLState: " + e.getSQLState() + ")";
            response.sendRedirect(request.getContextPath() + "/admin/addbook.jsp?error=" + java.net.URLEncoder.encode(errorMessage, "UTF-8"));
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}