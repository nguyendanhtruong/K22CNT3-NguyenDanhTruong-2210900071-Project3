<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Phòng Trọ</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }
        .container {
            max-width: 1200px;
        }
        h2.text-primary {
            color: #1e3a8a;
            font-weight: 700;
            text-align: center;
            margin-bottom: 15px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        h2.text-primary::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #3b82f6;
            border-radius: 2px;
        }
        p.text-center {
            color: #4b5563;
            margin-bottom: 30px;
        }
        .search-filter {
            background: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .form-control, .form-select {
            border-radius: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 5px rgba(59, 130, 246, 0.5);
        }
        .btn-primary {
            background: #3b82f6;
            border: none;
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: #1e3a8a;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
        }
        .btn-success {
            background: #10b981;
            border: none;
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            background: #059669;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
        }
        .table-container {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background: #1e3a8a;
            color: #ffffff;
            padding: 15px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
        }
        .table tbody tr {
            transition: all 0.3s ease;
        }
        .table tbody tr:hover {
            background: #f1f5f9;
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .table td {
            vertical-align: middle;
            padding: 15px;
        }
        .btn-info, .btn-warning, .btn-danger {
            border-radius: 20px;
            padding: 6px 15px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-info {
            background: #3b82f6;
            border: none;
        }
        .btn-info:hover {
            background: #1e3a8a;
            transform: translateY(-2px);
        }
        .btn-warning {
            background: #f59e0b;
            border: none;
        }
        .btn-warning:hover {
            background: #d97706;
            transform: translateY(-2px);
        }
        .btn-danger {
            background: #ef4444;
            border: none;
        }
        .btn-danger:hover {
            background: #b91c1c;
            transform: translateY(-2px);
        }
        .pagination .page-link {
            border-radius: 50%;
            margin: 0 5px;
            color: #3b82f6;
            transition: all 0.3s ease;
        }
        .pagination .page-item.active .page-link {
            background: #3b82f6;
            border-color: #3b82f6;
            color: #ffffff;
        }
        .pagination .page-link:hover {
            background: #3b82f6;
            color: #ffffff;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-primary">Danh Sách Phòng Trọ</h2>
    <p class="text-center">Quản lý danh sách phòng trọ: tìm kiếm, lọc trạng thái, thêm, sửa hoặc xóa.</p>

    <div class="search-filter">
        <form method="get" action="${pageContext.request.contextPath}/phongtro/list" class="d-flex gap-3 align-items-center">
            <input type="text" name="search" value="${search}" class="form-control" placeholder="Tìm kiếm theo mã phòng hoặc đối tượng thuê..." />
            <select name="status" class="form-select" style="max-width: 200px;">
                <option value="">-- Tất cả trạng thái --</option>
                <option value="Trống" ${status == 'Trống' ? 'selected' : ''}>Trống</option>
                <option value="Đã Thuê" ${status == 'Đã Thuê' ? 'selected' : ''}>Đã Thuê</option>
            </select>
            <button type="submit" class="btn btn-primary"><i class="fas fa-filter me-2"></i>Lọc</button>
        </form>
    </div>

    <a href="${pageContext.request.contextPath}/phongtro/add" class="btn btn-success mb-4"><i class="fas fa-plus me-2"></i>Thêm Phòng Trọ Mới</a>

    <div class="table-container">
        <div class="table-responsive">
            <table class="table table-hover text-center">
                <thead>
                <tr>
                    <th>Mã Phòng</th>
                    <th>Diện Tích (m²)</th>
                    <th>Số Người</th>
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
                        <td>${p.NDT_dienTich}</td>
                        <td>${p.NDT_soNguoi}</td>
                        <td>${p.NDT_giaThue}</td>
                        <td>${p.NDT_DoiTuongThue}</td>
                        <td>
                            <span class="badge ${p.NDT_TinhTrang == 'Trống' ? 'bg-success' : 'bg-danger'}">${p.NDT_TinhTrang}</span>
                        </td>
                        <td>${p.NDT_moTa}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/phongtro/detail/${p.NDT_maPhong}" class="btn btn-info btn-sm"><i class="fas fa-eye me-1"></i>Xem</a>
                            <a href="${pageContext.request.contextPath}/phongtro/edit/${p.NDT_maPhong}" class="btn btn-warning btn-sm"><i class="fas fa-edit me-1"></i>Sửa</a>
                            <a href="${pageContext.request.contextPath}/phongtro/delete/${p.NDT_maPhong}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa phòng ${p.NDT_maPhong}?')"><i class="fas fa-trash me-1"></i>Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Phân trang -->
    <c:if test="${totalPages > 1}">
        <nav class="mt-4">
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

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>