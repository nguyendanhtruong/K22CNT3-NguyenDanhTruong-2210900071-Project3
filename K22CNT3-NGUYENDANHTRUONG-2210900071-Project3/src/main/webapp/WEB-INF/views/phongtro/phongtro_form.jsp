<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${phongTro.NDT_maPhong == null ? 'Thêm Phòng Trọ' : 'Sửa Phòng Trọ'}</title>
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
        .form-control {
            border-radius: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
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
    <h2>${phongTro.NDT_maPhong == null ? 'Thêm Phòng Trọ' : 'Sửa Phòng Trọ'}</h2>
    <form method="post" action="${pageContext.request.contextPath}/phongtro/save" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="NDT_maPhong" class="form-label"><i class="fas fa-id-card me-2"></i>Mã Phòng:</label>
            <input type="text" class="form-control" id="NDT_maPhong" name="NDT_maPhong" value="${phongTro.NDT_maPhong}" required>
            <div class="invalid-feedback">Vui lòng nhập mã phòng.</div>
        </div>
        <div class="mb-3">
            <label for="NDT_dienTich" class="form-label"><i class="fas fa-ruler me-2"></i>Diện Tích (m²):</label>
            <input type="number" class="form-control" id="NDT_dienTich" name="NDT_dienTich" value="${phongTro.NDT_dienTich}" step="0.1" min="0" required>
            <div class="invalid-feedback">Vui lòng nhập diện tích hợp lệ.</div>
        </div>
        <div class="mb-3">
            <label for="NDT_soNguoi" class="form-label"><i class="fas fa-users me-2"></i>Số Người:</label>
            <input type="number" class="form-control" id="NDT_soNguoi" name="NDT_soNguoi" value="${phongTro.NDT_soNguoi}" min="1" required>
            <div class="invalid-feedback">Vui lòng nhập số người (tối thiểu 1).</div>
        </div>
        <div class="mb-3">
            <label for="NDT_giaThue" class="form-label"><i class="fas fa-money-bill me-2"></i>Giá Thuê (VND):</label>
            <input type="number" class="form-control" id="NDT_giaThue" name="NDT_giaThue" value="${phongTro.NDT_giaThue}" step="1000" min="0" required>
            <div class="invalid-feedback">Vui lòng nhập giá thuê hợp lệ.</div>
        </div>
        <div class="mb-3">
            <label for="NDT_DoiTuongThue" class="form-label"><i class="fas fa-user-tag me-2"></i>Đối Tượng Thuê:</label>
            <input type="text" class="form-control" id="NDT_DoiTuongThue" name="NDT_DoiTuongThue" value="${phongTro.NDT_DoiTuongThue}" required>
            <div class="invalid-feedback">Vui lòng nhập đối tượng thuê.</div>
        </div>
        <div class="mb-3">
            <label for="NDT_TinhTrang" class="form-label"><i class="fas fa-info-circle me-2"></i>Tình Trạng:</label>
            <select class="form-select" id="NDT_TinhTrang" name="NDT_TinhTrang" required>
                <option value="" ${phongTro.NDT_TinhTrang == null ? 'selected' : ''}>-- Chọn Tình Trạng --</option>
                <option value="Trống" ${phongTro.NDT_TinhTrang == 'Trống' ? 'selected' : ''}>Trống</option>
                <option value="Đã Thuê" ${phongTro.NDT_TinhTrang == 'Đã Thuê' ? 'selected' : ''}>Đã Thuê</option>
            </select>
            <div class="invalid-feedback">Vui lòng chọn tình trạng.</div>
        </div>
        <div class="mb-3">
            <label for="NDT_moTa" class="form-label"><i class="fas fa-comment-dots me-2"></i>Mô Tả:</label>
            <textarea class="form-control" id="NDT_moTa" name="NDT_moTa" rows="3" required>${phongTro.NDT_moTa}</textarea>
            <div class="invalid-feedback">Vui lòng nhập mô tả.</div>
        </div>
        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-save">Lưu</button>
            <a href="${pageContext.request.contextPath}/admin/AdminDashboard" class="btn btn-back">Quay Lại</a>
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