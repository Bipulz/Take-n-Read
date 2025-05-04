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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;
import model.connectionDAO;

@WebServlet("/sellBookServlet")
@MultipartConfig(maxFileSize = 10485760) 
public class SellBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("SellBookServlet: user from session = " + (user != null ? user.getEmail() : "null")); // Debug log

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Session expired, please log in again");
            return;
        }

        String userEmail = user.getEmail();

        // Prevent admin from selling books via this servlet
        if (userEmail.equals("admin@gmail.com")) {
            response.sendRedirect(request.getContextPath() + "/view/BookUtils/sellBook.jsp?error=Admins cannot sell books here");
            return;
        }

        // Get form parameters
        String bookName = request.getParameter("bookName");
        String authorName = request.getParameter("authorName");
        String bookCategory = request.getParameter("bookCategory");
        String priceStr = request.getParameter("price");
        Part photoPart = request.getPart("photo");

        // Validate required fields
        if (bookName == null || bookName.trim().isEmpty() ||
            authorName == null || authorName.trim().isEmpty() ||
            bookCategory == null || bookCategory.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty() ||
            photoPart == null || photoPart.getSize() == 0) {
            response.sendRedirect(request.getContextPath() + "/view/BookUtils/sellBook.jsp?error=All required fields must be filled");
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/view/BookUtils/sellBook.jsp?error=Invalid price format");
            return;
        }

        String photo = photoPart.getSubmittedFileName();
        if (photo == null || photo.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/view/BookUtils/sellBook.jsp?error=Photo upload failed");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connectionDAO.getconn();
            if (conn == null) {
                throw new SQLException("Failed to establish database connection");
            }

          
            String uploadPath = getServletContext().getRealPath("") + "img";
            java.io.File fileSaveDir = new java.io.File(uploadPath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            // Ensure unique filename to avoid overwriting
            String fileName = System.currentTimeMillis() + "_" + photo;
            photoPart.write(uploadPath + java.io.File.separator + fileName);

            // SQL query to insert book
            String sql = "INSERT INTO book (bookname, author, bookCategory, price, photo, user_email, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, bookName);
            stmt.setString(2, authorName);
            stmt.setString(3, bookCategory);
            stmt.setDouble(4, price);
            stmt.setString(5, fileName);
            stmt.setString(6, userEmail);
            stmt.setString(7, "pending");

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect(request.getContextPath() + "/view/BookUtils/sellBook.jsp?success=Book listed successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/view/BookUtils/sellBook.jsp?error=Failed to list book");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            String errorMessage = "Database error: " + e.getMessage() + " (SQLState: " + e.getSQLState() + ")";
            response.sendRedirect(request.getContextPath() + "/view/BookUtils/sellBook.jsp?error=" + java.net.URLEncoder.encode(errorMessage, "UTF-8"));
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