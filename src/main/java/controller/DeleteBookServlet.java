package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.connectionDAO;
import model.BookDAO;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the bookId parameter
        String bookIdStr = request.getParameter("bookId");
        int bookId;

        // Validate bookId
        try {
            bookId = Integer.parseInt(bookIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?error=Invalid+book+ID");
            return;
        }

        Connection conn = null;
        try {
            conn = connectionDAO.getconn();
            BookDAO bookDAO = new BookDAO(conn);

            // Delete book using BookDAO
            boolean success = bookDAO.deleteBook(bookId);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?success=Book+deleted+successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?error=Book+not+found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/allBook.jsp?error=Database+error+occurred");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}