package controller.view.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import service.FavoritesService;
import service.Login.UserService;
import service.VideoService;
import util.XJson;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/manageFavoriteUser")

public class ManageFavoriteUserServlet extends HttpServlet {

    private FavoritesService favoritesService;
    private VideoService videoService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("favoriteUserList", favoritesService.getAllFavoriteUserByTitle(""));
        req.setAttribute("stringTitle", videoService.getAllVideoByTitle());
        req.getRequestDispatcher("/reportPage/manageFavoriteUser").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = XJson.parseJsonToMap(req);
        JSONObject jsonObject = new JSONObject();
        String videoTitle = (String) map.get("title");
        List<Object[]> favoriteUserList = favoritesService.getAllFavoriteUserByTitle(videoTitle);
        jsonObject.put("success", true);
        jsonObject.put("favoriteUserList", favoriteUserList);
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }

    @Override
    public void init() throws ServletException {
       favoritesService = new FavoritesService();
       videoService = new VideoService();
    }
}
