<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Thêm Khách Thuê</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">
<h2 class="text-center mb-4">Thêm Khách Thuê</h2>

<div class="card p-4 shadow">
    <form:form action="add" method="post" modelAttribute="khachThue">
        <div class="mb-3">
            <label class="form-label">Mã Khách Thuê:</label>
            <form:input path="maKT" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Họ Tên:</label>
            <form:input path="hoTen" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày Sinh:</label>
            <form:input path="ngaySinh" class="form-control" type="date"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Nghề Nghiệp:</label>
            <form:input path="ngheNghiep" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Giới Tính:</label>
            <form:input path="gioiTinh" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Số Điện Thoại:</label>
            <form:input path="sdt" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Quê Quán:</label>
            <form:input path="queQuan" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Mã Phòng:</label>
            <form:input path="maPhong" class="form-control"/>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Thêm Khách</button>
        </div>
    </form:form>
</div>
</body>
</html>
