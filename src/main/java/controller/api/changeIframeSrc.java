package controller.api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/changeIframeSrc")
public class changeIframeSrc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newSrc = req.getParameter("iframeId").substring(1);
        resp.setContentType("application/json");
        resp.getWriter().write("{\"src\": \"" + newSrc + "\"}");
    }
}
