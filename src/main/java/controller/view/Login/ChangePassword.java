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

import java.io.IOException;
import java.util.Map;

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/home/changePassword").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        JSONObject jsonObject = changePassword(req);
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }


    private JSONObject changePassword(HttpServletRequest req) throws IOException {
        JSONObject jsonObject = new JSONObject();
        Map<String, Object> map = XJson.parseJsonToMap(req);

        String username = (String) map.get("username");
        String currentPass = (String) map.get("currentPassword");
        String newPass = (String) map.get("newPassword");
        String confirmPass = (String) map.get("confirmPassword");

        User user = (User) req.getSession().getAttribute("account");

        if (username == null || username.isEmpty() || user == null) {
            jsonObject.put("message", "Tên đăng nhập không được để trống");
            return jsonObject;
        }

        if (!userService.checkAccount(username) || !userService.getUserById(username).getId().equals(username)) {
            jsonObject.put("message", "Tài khoản không tồn tại hoặc không khớp");
            return jsonObject;
        }

        if (currentPass.isEmpty() || newPass.isEmpty() || confirmPass.isEmpty()) {
            jsonObject.put("message", "Các trường không được để trống");
            return jsonObject;
        }

        if (!currentPass.equals(user.getPassWord())) {
            jsonObject.put("message", "Mật khẩu hiện tại không đúng");
            return jsonObject;
        }

        if (currentPass.equals(newPass)) {
            jsonObject.put("message", "Mật khẩu mới không được trùng với mật khẩu hiện tại");
            return jsonObject;
        }

        if (!confirmPass.equals(newPass)) {
            jsonObject.put("message", "Xác nhận mật khẩu không khớp");
            return jsonObject;
        }

        user.setPassWord(newPass);
        if (userService.updateAccount(user)) {
            jsonObject.put("success", true);
            jsonObject.put("message", "Thay đổi mật khẩu thành công");
            req.getSession().setAttribute("account", user);
        } else {
            jsonObject.put("message", "Thay đổi mật khẩu thất bại");
        }

        return jsonObject;
    }
}
