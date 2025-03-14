<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
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
        .register-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
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
            margin-bottom: 30px;
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
        .btn-register {
            background: #10b981;
            border: none;
            border-radius: 25px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
            width: 100%;
        }
        .btn-register:hover {
            background: #059669;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.6);
        }
        .alert-danger {
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        .input-group-text {
            background: #f1f5f9;
            border: none;
            border-radius: 10px 0 0 10px;
        }
        .login-link {
            color: #3b82f6;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        .login-link:hover {
            color: #1e3a8a;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2><i class="fas fa-user-plus me-2"></i>Đăng Ký Tài Khoản</h2>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i> ${error}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="username" class="form-label"><i class="fas fa-user me-2"></i>Tên Tài Khoản:</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" id="username" name="NDT_UserName" class="form-control" required>
            </div>
            <div class="invalid-feedback">Vui lòng nhập tên tài khoản.</div>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label"><i class="fas fa-lock me-2"></i>Mật Khẩu:</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" id="password" name="NDT_Pass" class="form-control" required minlength="6">
            </div>
            <div class="invalid-feedback">Mật khẩu phải có ít nhất 6 ký tự.</div>
        </div>

        <!-- Trường ẩn để đảm bảo quyền luôn là "user" -->
        <input type="hidden" name="NDT_Role" value="user">

        <button type="submit" class="btn btn-register"><i class="fas fa-user-plus me-2"></i>Đăng Ký</button>
    </form>

    <p class="mt-3 text-center">
        Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="login-link">Đăng Nhập</a>
    </p>
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