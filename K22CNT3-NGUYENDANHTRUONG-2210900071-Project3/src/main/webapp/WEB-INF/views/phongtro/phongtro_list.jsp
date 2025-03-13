<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý Phòng Trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h2 class="text-center text-primary">Danh Sách Phòng Trọ</h2>

    <p class="text-center">Trang này hiển thị danh sách các phòng trọ hiện có, cho phép tìm kiếm, lọc theo trạng thái và thực hiện các hành động quản lý như thêm, sửa hoặc xóa phòng trọ.</p>

    <form method="get" action="${pageContext.request.contextPath}/phongtro/list" class="mb-3 d-flex gap-2">
        <input type="text" name="search" value="${search}" class="form-control" placeholder="Tìm kiếm theo mã phòng hoặc đối tượng thuê..." />
        <select name="status" class="form-select">
            <option value="">-- Tất cả trạng thái --</option>
            <option value="Trong" ${status == 'Trong' ? 'selected' : ''}>Trống</option>
            <option value="Da Thue" ${status == 'Da Thue' ? 'selected' : ''}>Đã Thuê</option>
        </select>
        <input type="submit" value="Lọc" class="btn btn-primary" />
    </form>

    <a href="${pageContext.request.contextPath}/phongtro/add" class="btn btn-success mb-3">Thêm phòng trọ mới</a>

    <div class="table-responsive">
        <table class="table table-bordered table-hover bg-white text-center">
            <thead class="table-primary">
            <tr>
                <th>Mã Phòng</th>
                <th>Diện Tích (m²)</th>
                <th>Số Người Tối Đa</th>
                <th>Giá Thuê (VND)</th>
                <th>Đối Tượng Thuê</th>
                <th>Tình Trạng</th>
                <th>Mô Tả</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${listPhongTro}">
                <tr>
                    <td>${p.NDT_maPhong}</td>
                    <td>${p.NDT_dienTich} m²</td>
                    <td>${p.NDT_soNguoi}</td>
                    <td>${p.NDT_giaThue} VND</td>
                    <td>${p.NDT_DoiTuongThue}</td>
                    <td>${p.NDT_TinhTrang}</td>
                    <td>${p.NDT_moTa}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/phongtro/detail/${p.NDT_maPhong}" class="btn btn-info btn-sm">Xem Chi Tiết</a>
                        <a href="${pageContext.request.contextPath}/phongtro/edit/${p.NDT_maPhong}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="${pageContext.request.contextPath}/phongtro/delete/${p.NDT_maPhong}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Phân trang -->
    <c:if test="${totalPages > 1}">
        <nav>
            <ul class="pagination justify-content-center">
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/phongtro/list?page=${i}&search=${search}&status=${status}" class="page-link">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>