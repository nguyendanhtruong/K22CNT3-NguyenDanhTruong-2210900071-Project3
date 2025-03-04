<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách Hóa Đơn</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        a {
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid black;
            margin: 2px;
        }
    </style>
</head>
<body>
<h2>Danh sách Hóa Đơn</h2>
<table>
    <tr>
        <th>Mã Hóa Đơn</th>
        <th>Mã Khách Thuê</th>
        <th>Mã Phòng</th>
        <th>Thời Gian</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="hoaDon" items="${hoaDonList}">
        <tr>
            <td>${hoaDon.maHD}</td>
            <td>${hoaDon.maKT}</td>
            <td>${hoaDon.maPhong}</td>
            <td>${hoaDon.tgian}</td>
            <td>
                <a href="editHoaDon?maHD=${hoaDon.maHD}">Sửa</a>
                <a href="deleteHoaDon?maHD=${hoaDon.maHD}" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="${pageContext.request.contextPath}/hoaDon/addHoaDon">Thêm Hóa Đơn</a>

</body>
</html>
