package controller.view.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Video;
import org.json.JSONObject;
import service.VideoService;
import util.XJson;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet("/manageVideo")
@MultipartConfig
public class ManageVideo extends HttpServlet {
    private VideoService videoService;

    private static final String FILE_PATH = "/upload";

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

        String title = req.getParameter("title");
        String url = req.getParameter("url");
        String poster = req.getParameter("poster");
        String description = req.getParameter("description");
        boolean active = req.getParameter("active").equals("true");
        if (poster == null || poster.isEmpty()) {
            poster = saveFile(req, req.getPart("photo"));
        }
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
        String title = req.getParameter("title");
        String url = req.getParameter("url");
        String poster = req.getParameter("poster");
        String description = req.getParameter("description");
        boolean active = req.getParameter("active").equals("true");
        String videoID = req.getParameter("videoId");
        JSONObject jsonObject = new JSONObject();
        Video video = videoService.getVideoByID(videoID);
        video.setTitle(title);
        video.setUrl(url);
        video.setDescription(description);
        video.setActive(active);
        if (poster == null || poster.isEmpty()) {
            if ((poster=saveFile(req, req.getPart("photo")))!=null){
                video.setPoster(poster);
            }
        }
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

    private String saveFile(HttpServletRequest req, Part filePart) throws IOException, ServletException {
        try {
            filePart = req.getPart("photo");  // Lấy phần tử có tên là "photo"
            String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên file

            String uploadPath = getServletContext().getRealPath(FILE_PATH);
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            return FILE_PATH + "/" + fileName;
        } catch (IOException | ServletException e) {
            return null;
        }
    }
}
