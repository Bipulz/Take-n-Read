package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Clear session
        }

        // Clear "Remember Me" cookies
        Cookie emailCookie = new Cookie("userEmail", "");
        Cookie tokenCookie = new Cookie("loginToken", "");
        emailCookie.setMaxAge(0);
        tokenCookie.setMaxAge(0);
        response.addCookie(emailCookie);
        response.addCookie(tokenCookie);

        response.sendRedirect("login.jsp");
    }
}