<%@ page import="java.util.List" %>
<%@ page import="Model.Medication" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách thuốc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">💊 Danh sách thuốc</h2>
    <hr>

    <table class="table table-bordered table-hover mt-4">
        <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Tên thuốc</th>
                <th>Mô tả</th>
                <th>Giá (VNĐ)</th>
                <th>Số lượng tồn</th>
                <th>Ngày thêm</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Medication> meds = (List<Medication>) request.getAttribute("medications");
                if (meds != null) {
                    for (Medication med : meds) {
            %>
                <tr>
                    <td><%= med.getId() %></td>
                    <td><%= med.getName() %></td>
                    <td><%= med.getDescription() %></td>
                    <td><%= med.getPrice() %></td>
                    <td><%= med.getStockQuantity() %></td>
                    <td><%= med.getCreatedAt() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6" class="text-center">Không có dữ liệu thuốc.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
