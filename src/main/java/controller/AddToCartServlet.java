package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.connectionDAO;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+to+add+to+cart&redirectPage=" + java.net.URLEncoder.encode("/view/BookUtils/newbook.jsp", "UTF-8"));
            return;
        }

        String bookIdStr = request.getParameter("bookId");
        int bookId;
        try {
            bookId = Integer.parseInt(bookIdStr);
        } catch (NumberFormatException e) {
            out.print("{\"success\": false, \"message\": \"Invalid book ID\"}");
            out.flush();
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = connectionDAO.getconn();
            if (conn == null) {
                out.print("{\"success\": false, \"message\": \"Database connection failed\"}");
                out.flush();
                return;
            }

            String bookSql = "SELECT bookname, author, price FROM Book WHERE bookId = ? AND status = 'active'";
            stmt = conn.prepareStatement(bookSql);
            stmt.setInt(1, bookId);
            rs = stmt.executeQuery();
            if (!rs.next()) {
                out.print("{\"success\": false, \"message\": \"Book not found or inactive\"}");
                out.flush();
                return;
            }
            String bookName = rs.getString("bookname");
            String author = rs.getString("author");
            double price = rs.getDouble("price");
            rs.close();
            stmt.close();

            String checkCartSql = "SELECT cartID, quantity FROM cart WHERE userID = ? AND bookID = ?";
            stmt = conn.prepareStatement(checkCartSql);
            stmt.setInt(1, user.getId());
            stmt.setInt(2, bookId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                int cartId = rs.getInt("cartID");
                int currentQuantity = rs.getInt("quantity");
                int newQuantity = currentQuantity + 1;
                double newTotalPrice = price * newQuantity;
                String updateSql = "UPDATE cart SET quantity = ?, total_price = ?, price = ? WHERE cartID = ?";
                stmt = conn.prepareStatement(updateSql);
                stmt.setInt(1, newQuantity);
                stmt.setDouble(2, newTotalPrice);
                stmt.setDouble(3, price);
                stmt.setInt(4, cartId);
                stmt.executeUpdate();
            } else {
                double totalPrice = price;
                String insertSql = "INSERT INTO cart (userID, bookID, bookName, author, price, total_price, quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertSql);
                stmt.setInt(1, user.getId());
                stmt.setInt(2, bookId);
                stmt.setString(3, bookName);
                stmt.setString(4, author);
                stmt.setDouble(5, price);
                stmt.setDouble(6, totalPrice);
                stmt.setInt(7, 1);
                stmt.executeUpdate();
            }

            out.print("{\"success\": true, \"message\": \"Book added to cart\"}");
            out.flush();
        } catch (SQLException e) {
            out.print("{\"success\": false, \"message\": \"Database error occurred: " + e.getMessage().replace("\"", "\\\"") + "\"}");
            out.flush();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* Ignore */ }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* Ignore */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignore */ }
            out.close();
        }
    }
}