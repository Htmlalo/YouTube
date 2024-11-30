package controller.view.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/*")
public class HomeAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getRequestURL());
        String path = req.getRequestURI().substring(req.getRequestURI().indexOf("/admin") + "/admin".length());
        switch (path) {
            case "/manageVideo":
                req.setAttribute("pageAdmin", "/WebAdmin/ManageVideo.jsp");
                break;
            case "/manageUser":
                req.setAttribute("pageAdmin", "/WebAdmin/ManageUser.jsp");
                break;
            case "/mangeFavorites":
                req.setAttribute("pageAdmin", "/WebAdmin/ManageFavorites.jsp");
                break;
            case "/manageShare":
                req.setAttribute("pageAdmin", "/WebAdmin/ManageShare.jsp");
                break;
            case "/reportPage":
                req.setAttribute("pageAdmin", "/WebAdmin/ReportPage.jsp");
                break;
            default:
                req.setAttribute("pageAdmin", "/WebAdmin/DashboardPage.jsp");
                break;
        }
        req.getRequestDispatcher( "/WebAdmin/HomeAdmin.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
