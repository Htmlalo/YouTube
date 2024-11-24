package controller.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.VideoService;

import java.io.IOException;

@WebServlet("/favorites")
public class FavoritesVideo extends HttpServlet {

    private VideoService videoService;

    @Override
    public void init() throws ServletException {

        videoService = new VideoService();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("favoritesList",videoService.listVideoFavorites((User) req.getSession().getAttribute("account")));
        req.getRequestDispatcher("home/favorites").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
