package controller.view.admin;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

@WebServlet("/manageUser")
@MultipartConfig
public class ManageUser extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("userList", userService.getAllUser());
        req.getRequestDispatcher("/admin/manageUser").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        JSONObject jsonObject = handUpdateUser(req);
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject jsonObject = handDeleteUser(req);
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }

    private JSONObject handUpdateUser(HttpServletRequest req) throws IOException {
        JSONObject jsonObject = new JSONObject();
        String userId = req.getParameter("userId");
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");
        String passWord = req.getParameter("passWord");
        boolean role = req.getParameter("activeAdmin").equals("true");
        User user = userService.getUserById(userId.trim());
        if (user == null) {
            jsonObject.put("success", false);
            jsonObject.put("message", "Không tìm thấy user");
            return jsonObject;
        }
        user.setFullName(fullName);
        if (passWord == null || passWord.isEmpty()) {
            user.setPassWord(user.getPassWord());
        } else {
            user.setPassWord(passWord);
        }
        user.setEmail(email);
        user.setAdmin(role);

        if (userService.updateAccount(user)) {
            jsonObject.put("success", true);
            jsonObject.put("message", "Cap nhat thanh cong");
        } else {
            jsonObject.put("success", false);
            jsonObject.put("message", "Cap nhat that bai");
            return jsonObject;
        }

        return jsonObject;
    }

    private JSONObject handDeleteUser(HttpServletRequest req) throws IOException {
        JSONObject jsonObject = new JSONObject();
        Map<String, Object> map = XJson.parseJsonToMap(req);
        String userId = (String) map.get("userId");
        if (userService.delete(userId)) {
            jsonObject.put("success", true);
            jsonObject.put("message", "Xoa user thanh cong");
        } else {
            jsonObject.put("success", false);
            jsonObject.put("message", "Xoa user that bai");
            return jsonObject;
        }
        return jsonObject;
    }


}
