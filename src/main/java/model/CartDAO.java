package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private Connection conn;

    public CartDAO(Connection conn) {
        this.conn = conn;
    }

    // Add a new item to cart or update quantity if exists
    public boolean addToCart(Cart cart) throws SQLException {
        String checkSql = "SELECT cartID, quantity FROM cart WHERE userID = ? AND bookID = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setInt(1, cart.getUserId());
            checkStmt.setInt(2, cart.getBookId());
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    int cartId = rs.getInt("cartID");
                    int currentQuantity = rs.getInt("quantity");
                    int newQuantity = currentQuantity + cart.getQuantity();
                    double newTotalPrice = cart.getPrice() * newQuantity;
                    String updateSql = "UPDATE cart SET quantity = ?, total_price = ?, price = ? WHERE cartID = ?";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setInt(1, newQuantity);
                        updateStmt.setDouble(2, newTotalPrice);
                        updateStmt.setDouble(3, cart.getPrice());
                        updateStmt.setInt(4, cartId);
                        return updateStmt.executeUpdate() > 0;
                    }
                } else {
                    String insertSql = "INSERT INTO cart (userID, bookID, bookName, author, price, total_price, quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                        insertStmt.setInt(1, cart.getUserId());
                        insertStmt.setInt(2, cart.getBookId());
                        insertStmt.setString(3, cart.getBookName());
                        insertStmt.setString(4, cart.getAuthor());
                        insertStmt.setDouble(5, cart.getPrice());
                        insertStmt.setDouble(6, cart.getTotalPrice());
                        insertStmt.setInt(7, cart.getQuantity());
                        return insertStmt.executeUpdate() > 0;
                    }
                }
            }
        }
    }

    // Remove an item from cart
    public boolean removeFromCart(int cartId, int userId) throws SQLException {
        String sql = "DELETE FROM cart WHERE cartID = ? AND userID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.setInt(2, userId);
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    // Get all cart items for a user
    public List<Cart> getCartItems(int userId) throws SQLException {
        String sql = "SELECT * FROM cart WHERE userID = ?";
        List<Cart> cartItems = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    cartItems.add(new Cart(
                        rs.getInt("cartID"),
                        rs.getInt("bookID"),
                        rs.getInt("userID"),
                        rs.getString("bookName"),
                        rs.getString("author"),
                        rs.getDouble("price"),
                        rs.getDouble("total_price"),
                        rs.getInt("quantity")
                    ));
                }
            }
        }
        return cartItems;
    }

    // Clear all cart items for a user
    public boolean clearCart(int userId) throws SQLException {
        String sql = "DELETE FROM cart WHERE userID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }
}