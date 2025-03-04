<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            text-align: center;
        }
        .card {
            display: inline-block;
            width: 200px;
            padding: 20px;
            margin: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
        }
        .card h3 {
            margin: 10px 0;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Admin Dashboard</h2>

    <div class="card">
        <h3>Tổng số phòng</h3>
        <p>${tongSoPhong}</p>
    </div>

    <div class="card">
        <h3>Phòng trống</h3>
        <p>${soPhongTrong}</p>
    </div>

    <div class="card">
        <h3>Phòng đã thuê</h3>
        <p>${soPhongDaThue}</p>
    </div>

    <div class="card">
        <h3>Tổng khách thuê</h3>
        <p>${tongKhachThue}</p>
    </div>

    <div class="card">
        <h3>Doanh thu</h3>
        <p>${doanhThu} VNĐ</p>
    </div>

    <br>
    <a href="${pageContext.request.contextPath}/admin/thongke" class="btn">Xem thống kê chi tiết</a>
</div>
</body>
</html>
