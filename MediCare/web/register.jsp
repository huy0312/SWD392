<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký tài khoản</title>
</head>
<body>
    <h2>Đăng ký tài khoản</h2>
    
    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Email đã tồn tại hoặc có lỗi xảy ra!</p>
    <% } %>

    <form action="UserController" method="post">
        <input type="hidden" name="action" value="register">
        <label for="name">Họ và tên:</label>
        <input type="text" name="name" required>
        <br>

        <label for="email">Email:</label>
        <input type="email" name="email" required>
        <br>

        <label for="password">Mật khẩu:</label>
        <input type="password" name="password" required>
        <br>

        <button type="submit">Đăng ký</button>
    </form>

    <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
</body>
</html>
