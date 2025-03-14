<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Form Hóa Đơn</title>
  <!-- Bootstrap CSS from CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    .error {
      color: #dc3545; /* Bootstrap's danger color */
      font-weight: bold;
      margin-top: 5px;
    }
    .container {
      max-width: 600px; /* Limit form width */
      margin-top: 50px; /* Add top margin */
    }
  </style>
</head>
<body>
<div class="container">
  <h1 class="mb-4">
    <c:if test="${empty hoaDon.NDT_maHD}">Thêm</c:if>
    <c:if test="${not empty hoaDon.NDT_maHD}">Cập nhật</c:if> Hóa Đơn
  </h1>

  <c:if test="${not empty error}">
    <div class="alert alert-danger" role="alert">
        ${error}
    </div>
  </c:if>

  <form action="${pageContext.request.contextPath}/hoadon/save" method="post" class="needs-validation" novalidate>
    <div class="mb-3">
      <label for="maHD" class="form-label">Mã Hóa Đơn:</label>
      <input type="text" class="form-control" id="maHD" name="NDT_maHD" value="${hoaDon.NDT_maHD}" required/>
      <div class="invalid-feedback">Vui lòng nhập mã hóa đơn.</div>
    </div>

    <div class="mb-3">
      <label for="maKT" class="form-label">Mã Khách Thuê:</label>
      <select class="form-select" id="maKT" name="NDT_maKT" required>
        <option value="">-- Chọn Khách Thuê --</option>
        <c:forEach var="ktId" items="${khachThueIds}">
          <option value="${ktId}" <c:if test="${ktId == hoaDon.NDT_maKT}">selected</c:if>>${ktId}</option>
        </c:forEach>
      </select>
      <div class="invalid-feedback">Vui lòng chọn mã khách thuê.</div>
    </div>

    <div class="mb-3">
      <label for="maPhong" class="form-label">Mã Phòng:</label>
      <input type="text" class="form-control" id="maPhong" name="NDT_maPhong" value="${hoaDon.NDT_maPhong}" required/>
      <div class="invalid-feedback">Vui lòng nhập mã phòng.</div>
    </div>

    <div class="mb-3">
      <label for="tgian" class="form-label">Thời Gian:</label>
      <input type="date" class="form-control" id="tgian" name="NDT_tgian" value="${hoaDon.NDT_tgian}" required/>
      <div class="invalid-feedback">Vui lòng chọn thời gian.</div>
    </div>

    <button type="submit" class="btn btn-primary">Lưu</button>
    <a href="${pageContext.request.contextPath}/admin/AdminDashboard" class="btn btn-secondary ms-2">Quay lại danh sách</a>
  </form>
</div>

<!-- Bootstrap JS (for form validation feedback) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
  // Bootstrap form validation
  (function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
  })()
</script>
</body>
</html>