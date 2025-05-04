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
import model.Cart;
import model.CartDAO;

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
        try {
            conn = connectionDAO.getconn();
            if (conn == null) {
                out.print("{\"success\": false, \"message\": \"Database connection failed\"}");
                out.flush();
                return;
            }

            // Fetch book details 
            String bookSql = "SELECT bookname, author, price FROM Book WHERE bookId = ? AND status = 'active'";
            try (PreparedStatement stmt = conn.prepareStatement(bookSql)) {
                stmt.setInt(1, bookId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (!rs.next()) {
                        out.print("{\"success\": false, \"message\": \"Book not found or inactive\"}");
                        out.flush();
                        return;
                    }
                    String bookName = rs.getString("bookname");
                    String author = rs.getString("author");
                    double price = rs.getDouble("price");
                    double totalPrice = price; 
                    int quantity = 1;

                    // Create Cart object and add to cart
                    Cart cart = new Cart(bookId, user.getId(), bookName, author, price, totalPrice, quantity);
                    CartDAO cartDAO = new CartDAO(conn);
                    boolean success = cartDAO.addToCart(cart);
                    if (success) {
                        out.print("{\"success\": true, \"message\": \"Book added to cart\"}");
                    } else {
                        out.print("{\"success\": false, \"message\": \"Failed to add book to cart\"}");
                    }
                    out.flush();
                }
            }
        } catch (SQLException e) {
            out.print("{\"success\": false, \"message\": \"Database error occurred: " + e.getMessage().replace("\"", "\\\"") + "\"}");
            out.flush();
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignore */ }
            out.close();
        }
    }
}