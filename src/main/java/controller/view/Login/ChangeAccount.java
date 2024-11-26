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

@WebServlet("/changeAccount")
public class ChangeAccount extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/home/changeAccount").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject jsonObject = updateUser(req);
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());

    }


    private JSONObject updateUser(HttpServletRequest req) throws IOException {
        Map<String, Object> map = XJson.parseJsonToMap(req);
        JSONObject jsonObject = new JSONObject();
        User user = (User) req.getSession().getAttribute("account");
        String id = map.get("username").toString();
        String fullName = map.get("fullname").toString();
        String email = map.get("email").toString();
        String passWord = map.get("password").toString();
        if (passWord == null || passWord.isEmpty()) {
            passWord = user.getPassWord();
        }
        if (userService.checkAccount(id) && userService.getUserById(id).getId().equals(user.getId())) {
            user.setFullName(fullName);
            user.setPassWord(passWord);
            user.setEmail(email);
            if (userService.updateAccount(user)) {
                jsonObject.put("success", true);
                jsonObject.put("message", "Cập nhập tài khoản thành công");
                req.getSession().setAttribute("account", user);
            } else {
                jsonObject.put("success", false);
                jsonObject.put("message", "Cập nhập tài khoa thất bại");
            }
        } else {
            jsonObject.put("success", false);
            jsonObject.put("message", "Bị lỗi Vui lòng load lại trang");
        }


        return jsonObject;

    }

}
