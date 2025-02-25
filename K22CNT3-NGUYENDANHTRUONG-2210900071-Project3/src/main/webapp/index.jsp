<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phần mềm quản lý phòng trọ</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<!-- Header -->
<header>
    <nav class="navbar">
        <div class="logo">Logo</div>
        <ul class="nav-links">
            <li><a href="#features">Tính năng</a></li>
            <li><a href="#about">Giới thiệu</a></li>
            <li><a href="#contact">Liên hệ</a></li>
        </ul>
    </nav>
</header>

<!-- Banner/hero section -->
<section class="hero">
    <div class="hero-content">
        <h1>Phần mềm quản lý phòng trọ</h1>
        <p>Quản lý phòng trọ dễ dàng với các tính năng hiện đại.</p>
        <a href="#contact" class="btn">Liên hệ ngay</a>
    </div>
</section>

<!-- Features section -->
<section id="features" class="features">
    <h2>Tính năng nổi bật</h2>
    <div class="feature-container">
        <div class="feature">
            <h3>Tính năng 1</h3>
            <p>Mô tả chi tiết về tính năng 1.</p>
        </div>
        <div class="feature">
            <h3>Tính năng 2</h3>
            <p>Mô tả chi tiết về tính năng 2.</p>
        </div>
        <!-- Thêm nhiều feature nếu cần -->
    </div>
</section>

<!-- About section -->
<section id="about" class="about">
    <h2>Giới thiệu</h2>
    <p>Thông tin về phần mềm và những lợi ích khi sử dụng.</p>
</section>

<!-- Contact section -->
<section id="contact" class="contact">
    <h2>Liên hệ</h2>
    <form action="#" method="post">
        <input type="text" name="name" placeholder="Họ tên" required>
        <input type="email" name="email" placeholder="Email" required>
        <textarea name="message" placeholder="Lời nhắn" required></textarea>
        <button type="submit">Gửi</button>
    </form>
</section>

<!-- Footer -->
<footer>
    <p>© 2025 Your Company Name. All rights reserved.</p>
</footer>
</body>
</html>
