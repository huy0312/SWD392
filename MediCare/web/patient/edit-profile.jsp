<%@ page import="Model.User, Model.Patient, Model.Doctor" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chỉnh sửa hồ sơ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Patient patient = null;
        Doctor doctor = null;

        if ("PATIENT".equals(user.getRole())) {
            patient = (Patient) session.getAttribute("patient");
        } else if ("DOCTOR".equals(user.getRole())) {
            doctor = (Doctor) session.getAttribute("doctor");
        }
    %>

    <div class="container mt-4">
        <h2>Chỉnh sửa hồ sơ</h2>
        <form action="ProfileController" method="post">
            <input type="hidden" name="userId" value="<%= user.getId() %>">

            <!-- Thông tin chung -->
            <div class="mb-3">
                <label>Tên:</label>
                <input type="text" class="form-control" name="name" value="<%= user.getName() %>" required>
            </div>

            <div class="mb-3">
                <label>Email:</label>
                <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" readonly>
            </div>

            <!-- Nếu là bệnh nhân -->
            <% if ("PATIENT".equals(user.getRole())) { %>
            <div class="mb-3">
                <label>Ngày sinh:</label>
                <input type="date" class="form-control" name="dateOfBirth" value="<%= patient != null ? patient.getDateOfBirth() : "" %>">
            </div>
            <div class="mb-3">
                <label>Địa chỉ:</label>
                <input type="text" class="form-control" name="address" value="<%= patient != null ? patient.getAddress() : "" %>">
            </div>
            <% } %>

            <!-- Nếu là bác sĩ -->
            <% if ("DOCTOR".equals(user.getRole())) { %>
            <div class="mb-3">
                <label>Chuyên môn:</label>
                <input type="text" class="form-control" name="specialization" value="<%= doctor != null ? doctor.getSpecialization() : "" %>">
            </div>
            <div class="mb-3">
                <label>Bệnh viện:</label>
                <input type="text" class="form-control" name="hospital" value="<%= doctor != null ? doctor.getHospital() : "" %>">
            </div>
            <% } %>

            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
