package controller.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Video;
import repository.VideoRepository;

import java.io.IOException;


@WebServlet("/detailVideo")
public class DetailVideoServlet extends HttpServlet {

    private static VideoRepository videoRepository;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("videoFindId");
        if (id != null && !id.isEmpty()) {
            System.out.println(videoRepository.findById(id).getDescription());
            req.setAttribute("video", videoRepository.findById(id));
        }

        req.getRequestDispatcher("/home/detailVideo?videoID=" + id).forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init() throws ServletException {
        videoRepository = new VideoRepository();
    }
}
