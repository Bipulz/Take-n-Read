package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDAO {
    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    // Insert an order into book_order
    public boolean insertOrder(Order order) throws SQLException {
        String sql = "INSERT INTO book_order (order_id, user_name, address, email, phone, book_name, author, price, payment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, order.getOrderId());
            stmt.setString(2, order.getUserName());
            stmt.setString(3, order.getAddress());
            stmt.setString(4, order.getEmail());
            stmt.setString(5, order.getPhone());
            stmt.setString(6, order.getBookName());
            stmt.setString(7, order.getAuthor());
            stmt.setDouble(8, order.getPrice());
            stmt.setString(9, order.getPayment());
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }
}