package controller.view.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import service.ShareService;
import service.VideoService;
import util.XJson;

import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet("/manageShare")
public class ManageShareServlet extends HttpServlet {
    private ShareService shareService;
    private VideoService videoService;

    @Override
    public void init() throws ServletException {
        shareService = new ShareService();
        videoService = new VideoService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Object[]> shareList = shareService.getShareByVideoTitle("");
        List<String> stringTitle = videoService.getAllVideoByTitle();
        req.setAttribute("stringTitle", stringTitle);
        req.setAttribute("shareList", shareList);
        req.getRequestDispatcher("/reportPage/share").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = XJson.parseJsonToMap(req);
        JSONObject jsonObject = new JSONObject();
        String videoTitle = (String) map.get("title");
        List<Object[]> shareList = shareService.getShareByVideoTitle(videoTitle);
        jsonObject.put("success", true);
        jsonObject.put("shareList", shareList);
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }
}
