<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xác nhận tài khoản</title>
</head>
<body>
    <h2>Xác nhận tài khoản</h2>

    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Xác thực thất bại! Tài khoản đã được xác thực hoặc đường link không hợp lệ.</p>
    <% } else { %>
        <p style="color: green;">Tài khoản đã được xác thực thành công! Bạn có thể <a href="login.jsp">đăng nhập</a> ngay bây giờ.</p>
    <% } %>
</body>
</html>
