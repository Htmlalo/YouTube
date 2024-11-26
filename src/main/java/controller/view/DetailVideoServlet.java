package controller.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Favorite;
import model.User;
import model.Video;
import repository.VideoRepository;
import service.FavoritesService;
import service.VideoService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;


@WebServlet({"/detailVideo", "/detailVideo/updateCount","/detailVideo/likeVideo"})
public class DetailVideoServlet extends HttpServlet {

    private VideoService videoService;
    private FavoritesService favoritesService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user = (User) req.getSession().getAttribute("account");
        String id = req.getParameter("videoFindId");
        List<Video> likedVideos = videoService.listVideoFavorites(user);
        if (user != null) {
            boolean isLiked = likedVideos.stream().anyMatch(v -> v.getId().equals(id));
            req.setAttribute("isLiked", isLiked);
        }

        if (id != null && !id.isEmpty()) {
            System.out.println(videoService.getVideoByID(id).getViewCount());

            req.setAttribute("video", videoService.getVideoByID(id));

        }
        req.getRequestDispatcher("/home/detailVideo?videoID=" + id).forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI().substring(req.getRequestURI().indexOf("/detailVideo") + "/detailVideo".length());
        String videoID = req.getParameter("videoId");
        if (path.contains("/updateCount")) {
            if (videoService.updateViewCountVideo(videoID)) {
                resp.setStatus(HttpServletResponse.SC_OK);
            } else {
                resp.setStatus(HttpServletResponse.SC_OK);
            }
        }
        if (path.contains("/likeVideo")) {
            User user = (User) req.getSession().getAttribute("account");
            boolean isLiked = videoService.listVideoFavorites(user).stream().anyMatch(v -> v.getId().equals(videoID));
            if (isLiked) {
                if (favoritesService.deleteFavorite(user, videoService.getVideoByID(videoID)) > 0) {
                    resp.setStatus(HttpServletResponse.SC_OK);
                }
            } else {
                favoritesService.save(new Favorite(0, user, Video.builder().id(videoID).build(), LocalDateTime.now()));
                resp.setStatus(HttpServletResponse.SC_OK);
            }
        }
    }

    @Override
    public void init() throws ServletException {
        videoService = new VideoService();
        favoritesService = new FavoritesService();
    }
}
