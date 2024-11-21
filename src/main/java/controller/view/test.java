package controller.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/test")
public class test extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("test1.jsp").forward(req,resp);
    }
    //    public static void main(String[] args) {
//        Video video = new Video();
//        video.setId("VID002");
//        List<Favorite> favorites = new VideoRepository().findByID(video).getVideoFavorites().stream().toList();
//        favorites.getFirst();
//        System.out.println(favorites);
//
//    }
}
