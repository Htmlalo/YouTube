<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Get JSP Filename</title>
</head>
<body>

<h1>Trang JSP hiện tại</h1>
<h2><%=request.getServletPath()%>
</h2>
</body>

<!-- Đưa tên file JSP vào một biến JavaScript -->
<script>
    // Lấy đường dẫn của file JSP từ server
    const currentJspFile = "<%= request.getServletPath() %>";

    // Hiển thị tên file trong console hoặc bạn có thể sử dụng ở nơi khác
    console.log("Tên file JSP hiện tại:", currentJspFile);
</script>
</body>
</html>
