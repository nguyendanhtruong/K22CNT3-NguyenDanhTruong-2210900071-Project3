<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh Sách Khách Thuê</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h2 class="text-center text-primary">Danh Sách Khách Thuê</h2>
  <a href="${pageContext.request.contextPath}/khachthue/add" class="btn btn-success mb-3">Thêm Khách Thuê</a>
  <div class="table-responsive">
    <table class="table table-bordered table-hover bg-white">
      <thead class="table-primary text-center">
      <tr>
        <th>Mã KT</th>
        <th>Họ Tên</th>
        <th>Ngày Sinh</th>
        <th>Nghề Nghiệp</th>
        <th>Giới Tính</th>
        <th>SĐT</th>
        <th>Quê Quán</th>
        <th>Mã Phòng</th>
        <th>Hành Động</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="kt" items="${listKhachThue}">
        <tr class="text-center">
          <td>${kt.NDT_maKT}</td>
          <td>${kt.NDT_HoTen}</td>
          <td>${kt.NDT_NgaySinh}</td>
          <td>${kt.NDT_NgheNghiep}</td>
          <td>${kt.NDT_GioiTinh}</td>
          <td>${kt.NDT_Sdt}</td>
          <td>${kt.NDT_QueQuan}</td>
          <td>${kt.NDT_maPhong}</td>
          <td>
            <a href="${pageContext.request.contextPath}/khachthue/edit/${kt.NDT_maKT}" class="btn btn-warning btn-sm">Sửa</a>
            <a href="${pageContext.request.contextPath}/khachthue/delete/${kt.NDT_maKT}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
