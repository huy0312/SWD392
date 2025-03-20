<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
    <h2>Đăng nhập</h2>

    <% if (request.getParameter("error") != null) { 
        if (request.getParameter("error").equals("invalid")) { %>
            <p style="color: red;">Email hoặc mật khẩu không đúng!</p>
    <%  } else if (request.getParameter("error").equals("not_verified")) { %>
            <p style="color: red;">Tài khoản chưa được xác thực. Vui lòng kiểm tra email của bạn!</p>
    <%  } } %>

    <% if (request.getParameter("logout") != null) { %>
        <p style="color: green;">Bạn đã đăng xuất thành công.</p>
    <% } %>

    <form action="LoginController" method="post">
        <input type="hidden" name="action" value="login">
        <label>Email:</label>
        <input type="email" name="email" required><br>

        <label>Mật khẩu:</label>
        <input type="password" name="password" required><br>

        <button type="submit">Đăng nhập</button>
    </form>

    <p>Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
</body>
</html>
