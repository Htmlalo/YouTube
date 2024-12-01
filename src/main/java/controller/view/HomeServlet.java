package controller.view;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.VideoRepository;

import java.io.IOException;

@WebServlet("/home/*")
public class HomeServlet extends HttpServlet {




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI().substring(req.getRequestURI().indexOf("/home") + "/home".length());
        switch (path) {
            case "/changeAccount":
                req.setAttribute("pages", "/ChangAccount.jsp");
                break;
            case "/changePassword":
                req.setAttribute("pages", "/Login/ChangePassword.jsp");
                break;
            case "/detailVideo":
                req.setAttribute("pages", "detailVideo.jsp");
                break;
            case "/forgotPassword":
                req.setAttribute("pages", "/Login/ForgotPassword.jsp");
                break;
            case "/favorites":
                req.setAttribute("pages", "favoritesVideo.jsp");
                break;
            default:
                req.setAttribute("pages", "listVideo.jsp");
                break;
        }
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}

