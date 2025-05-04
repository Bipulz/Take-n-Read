package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO {
    private Connection conn;

    public BookDAO(Connection conn) {
        this.conn = conn;
    }

    // Add a new book (used by SellBookServlet and AdminAddBookServlet)
    public boolean addBook(Book book) throws SQLException {
        String sql = "INSERT INTO book (bookname, author, price, bookCategory, status, photo, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, book.getBookName());
            stmt.setString(2, book.getAuthor());
            stmt.setDouble(3, book.getPrice());
            stmt.setString(4, book.getBookCategory());
            stmt.setString(5, book.getStatus());
            stmt.setString(6, book.getPhoto() != null ? book.getPhoto() : null);
            stmt.setString(7, book.getUserEmail());
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    // Update an existing book (used by EditBookServlet)
    public boolean updateBook(Book book) throws SQLException {
        String sql = "UPDATE book SET bookname = ?, author = ?, price = ?, bookCategory = ?, status = ? WHERE bookId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, book.getBookName());
            stmt.setString(2, book.getAuthor());
            stmt.setDouble(3, book.getPrice());
            stmt.setString(4, book.getBookCategory());
            stmt.setString(5, book.getStatus());
            stmt.setInt(6, book.getBookId());
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    // Delete a book by bookId (used by DeleteBookServlet)
    public boolean deleteBook(int bookId) throws SQLException {
        String sql = "DELETE FROM book WHERE bookId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookId);
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    // Check book owner by bookId (used by EditBookServlet)
    public String getBookOwnerEmail(int bookId) throws SQLException {
        String sql = "SELECT user_email FROM book WHERE bookId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("user_email");
                }
                return null;
            }
        }
    }
}