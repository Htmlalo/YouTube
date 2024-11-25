package controller.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Video;
import repository.VideoRepository;
import service.VideoService;

import java.io.IOException;


@WebServlet({"/detailVideo", "/detailVideo/updateCount"})
public class DetailVideoServlet extends HttpServlet {

    private VideoService videoService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("videoFindId");
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

    }

    @Override
    public void init() throws ServletException {
        videoService = new VideoService();
    }
}
