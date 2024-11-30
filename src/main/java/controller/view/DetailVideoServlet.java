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
import util.XCookie;
import util.XTime;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet({"/detailVideo", "/detailVideo/updateCount", "/detailVideo/likeVideo"})
public class DetailVideoServlet extends HttpServlet {

    private VideoService videoService;
    private FavoritesService favoritesService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user = (User) req.getSession().getAttribute("account");
        String id = req.getParameter("videoFindId");
        Video videoById = null;
        if (id != null && !id.isEmpty()) {
            videoById = videoService.getVideoByID(id);
            req.setAttribute("listDays", convertDayOfWeek(id, videoById.getPostedDate()));

        }
        List<Video> likedVideos = videoService.listVideoFavorites(user);
        if (user != null) {
            boolean isLiked = likedVideos.stream().anyMatch(v -> v.getId().equals(id));
            req.setAttribute("isLiked", isLiked);
        }

        req.setAttribute("video", videoById);
        req.setAttribute("recentVideos", recentVideos(req, resp, id));
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


    private List<Video> recentVideos(HttpServletRequest req, HttpServletResponse resp, String id) {
        List<String> recentVideosId = XCookie.getListFromCookie(req, "recentVideos");
        if (recentVideosId.isEmpty()) {
            XCookie.addCookie(resp, "recentVideos", id, -1);
        }
        List<String> recentVideos = XCookie.getListFromCookie(req, "recentVideos");
        List<Video> recentVideoList = new ArrayList<>();
        for (String videoId : recentVideos) {
            if (!videoId.equals(id)) {
                recentVideoList.add(videoService.getVideoByID(videoId));
            }
        }
        XCookie.updateListCookie(resp, req, "recentVideos", id, 5);
        return recentVideoList;
    }

    private Map<String, String> convertDayOfWeek(String id, LocalDateTime time) {
        Map<String, String> listDays = new HashMap<>();
        listDays.put(id, XTime.convertDateToDateNow(time));
        return listDays;
    }

    @Override
    public void init() throws ServletException {
        videoService = new VideoService();
        favoritesService = new FavoritesService();
    }
}
