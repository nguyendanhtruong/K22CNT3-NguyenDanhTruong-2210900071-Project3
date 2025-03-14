<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
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
        .login-container {
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
        h3 {
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
        .btn-login {
            background: #3b82f6;
            border: none;
            border-radius: 25px;
            padding: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
        }
        .btn-login:hover {
            background: #1e3a8a;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.6);
        }
        .alert-danger {
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        .register-link {
            color: #3b82f6;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        .register-link:hover {
            color: #1e3a8a;
            text-decoration: underline;
        }
        .input-group-text {
            background: #f1f5f9;
            border: none;
            border-radius: 10px 0 0 10px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h3><i class="fas fa-sign-in-alt me-2"></i>Đăng Nhập</h3>

    <!-- Hiển thị lỗi nếu có -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger d-flex align-items-center" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i> ${error}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="username" class="form-label"><i class="fas fa-user me-2"></i>Tên Đăng Nhập:</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" id="username" name="NDT_UserName" class="form-control" required>
            </div>
            <div class="invalid-feedback">Vui lòng nhập tên đăng nhập.</div>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label"><i class="fas fa-lock me-2"></i>Mật Khẩu:</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" id="password" name="NDT_Pass" class="form-control" required>
            </div>
            <div class="invalid-feedback">Vui lòng nhập mật khẩu.</div>
        </div>

        <button type="submit" class="btn btn-login w-100"><i class="fas fa-sign-in-alt me-2"></i>Đăng Nhập</button>
    </form>

    <p class="mt-3 text-center">
        Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register" class="register-link">Đăng Ký</a>
    </p>
</div>

<!-- Gói Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    // Xác thực biểu mẫu Bootstrap
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