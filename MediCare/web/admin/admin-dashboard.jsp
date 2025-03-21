<%@ page import="Model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - WebMed</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendRedirect("../login.jsp");
            return;
        }
    %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <div class="container">
            <a class="navbar-brand" href="#">Admin - WebMed</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="ManageUsersServlet">Quản lý người dùng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ManageDoctorsServlet">Quản lý bác sĩ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewReportsServlet">Xem báo cáo</a>
                    </li>
                    <li class="nav-item">
                        <form action="../LoginController" method="post" class="d-inline">
                            <input type="hidden" name="action" value="logout">
                            <button type="submit" class="btn btn-warning">Đăng xuất</button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Xin chào, <%= user.getName() %> (Admin)!</h2>
        <p>Email: <%= user.getEmail() %></p>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Quản lý người dùng</h5>
                        <p class="card-text">Thêm, xóa, sửa tài khoản người dùng.</p>
                        <a href="ManageUsersServlet" class="btn btn-danger">Xem ngay</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Quản lý bác sĩ</h5>
                        <p class="card-text">Thêm, sửa thông tin bác sĩ.</p>
                        <a href="ManageDoctorsServlet" class="btn btn-danger">Xem ngay</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Xem báo cáo</h5>
                        <p class="card-text">Thống kê người dùng, hoạt động hệ thống.</p>
                        <a href="ViewReportsServlet" class="btn btn-danger">Xem ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
