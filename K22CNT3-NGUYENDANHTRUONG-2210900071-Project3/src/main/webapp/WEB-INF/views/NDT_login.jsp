<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
<div class="card p-4 shadow" style="width: 400px;">
    <h3 class="text-center">Đăng nhập</h3>

    <!-- Hiển thị lỗi nếu có -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập:</label>
            <input type="text" id="username" name="NDT_UserName" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu:</label>
            <input type="password" id="password" name="NDT_Pass" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>

    <p class="mt-3 text-center">
        Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
    </p>
</div>
</body>
</html>
