<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý Phòng Trọ</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid black; text-align: center; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; padding: 5px; background: blue; color: white; border-radius: 5px; }
    </style>
</head>
<body>
<h2>Danh Sách Phòng Trọ</h2>

<form method="get" action="list">
    Tìm kiếm: <input type="text" name="search" value="${search}" />
    Tình trạng:
    <select name="status">
        <option value="">-- Tất cả --</option>
        <option value="Trong" ${status == 'Trong' ? 'selected' : ''}>Trống</option>
        <option value="Da Thue" ${status == 'Da Thue' ? 'selected' : ''}>Đã Thuê</option>
    </select>
    <input type="submit" value="Lọc" />
</form>

<a href="add">Thêm phòng trọ</a>

<table>
    <tr>
        <th>Mã Phòng</th>
        <th>Diện Tích</th>
        <th>Số Người</th>
        <th>Giá Thuê</th>
        <th>Đối Tượng Thuê</th>
        <th>Tình Trạng</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="p" items="${listPhongTro}">
        <tr>
            <td>${p.NDT_maPhong}</td>
            <td>${p.NDT_dienTich} m²</td>
            <td>${p.NDT_soNguoi}</td>
            <td>${p.NDT_giaThue} VND</td>
            <td>${p.NDT_DoiTuongThue}</td>
            <td>${p.NDT_TinhTrang}</td>
            <td>
                <a href="edit/${p.NDT_maPhong}">Sửa</a>
                <a href="delete/${p.NDT_maPhong}" onclick="return confirm('Xác nhận xóa?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Phân trang -->
<c:if test="${totalPages > 1}">
    <div>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="list?page=${i}&search=${search}&status=${status}">${i}</a>
        </c:forEach>
    </div>
</c:if>

</body>
</html>
