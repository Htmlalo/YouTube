package controller.view.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.FavoritesService;

import java.io.IOException;


@WebServlet("/mangeFavorites")
public class MangeFavoritesServlet extends HttpServlet {
    private FavoritesService favoritesService;

    @Override
    public void init() throws ServletException {
        favoritesService = new FavoritesService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listFavorites", favoritesService.getAllFavoriteVideo());
        req.getRequestDispatcher("/reportPage/favorites").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
