package controller;

import java.io.IOException;
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

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+to+place+an+order&redirectPage=" + java.net.URLEncoder.encode("/view/order/cart.jsp", "UTF-8"));
            return;
        }

        Connection conn = null;
        PreparedStatement cartStmt = null;
        PreparedStatement orderStmt = null;
        PreparedStatement deleteStmt = null;
        ResultSet rs = null;

        try {
            conn = connectionDAO.getconn();
            if (conn == null) {
                response.sendRedirect(request.getContextPath() + "/view/order/cart.jsp?error=Database+connection+failed");
                return;
            }

            conn.setAutoCommit(false);

            // Fetch all cart items for the user
            String cartSql = "SELECT * FROM cart WHERE userID = ?";
            cartStmt = conn.prepareStatement(cartSql);
            cartStmt.setInt(1, user.getId());
            rs = cartStmt.executeQuery();

            while (rs.next()) {
                int cartId = rs.getInt("cartID");
                String bookName = rs.getString("bookName");
                String author = rs.getString("author");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");

                // Generate a simple order ID (e.g., userID-timestamp)
                String orderId = user.getId() + "-" + System.currentTimeMillis();

                // Insert into book_order
                String orderSql = "INSERT INTO book_order (order_id, user_name, address, email, phone, book_name, author, price, payment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                orderStmt = conn.prepareStatement(orderSql);
                orderStmt.setString(1, orderId);
                orderStmt.setString(2, user.getName());
                orderStmt.setString(3, user.getAddress());
                orderStmt.setString(4, user.getEmail());
                orderStmt.setString(5, user.getPhno());
                orderStmt.setString(6, bookName);
                orderStmt.setString(7, author);
                orderStmt.setDouble(8, price * quantity); // Total price for this item
                orderStmt.setString(9, "Cash on Delivery"); // Hardcoded as per form
                orderStmt.executeUpdate();
            }

            // Clear the cart
            String deleteSql = "DELETE FROM cart WHERE userID = ?";
            deleteStmt = conn.prepareStatement(deleteSql);
            deleteStmt.setInt(1, user.getId());
            deleteStmt.executeUpdate();

            conn.commit();

            // Redirect to order success page
            response.sendRedirect(request.getContextPath() + "/view/order/orderSuccess.jsp");

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
            response.sendRedirect(request.getContextPath() + "/view/order/cart.jsp?error=Order+failed:+" + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* Ignore */ }
            if (cartStmt != null) try { cartStmt.close(); } catch (SQLException e) { /* Ignore */ }
            if (orderStmt != null) try { orderStmt.close(); } catch (SQLException e) { /* Ignore */ }
            if (deleteStmt != null) try { deleteStmt.close(); } catch (SQLException e) { /* Ignore */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignore */ }
        }
    }
}