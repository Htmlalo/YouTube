package controller.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Video;
import service.VideoService;
import util.XTime;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/listVideo")
public class ListVideoServlet extends HttpServlet {
    private static VideoService videoService;
    private static final int pageSize = 8;

    @Override
    public void init() throws ServletException {
        videoService = new VideoService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sizePage = videoService.getTotalVideoCount(pageSize);

        int page = 1;

        String pageStr = req.getParameter("page");

        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException ignored) {
            }
        }

        Map<Integer, List<Video>> listMap = videoService.getVideoToPages(page - 1, pageSize);
        if (page < 1) page = 1;
        if (page > sizePage) page = sizePage;
        Map<String, String> listDays = new HashMap<>();

        for (Video video : listMap.get(page - 1)) {
            listDays.put(video.getId(), XTime.convertDateToDateNow(video.getPostedDate()));
        }


        req.setAttribute("currentPage", page);
        req.setAttribute("listVideos", listMap.get(page - 1));
        req.setAttribute("totalPages", sizePage);
        req.setAttribute("listDays", listDays);
        req.getRequestDispatcher("/home/listVideo").forward(req, resp);

    }
}
