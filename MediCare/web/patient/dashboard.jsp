<%@ page import="Model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Trang chủ - WebMed</title>
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand fw-bold" href="#">WebMed</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="HealthAZServlet">Health A-Z</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="FinanceServlet">Finance</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="DrugServlet">Drug & Supplements</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="FeedbackServlet">Feedback</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AppointmentServlet">Book Appointment</a>
                        </li>

                        <!-- Nút "Sửa hồ sơ" CHỈ HIỂN THỊ nếu user là Patient -->
                        <% if ("PATIENT".equals(user.getRole())) { %>
                        <li class="nav-item">
                            <a class="nav-link text-warning fw-bold" href="<%= request.getContextPath() %>/PatientProfileController">
                                ✏️ Sửa hồ sơ
                            </a>

                        </li>
                        <% } %>

                        <!-- Nút Logout -->
                        <li class="nav-item">
                            <form action="<%= request.getContextPath() %>/LoginController" method="post">
                                <input type="hidden" name="action" value="logout">
                                <button type="submit" class="btn btn-danger ms-2">Đăng xuất</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Nội dung chính -->
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h2>Chào mừng bạn đến WebMed!</h2>
                    <p class="lead">Xin chào, <strong><%= user.getName() %></strong>!</p>
                    <p>Email: <%= user.getEmail() %></p>
                    <p>Vai trò: <%= user.getRole() %></p>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">Health A-Z</h5>
                            <p class="card-text">Tra cứu thông tin sức khỏe và bệnh lý.</p>
                            <a href="HealthAZServlet" class="btn btn-primary">Xem ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">Finance</h5>
                            <p class="card-text">Quản lý thanh toán và tài chính.</p>
                            <a href="FinanceServlet" class="btn btn-primary">Xem ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">💊 Danh sách thuốc</h5>
                            <p class="card-text">Xem thông tin thuốc hiện có trong hệ thống.</p>
                            <a href="<%= request.getContextPath() %>/MedicationController" class="btn btn-primary">Xem ngay</a>
                        </div>
                    </div>
                </div>


                <div class="row mt-4">
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Feedback</h5>
                                <p class="card-text">Gửi phản hồi về dịch vụ.</p>
                                <a href="FeedbackServlet" class="btn btn-primary">Gửi phản hồi</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Đặt lịch khám</h5>
                                <p class="card-text">Hẹn lịch với bác sĩ.</p>
                                <a href="AppointmentServlet" class="btn btn-primary">Đặt lịch</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
