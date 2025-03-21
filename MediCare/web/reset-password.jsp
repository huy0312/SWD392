<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String email = request.getParameter("email");
    if (email == null || email.isEmpty()) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="col-md-6 offset-md-3">
        <h3 class="text-center mb-4">Đặt lại mật khẩu</h3>

        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Mật khẩu không khớp hoặc không thể cập nhật!</div>
        <% } %>

        <form action="ResetPasswordController" method="post">
            <input type="hidden" name="email" value="<%= email %>">

            <div class="mb-3">
                <label>Mật khẩu mới:</label>
                <input type="password" class="form-control" name="newPassword" required>
            </div>

            <div class="mb-3">
                <label>Xác nhận mật khẩu:</label>
                <input type="password" class="form-control" name="confirmPassword" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Đặt lại mật khẩu</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
