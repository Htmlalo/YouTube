package controller.view.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import org.json.JSONObject;
import service.Login.UserService;
import util.XJson;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {

        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/Login/Register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        JSONObject responseJson = registerAccount(req, resp);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(responseJson.toString());
    }


    private JSONObject registerAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JSONObject responseJson = new JSONObject();
        Map<String, Object> map = XJson.parseJsonToMap(req);
        String userName = map.get("username").toString().trim();
        String password = map.get("password").toString().trim();
        String fullName = map.get("fullName").toString().trim();
        String email = map.get("email").toString().trim();
        if (!isInputValid(userName, password, fullName, email)) {
            responseJson.put("message", "Phải nhập đủ thông tin tài khoản");
        } else if (userService.checkAccount(userName)) {
            responseJson.put("message", "Tai khoản bi trung");
        } else {
            userService.save(new User(userName, password, email, fullName, false, null, null));
            responseJson.put("success", true);
            responseJson.put("message", "Đăng ký thành công");
        }
        return responseJson;
    }

    private boolean isInputValid(String... inputs) {
        for (String input : inputs) {
            if (input == null || input.trim().isEmpty()) {
                return false;
            }
        }
        return true;
    }

}
