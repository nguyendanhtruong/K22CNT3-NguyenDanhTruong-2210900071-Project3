<%--
  Created by IntelliJ IDEA.
  User: Nitro 5
  Date: 3/4/2025
  Time: 12:07 AM
  To change this template use File | Settings | File Templates.
--%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Thêm Hóa Đơn</title>
</head>
<body>
<h2>Thêm Hóa Đơn</h2>
<form action="saveHoaDon" method="post">
    <label>Mã Hóa Đơn:</label>
    <input type="text" name="maHD" required><br>

    <label>Mã Khách Thuê:</label>
    <input type="text" name="maKT" required><br>

    <label>Mã Phòng:</label>
    <input type="text" name="maPhong" required><br>

    <label>Thời Gian:</label>
    <input type="date" name="tgian" required><br>

    <input type="submit" value="Thêm Hóa Đơn">
</form>
<br>
<a href="hoaDonList">Quay lại danh sách</a>
</body>
</html>

