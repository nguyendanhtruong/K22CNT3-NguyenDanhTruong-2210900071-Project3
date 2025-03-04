<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Phòng Trọ</title>
</head>
<body>
<h2>Danh Sách Phòng Trọ</h2>
<a href="<c:url value='/phongtro/add' />">Thêm Phòng Trọ</a>
<table border="1">
    <thead>
    <tr>
        <th>Mã Phòng</th>
        <th>Diện Tích</th>
        <th>Số Người</th>
        <th>Giá Thuê</th>
        <th>Đối Tượng Thuê</th>
        <th>Tình Trạng</th>
        <th>Chỉnh Sửa</th>
        <th>Xóa</th>
    </tr>
    </thead>
    <tbody>
    <!-- Use JSTL c:forEach to iterate through the phongTroList -->
    <c:forEach var="phongTro" items="${phongTroList}">
        <tr>
            <td>${phongTro.maPhong}</td>
            <td>${phongTro.dienTich}</td>
            <td>${phongTro.soNguoi}</td>
            <td>${phongTro.giaThue}</td>
            <td>${phongTro.doiTuongThue}</td>
            <td>${phongTro.tinhTrang}</td>
            <td><a href="<c:url value='/phongtro/edit/${phongTro.maPhong}' />">Sửa</a></td>
            <td>
                <form action="<c:url value='/phongtro/delete/${phongTro.maPhong}' />" method="GET">
                    <button type="submit">Xóa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
