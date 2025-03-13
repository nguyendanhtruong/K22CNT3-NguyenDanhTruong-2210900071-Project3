<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách hóa đơn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 30px; }
        .table th, .table td { text-align: center; vertical-align: middle; }
        .btn-group a { margin-right: 5px; }
        .error-message { color: red; font-weight: bold; }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center text-primary">Danh sách hóa đơn</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger error-message text-center">${error}</div>
    </c:if>

    <table class="table table-bordered table-hover table-striped">
        <thead class="table-dark">
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
                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath}/hoadon/edit/${hoaDon.NDT_maHD}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="${pageContext.request.contextPath}/hoadon/delete/${hoaDon.NDT_maHD}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/hoadon/add" class="btn btn-success">Thêm Hóa Đơn</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
