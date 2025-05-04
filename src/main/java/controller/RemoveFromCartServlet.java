package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.connectionDAO;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String redirectPage = request.getParameter("redirectPage");
        if (redirectPage == null || redirectPage.trim().isEmpty()) {
            redirectPage = "/view/order/cart.jsp";
        }

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+to+modify+cart&redirectPage=" + java.net.URLEncoder.encode(redirectPage, "UTF-8"));
            return;
        }

        String cartIdStr = request.getParameter("cartId");
        int cartId;
        try {
            cartId = Integer.parseInt(cartIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + redirectPage + "?error=Invalid+cart+ID");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connectionDAO.getconn();
            if (conn == null) {
                response.sendRedirect(request.getContextPath() + redirectPage + "?error=Database+connection+failed");
                return;
            }

            String deleteSql = "DELETE FROM cart WHERE cartID = ? AND userID = ?";
            stmt = conn.prepareStatement(deleteSql);
            stmt.setInt(1, cartId);
            stmt.setInt(2, user.getId());
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected == 0) {
                response.sendRedirect(request.getContextPath() + redirectPage + "?error=Item+not+found+in+cart");
                return;
            }

            response.sendRedirect(request.getContextPath() + redirectPage + "?success=Item+removed+from+cart");
        } catch (SQLException e) {
            response.sendRedirect(request.getContextPath() + redirectPage + "?error=Database+error+occurred+" + e.getMessage().replace(" ", "+"));
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* Ignore */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignore */ }
        }
    }
}