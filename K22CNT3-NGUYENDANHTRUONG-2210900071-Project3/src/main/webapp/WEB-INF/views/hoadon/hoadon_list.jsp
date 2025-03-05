<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách hóa đơn</title>
</head>
<body>
<h1>Danh sách hóa đơn</h1>

<c:if test="${not empty error}">
    <div style="color:red;">${error}</div>
</c:if>

<table border="1">
    <thead>
    <tr>
        <th>Mã Hóa Đơn</th>
        <th>Mã Khách Thuê</th>
        <th>Mã Phòng</th>
        <th>Thời Gian</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="hoaDon" items="${listHoaDon}">
        <tr>
            <td>${hoaDon.NDT_maHD}</td>
            <td>${hoaDon.NDT_maKT}</td>
            <td>${hoaDon.NDT_maPhong}</td>
            <td>${hoaDon.NDT_tgian}</td>
            <td>
                <a href="${pageContext.request.contextPath}/hoadon/edit/${hoaDon.NDT_maHD}">Sửa</a> |
                <a href="${pageContext.request.contextPath}/hoadon/delete/${hoaDon.NDT_maHD}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/hoadon/add">Thêm Hóa Đơn</a>
</body>
</html>
