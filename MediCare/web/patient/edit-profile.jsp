<%@ page import="Model.Patient" %>
<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    Patient patient = (Patient) request.getAttribute("patient");

    if (user == null || patient == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa hồ sơ bệnh nhân</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h3>Chỉnh sửa hồ sơ cá nhân</h3>

    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger">Có lỗi xảy ra khi cập nhật!</div>
    <% } %>

    <form action="<%= request.getContextPath() %>/PatientProfileController" method="post">
        <div class="mb-3">
            <label>Họ tên:</label>
            <input type="text" class="form-control" name="name" value="<%= user.getName() %>" required>
        </div>

        <div class="mb-3">
            <label>Ngày sinh:</label>
            <input type="date" class="form-control" name="dateOfBirth" value="<%= patient.getDateOfBirth() %>" required>
        </div>

        <div class="mb-3">
            <label>Số điện thoại:</label>
            <input type="text" class="form-control" name="phone" value="<%= patient.getPhone() %>" required>
        </div>

        <div class="mb-3">
            <label>Địa chỉ:</label>
            <input type="text" class="form-control" name="address" value="<%= patient.getAddress() %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="<%= request.getContextPath() %>/patient/dashboard.jsp" class="btn btn-secondary">Quay lại</a>
    </form>
</div>
</body>
</html>
