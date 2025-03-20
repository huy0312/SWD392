<%@ page import="Model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ</title>
</head>
<body>
    <h2>Chào mừng bạn đến WebMed!</h2>

    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
        } else {
    %>
        <p>Xin chào, <%= user.getName() %>!</p>
        <p>Email: <%= user.getEmail() %></p>
        <p>Vai trò: <%= user.getRole() %></p>
        <form action="LoginController" method="post">
    <input type="hidden" name="action" value="logout">
    <button type="submit">Đăng xuất</button>
</form>
    <% } %>
</body>
</html>
