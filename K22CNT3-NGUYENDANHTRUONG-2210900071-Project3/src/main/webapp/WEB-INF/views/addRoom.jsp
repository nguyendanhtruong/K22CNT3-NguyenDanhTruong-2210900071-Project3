<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm Phòng Trọ</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">
<h2 class="text-center mb-4">Thêm Phòng Trọ Mới</h2>

<div class="card p-4 shadow">
    <form:form action="add" method="post" modelAttribute="room">
        <div class="mb-3">
            <label class="form-label">Mã Phòng:</label>
            <form:input path="maPhong" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Diện Tích:</label>
            <form:input path="dienTich" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Số Người:</label>
            <form:input path="soNguoi" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Giá Thuê:</label>
            <form:input path="giaThue" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Đối Tượng Thuê:</label>
            <form:input path="doiTuongThue" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Tình Trạng:</label>
            <form:input path="tinhTrang" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Chỉ Số Điện Mới:</label>
            <form:input path="chiSoDienMoi" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Chỉ Số Điện Cũ:</label>
            <form:input path="chiSoDienCu" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Chỉ Số Nước Mới:</label>
            <form:input path="chiSoNuocMoi" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Chỉ Số Nước Cũ:</label>
            <form:input path="chiSoNuocCu" class="form-control"/>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Thêm Phòng</button>
        </div>
    </form:form>
</div>

<!-- Thêm Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
