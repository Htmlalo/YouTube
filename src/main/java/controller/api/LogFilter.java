package controller.api;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import model.Logs;
import repository.LogsRepository;
import util.XAuth;

import java.io.IOException;
import java.time.LocalDateTime;

@WebFilter("/*")
public class LogFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("UTF-8");
        if (XAuth.user != null) {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            new LogsRepository().save(new Logs(0, request.getRequestURI(), LocalDateTime.now(), XAuth.user.getId()));
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
