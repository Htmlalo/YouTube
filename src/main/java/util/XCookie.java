package util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class XCookie {

    private static final String PATH = "/";
    private static final int DEFAULT_MAX_AGE = 30 * 24 * 60 * 60; // 30 days

    // Thêm cookie với giá trị đã mã hóa
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
        String encodedValue = URLEncoder.encode(value, StandardCharsets.UTF_8);
        Cookie cookie = new Cookie(name, encodedValue);
        cookie.setPath(PATH);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    // Thêm cookie với thời gian mặc định
    public static void addCookie(HttpServletResponse response, String name, String value) {
        addCookie(response, name, value, DEFAULT_MAX_AGE);
    }

    // Lấy giá trị cookie theo tên và giải mã nó
    public static Optional<String> getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (name.equals(cookie.getName())) {
                    return Optional.of(URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8));
                }
            }
        }
        return Optional.empty();
    }

    // Xóa cookie bằng cách thiết lập thời gian sống về 0
    public static void removeCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setPath(PATH);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

    // Cập nhật danh sách giá trị trong cookie
    public static void updateListCookie(HttpServletResponse response, HttpServletRequest request, String name, String value, int maxSize) {
        List<String> values = getListFromCookie(request, name);
        // Loại bỏ giá trị cũ nếu nó đã tồn tại
        values.remove(value);
        // Thêm giá trị mới vào đầu danh sách
        values.add(0, value);
        // Giới hạn số lượng giá trị theo maxSize
        if (values.size() > maxSize) {
            values = values.subList(0, maxSize);
        }
        // Gộp danh sách thành chuỗi và thêm vào cookie
        String joinedValues = String.join(",", values);
        addCookie(response, name, joinedValues);
    }

    // Lấy danh sách các giá trị từ cookie
    public static List<String> getListFromCookie(HttpServletRequest request, String name) {
        Optional<String> cookieValue = getCookie(request, name);
        // Nếu có giá trị cookie, tách nó thành danh sách
        if (cookieValue.isPresent()) {
            return new ArrayList<>(Arrays.asList(cookieValue.get().split(",")));
        }
        // Nếu không có giá trị, trả về danh sách rỗng
        return new ArrayList<>();
    }

    // Xóa danh sách các giá trị trong cookie
    public static void clearListCookie(HttpServletResponse response, String name) {
        removeCookie(response, name);
    }
}
