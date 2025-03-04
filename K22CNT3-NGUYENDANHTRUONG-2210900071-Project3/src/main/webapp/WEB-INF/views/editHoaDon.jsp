<%--
  Created by IntelliJ IDEA.
  User: Nitro 5
  Date: 3/4/2025
  Time: 12:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Chỉnh Sửa Hóa Đơn</title>
</head>
<body>
<h2>Chỉnh Sửa Hóa Đơn</h2>
<form action="updateHoaDon" method="post">
    <input type="hidden" name="maHD" value="${hoaDon.maHD}">

    <label>Mã Khách Thuê:</label>
    <input type="text" name="maKT" value="${hoaDon.maKT}" required><br>

    <label>Mã Phòng:</label>
    <input type="text" name="maPhong" value="${hoaDon.maPhong}" required><br>

    <label>Thời Gian:</label>
    <input type="date" name="tgian" value="${hoaDon.tgian}" required><br>

    <input type="submit" value="Cập Nhật">
</form>
<br>
<a href="hoaDonList">Quay lại danh sách</a>
</body>
</html>

