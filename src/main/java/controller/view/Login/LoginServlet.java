package controller.view.Login;

import controller.view.HomeServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import netscape.javascript.JSObject;
import org.json.HTTP;
import org.json.JSONObject;
import service.Login.UserService;
import util.XAuth;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HomeServlet {
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringBuffer sb = new StringBuffer();
        try (BufferedReader reader = req.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        JSONObject jsonData = new JSONObject(sb.toString());
        String userName = jsonData.getString("username");
        String password = jsonData.getString("password");

        JSONObject responseJson = checkLogin(userName, password, req);


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

    public JSONObject checkLogin(String userName, String password, HttpServletRequest req) {
        HttpSession session = req.getSession();
        JSONObject responseJson = new JSONObject();
        User user = userService.checkLogin(userName, password);
        if (user != null) {

            if (user.getId().equals(userName) && !user.getPassWord().equals(password)) {
                responseJson.put("success", false);
                responseJson.put("message", "Sai mật khẩu");
            }
            if (user.getId().equals(userName.trim()) && user.getPassWord().equals(password)) {
                responseJson.put("success", true);
                XAuth.user = user;
                session.setAttribute("account", user);
                responseJson.put("message", "Đăng nhập thành công");
                String pages = (String) req.getSession().getAttribute("recentPages");
                if (pages != null) {
                    responseJson.put("pages", pages);
//                    session.setAttribute("recentPages", null);
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
