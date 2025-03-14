<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Hóa Đơn</title>
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
        h1.text-primary {
            color: #1e3a8a;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        h1.text-primary::after {
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
        .alert-danger {
            border-radius: 10px;
            margin-bottom: 30px;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: shake 0.5s ease;
        }
        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }
        .table-container {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
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
        .btn-warning, .btn-danger {
            border-radius: 20px;
            padding: 6px 15px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-warning {
            background: #f59e0b;
            border: none;
        }
        .btn-warning:hover {
            background: #d97706;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.4);
        }
        .btn-danger {
            background: #ef4444;
            border: none;
        }
        .btn-danger:hover {
            background: #b91c1c;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.4);
        }
        .btn-success {
            background: #10b981;
            border: none;
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
            margin-top: 20px;
        }
        .btn-success:hover {
            background: #059669;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.6);
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-primary">Danh Sách Hóa Đơn</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger error-message"><i class="fas fa-exclamation-triangle me-2"></i>${error}</div>
    </c:if>

    <div class="table-container">
        <div class="table-responsive">
            <table class="table table-hover text-center">
                <thead>
                <tr>
                    <th><i class="fas fa-file-invoice me-2"></i>Mã Hóa Đơn</th>
                    <th><i class="fas fa-user me-2"></i>Mã Khách Thuê</th>
                    <th><i class="fas fa-home me-2"></i>Mã Phòng</th>
                    <th><i class="fas fa-clock me-2"></i>Thời Gian</th>
                    <th><i class="fas fa-cogs me-2"></i>Hành Động</th>
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
                                <a href="${pageContext.request.contextPath}/hoadon/edit/${hoaDon.NDT_maHD}" class="btn btn-warning btn-sm"><i class="fas fa-edit me-1"></i>Sửa</a>
                                <a href="${pageContext.request.contextPath}/hoadon/delete/${hoaDon.NDT_maHD}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa hóa đơn ${hoaDon.NDT_maHD}?');"><i class="fas fa-trash me-1"></i>Xóa</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/hoadon/add" class="btn btn-success"><i class="fas fa-plus me-2"></i>Thêm Hóa Đơn</a>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>