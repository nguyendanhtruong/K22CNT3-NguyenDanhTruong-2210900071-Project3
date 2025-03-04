<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh Sách Khách Thuê</title>
</head>
<body>
<h2>Danh Sách Khách Thuê</h2>
<table border="1">
    <tr>
        <th>Mã KH</th>
        <th>Họ Tên</th>
        <th>Ngày Sinh</th>
        <th>Nghề Nghiệp</th>
        <th>Giới Tính</th>
        <th>Số Điện Thoại</th>
        <th>Quê Quán</th>
        <th>Mã Phòng</th>
    </tr>
    <c:forEach var="khach" items="${danhSachKhach}">
        <tr>
            <td>${khach.maKT}</td>
            <td>${khach.hoTen}</td>
            <td>${khach.ngaySinh}</td>
            <td>${khach.ngheNghiep}</td>
            <td>${khach.gioiTinh}</td>
            <td>${khach.sdt}</td>
            <td>${khach.queQuan}</td>
            <td>${khach.maPhong}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
