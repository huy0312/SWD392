<%@ page import="Model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Doctor Dashboard - WebMed</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");
        if (user == null || !"DOCTOR".equals(user.getRole())) {
            response.sendRedirect("../login.jsp");
            return;
        }
    %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container">
            <a class="navbar-brand" href="#">Doctor - WebMed</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="ViewAppointmentsServlet">Quản lý lịch hẹn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PatientRecordsServlet">Hồ sơ bệnh nhân</a>
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
        <h2>Xin chào, <%= user.getName() %> (Bác sĩ)!</h2>
        <p>Email: <%= user.getEmail() %></p>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Lịch hẹn</h5>
                        <p class="card-text">Quản lý lịch khám bệnh nhân.</p>
                        <a href="ViewAppointmentsServlet" class="btn btn-success">Xem ngay</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Hồ sơ bệnh nhân</h5>
                        <p class="card-text">Xem, chỉnh sửa thông tin bệnh nhân.</p>
                        <a href="PatientRecordsServlet" class="btn btn-success">Xem ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
