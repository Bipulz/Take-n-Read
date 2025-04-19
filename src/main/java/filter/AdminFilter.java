package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import model.User;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
        throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null && "admin@gmail.com".equals(user.getEmail())) {
            chain.doFilter(req, res); // allow access
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    public void init(FilterConfig filterConfig) {}
    public void destroy() {}
}
