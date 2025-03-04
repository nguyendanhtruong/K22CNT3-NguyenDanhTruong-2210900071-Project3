<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thống kê hệ thống</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        h2 {
            text-align: center;
        }
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<h2>Thống kê hệ thống</h2>
<table>
    <tr>
        <th>Chỉ số</th>
        <th>Giá trị</th>
    </tr>
    <tr>
        <td>Tổng số phòng</td>
        <td>${tongSoPhong}</td>
    </tr>
    <tr>
        <td>Số phòng trống</td>
        <td>${soPhongTrong}</td>
    </tr>
    <tr>
        <td>Số phòng đã thuê</td>
        <td>${soPhongDaThue}</td>
    </tr>
    <tr>
        <td>Tổng số khách thuê</td>
        <td>${tongKhachThue}</td>
    </tr>
    <tr>
        <td>Tổng doanh thu</td>
        <td>${doanhThu} VNĐ</td>
    </tr>
</table>
<div class="container">
    <a href="${pageContext.request.contextPath}/admin" class="btn">Quay lại Admin</a>
</div>
</body>
</html>
