package controller.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.Video;
import repository.VideoRepository;
import service.FavoritesService;
import service.Login.UserService;
import service.VideoService;
import util.XAuth;

import java.io.IOException;
import java.util.List;

@WebServlet("/favorites")
public class FavoritesVideo extends HttpServlet {

    private VideoService videoService;

    @Override
    public void init() throws ServletException {

        videoService = new VideoService();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("favoritesList",videoService.listVideoFavorites(XAuth.user));
        req.getRequestDispatcher("home/favorites").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
