package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter("/view/*")
public class UserFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String userEmail = (session != null) ? (String) session.getAttribute("user_email") : null;

        if (userEmail == null || !"admin@gmail.com".equals(userEmail)) {
            chain.doFilter(req, res); // Allow non-admin access
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/home.jsp");
        }
    }

    public void init(FilterConfig filterConfig) {}
    public void destroy() {}
}