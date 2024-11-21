package controller.view.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import org.json.JSONObject;
import service.Login.UserService;

import java.io.BufferedReader;
import java.io.IOException;

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
        User user = null;
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
        String fullName = jsonData.getString("fullName");
        String email = jsonData.getString("email");

        JSONObject responseJson = new JSONObject();
        if (userName.isEmpty() || password.isEmpty() || fullName.isEmpty() || email.isEmpty()) {
            responseJson.put("message", "Phải nhập đủ thông tin tài khoản");
        } else {
            user = new User(userName, password, email, fullName, false, null, null);
        }
        if (user != null) {

            if (!userService.checkAccount(userName)) {
                userService.save(user);
                responseJson.put("success", true);
                responseJson.put("message", "Đăng ký thành công");
            } else {
                responseJson.put("message", "Tai khoanr bi trung");
            }
        }


        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(responseJson.toString());
    }
}
