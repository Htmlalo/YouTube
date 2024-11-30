package controller.api;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebFilter({"/home/changAccount", "/home/changePassword", "/login", "/register","/home/favorites"})
public class GFGFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String s = request.getRequestURI();
        HttpSession session = request.getSession();

        if (s.contains("/login") || s.contains("/register")) {
            if (request.getSession().getAttribute("account") != null) {
                response.sendRedirect(request.getContextPath() + "/listVideo");
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
            return;
        }
        if (request.getSession().getAttribute("account") != null) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }

        if (s.contains("/home")) {
            String pages = s.substring(s.indexOf("/home"));
            session.setAttribute("recentPages", pages);
        }
    }
}
