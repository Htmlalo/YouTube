package controller.view.Login;

import controller.view.HomeServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import org.json.JSONObject;
import service.Login.UserService;
import util.XJson;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

@WebServlet("/login")
public class LoginServlet extends HomeServlet {
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        JSONObject responseJson = checkLogin(req);


        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(responseJson.toString());

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        if (username != null && !username.isEmpty()) {
            req.setAttribute("username", username);
        }
        req.getRequestDispatcher("/Login/Login.jsp").forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    public JSONObject checkLogin(HttpServletRequest req) throws IOException {
        Map<String, Object> map = XJson.parseJsonToMap(req);
        HttpSession session = req.getSession();
        JSONObject responseJson = new JSONObject();
        String userName = (String) map.get("username");
        String password = (String) map.get("password");
        User user = userService.checkLogin(userName, password);
        if (user != null) {
            if (user.getId().equals(userName) && !user.getPassWord().equals(password)) {
                responseJson.put("success", false);
                responseJson.put("message", "Sai mật khẩu");
            }
            if (user.getId().equals(userName.trim()) && user.getPassWord().equals(password)) {
                responseJson.put("success", true);
                session.setAttribute("account", user);
                responseJson.put("message", "Đăng nhập thành công");
                String pages = (String) req.getSession().getAttribute("recentPages");
                if (pages != null) {
                    responseJson.put("pages", pages);
                    session.removeAttribute("recentPages");
                } else {
                    responseJson.put("pages", "/listVideo");
                }
            }
        }
        if (user == null) {
            responseJson.put("success", false);
            responseJson.put("message", "Tai khoản không tồn tại");
        }

        return responseJson;
    }
}
