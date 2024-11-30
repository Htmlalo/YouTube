package controller.view.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Video;
import org.json.JSONObject;
import service.VideoService;
import util.XJson;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet("/manageVideo")
public class ManageVideo extends HttpServlet {
    private VideoService videoService;

    @Override
    public void init() throws ServletException {
        videoService = new VideoService();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Video> videosList = videoService.getAllVideo();
        req.setAttribute("videosList", videosList);
        req.getRequestDispatcher("/admin/manageVideo").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = XJson.parseJsonToMap(req);
        String title = (String) map.get("title");
        String url = (String) map.get("url");
        String poster = (String) map.get("poster");
        String description = (String) map.get("description");
        boolean active = map.get("active").equals("true");
        JSONObject jsonObject = new JSONObject();
        Video video = Video.builder()
                .id(UUID.randomUUID().toString())
                .title(title)
                .poster(poster)
                .url(url)
                .description(description)
                .postedDate(LocalDateTime.now())
                .active(active)
                .viewCount(0)
                .build();
        if (videoService.save(video)) {
            jsonObject.put("success", true);
            jsonObject.put("message", "Thêm video thành công");
        } else {
            jsonObject.put("success", false);
            jsonObject.put("message", "Thêm video thất bai");
        }

        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = XJson.parseJsonToMap(req);
        String title = (String) map.get("title");
        String url = (String) map.get("url");
        String poster = (String) map.get("poster");
        String description = (String) map.get("description");
        boolean active = map.get("active").equals("true");
        String videoID = (String) map.get("videoId");
        JSONObject jsonObject = new JSONObject();
        Video video = videoService.getVideoByID(videoID);
        video.setTitle(title);
        video.setUrl(url);
        video.setPoster(poster);
        video.setDescription(description);
        video.setActive(active);

        if (videoService.update(video)) {
            jsonObject.put("success", true);
            jsonObject.put("message", "Cập nhật video thành công");
        } else {
            jsonObject.put("success", false);
            jsonObject.put("message", "Cập nhật video thất bai");
        }

        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = XJson.parseJsonToMap(req);
        String videoID = (String) map.get("videoId");
        JSONObject jsonObject = new JSONObject();
        if (videoService.delete(videoID)) {
            jsonObject.put("success", true);
            jsonObject.put("message", "Xoa video thanh cong");
        } else {
            jsonObject.put("success", false);
            jsonObject.put("message", "Xoa video that bai");
        }
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }
}
