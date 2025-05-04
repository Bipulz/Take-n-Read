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
import model.Order;
import model.Cart;
import model.OrderDAO;
import model.CartDAO;
import java.util.List;

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

            // Fetch all cart items for the user using CartDAO
            CartDAO cartDAO = new CartDAO(conn);
            List<Cart> cartItems = cartDAO.getCartItems(user.getId());

            // Check if cart is empty
            if (cartItems.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/view/order/cart.jsp?error=Cart+is+empty");
                return;
            }

            // Process each cart item into an order
            OrderDAO orderDAO = new OrderDAO(conn);
            for (Cart item : cartItems) {
                int cartId = item.getCartId();
                String bookName = item.getBookName();
                String author = item.getAuthor();
                double price = item.getPrice();
                int quantity = item.getQuantity();

                // Generate a simple order ID 
                String orderId = user.getId() + "-" + System.currentTimeMillis();

                // Insert into book_order using OrderDAO
                Order order = new Order(
                    orderId,
                    user.getName(),
                    user.getAddress(),
                    user.getEmail(),
                    user.getPhno(),
                    bookName,
                    author,
                    price * quantity, 
                    "Cash on Delivery"
                );
                orderDAO.insertOrder(order);
            }

            // Clear the cart using CartDAO
            cartDAO.clearCart(user.getId());

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