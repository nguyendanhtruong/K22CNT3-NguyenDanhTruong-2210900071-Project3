<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${khachThue.NDT_maKT == null ? 'Thêm Khách Thuê' : 'Sửa Khách Thuê'}</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }
    .form-container {
      background: #ffffff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      width: 100%;
      animation: fadeIn 0.5s ease-in-out;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    h2 {
      color: #1e3a8a;
      font-weight: 700;
      text-align: center;
      margin-bottom: 25px;
      text-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .form-label {
      color: #1e3a8a;
      font-weight: 500;
    }
    .form-control, .form-select {
      border-radius: 10px;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    .form-control:focus, .form-select:focus {
      border-color: #3b82f6;
      box-shadow: 0 0 5px rgba(59, 130, 246, 0.5);
    }
    .btn-save {
      background: #10b981;
      border: none;
      border-radius: 25px;
      padding: 10px 30px;
      font-weight: 600;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
    }
    .btn-save:hover {
      background: #059669;
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(16, 185, 129, 0.6);
    }
    .btn-cancel {
      background: #ef4444;
      border: none;
      border-radius: 25px;
      padding: 10px 30px;
      font-weight: 600;
      transition: all 0.3s ease;
      color: #ffffff;
    }
    .btn-cancel:hover {
      background: #b91c1c;
      transform: translateY(-2px);
      box-shadow: 0 4px 15px rgba(239, 68, 68, 0.4);
      color: #ffffff;
    }
    .btn-back {
      background: #6b7280;
      border: none;
      border-radius: 25px;
      padding: 10px 30px;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    .btn-back:hover {
      background: #4b5563;
      transform: translateY(-2px);
      box-shadow: 0 4px 15px rgba(75, 85, 99, 0.4);
    }
    .invalid-feedback {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2>${khachThue.NDT_maKT == null ? 'Thêm Khách Thuê' : 'Sửa Khách Thuê'}</h2>
  <form action="${pageContext.request.contextPath}/khachthue/save" method="post" class="needs-validation" novalidate>
    <div class="mb-3">
      <label for="NDT_maKT" class="form-label"><i class="fas fa-id-card me-2"></i>Mã Khách Thuê:</label>
      <input type="text" class="form-control" id="NDT_maKT" name="NDT_maKT" value="${khachThue.NDT_maKT}" required>
      <div class="invalid-feedback">Vui lòng nhập mã khách thuê.</div>
    </div>
    <div class="mb-3">
      <label for="NDT_HoTen" class="form-label"><i class="fas fa-user me-2"></i>Họ Tên:</label>
      <input type="text" class="form-control" id="NDT_HoTen" name="NDT_HoTen" value="${khachThue.NDT_HoTen}" required>
      <div class="invalid-feedback">Vui lòng nhập họ tên.</div>
    </div>
    <div class="mb-3">
      <label for="NDT_NgaySinh" class="form-label"><i class="fas fa-calendar-alt me-2"></i>Ngày Sinh:</label>
      <input type="date" class="form-control" id="NDT_NgaySinh" name="NDT_NgaySinh" value="${khachThue.NDT_NgaySinh}" required>
      <div class="invalid-feedback">Vui lòng chọn ngày sinh.</div>
    </div>
    <div class="mb-3">
      <label for="NDT_NgheNghiep" class="form-label"><i class="fas fa-briefcase me-2"></i>Nghề Nghiệp:</label>
      <input type="text" class="form-control" id="NDT_NgheNghiep" name="NDT_NgheNghiep" value="${khachThue.NDT_NgheNghiep}">
    </div>
    <div class="mb-3">
      <label for="NDT_GioiTinh" class="form-label"><i class="fas fa-venus-mars me-2"></i>Giới Tính:</label>
      <select class="form-select" id="NDT_GioiTinh" name="NDT_GioiTinh" required>
        <option value="" ${khachThue.NDT_GioiTinh == null ? 'selected' : ''}>-- Chọn giới tính --</option>
        <option value="Nam" ${khachThue.NDT_GioiTinh == 'Nam' ? 'selected' : ''}>Nam</option>
        <option value="Nữ" ${khachThue.NDT_GioiTinh == 'Nữ' ? 'selected' : ''}>Nữ</option>
      </select>
      <div class="invalid-feedback">Vui lòng chọn giới tính.</div>
    </div>
    <div class="mb-3">
      <label for="NDT_Sdt" class="form-label"><i class="fas fa-phone me-2"></i>SĐT:</label>
      <input type="text" class="form-control" id="NDT_Sdt" name="NDT_Sdt" value="${khachThue.NDT_Sdt}" required pattern="[0-9]{10}">
      <div class="invalid-feedback">Vui lòng nhập số điện thoại hợp lệ (10 chữ số).</div>
    </div>
    <div class="mb-3">
      <label for="NDT_QueQuan" class="form-label"><i class="fas fa-map-marker-alt me-2"></i>Quê Quán:</label>
      <input type="text" class="form-control" id="NDT_QueQuan" name="NDT_QueQuan" value="${khachThue.NDT_QueQuan}">
    </div>
    <div class="mb-3">
      <label for="NDT_maPhong" class="form-label"><i class="fas fa-home me-2"></i>Mã Phòng:</label>
      <input type="text" class="form-control" id="NDT_maPhong" name="NDT_maPhong" value="${khachThue.NDT_maPhong}">
    </div>
    <div class="d-flex justify-content-between">
      <button type="submit" class="btn btn-save"><i class="fas fa-save me-2"></i>Lưu</button>
      <a href="${pageContext.request.contextPath}/khachthue/list" class="btn btn-cancel"><i class="fas fa-times me-2"></i>Hủy</a>
      <a href="${pageContext.request.contextPath}/admin/AdminDashboard" class="btn btn-back"><i class="fas fa-arrow-left me-2"></i>Quay Lại</a>
    </div>
  </form>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
  // Bootstrap form validation
  (function () {
    'use strict';
    var forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  })();
</script>
</body>
</html>