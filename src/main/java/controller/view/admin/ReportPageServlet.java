package controller.view.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/reportPage/*")
public class ReportPageServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI().substring(req.getRequestURI().indexOf("/reportPage") + "/reportPage".length());

        switch (path) {
            case "/favorites":
                req.setAttribute("pageReport", "/WebAdmin/ManageFavorites.jsp");
                break;
            case "/share":
                req.setAttribute("pageReport", "/WebAdmin/ManageShare.jsp");
                break;
            case "/manageFavoriteUser":
                req.setAttribute("pageReport", "/WebAdmin/ManageFavoriteUser.jsp");
                    break;
            default:
                req.setAttribute("pageReport", "/WebAdmin/ManageFavorites.jsp");
                break;
        }
        req.getRequestDispatcher("/admin/reportPage").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
