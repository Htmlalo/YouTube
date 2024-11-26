<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>YouTube Clone</title>
    <link rel="icon" href=
            "https://www.liblogo.com/img-logo/yo482y5ff-youtube-icon-logo-youtube-logo-free-icon-of-vector-logo.png"
          style="height: 200px; width: 200px; margin: auto;"
          type="image/x-icon"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e8f86d2aff.js" crossorigin="anonymous"></script>
    <style>
        :root {
            --primary-color: #1a73e8;
            --text-color: #3c4043;
            --hover-bg: #f6fafe;
            --active-bg: #e8f0fe;
            --border-color: #dadce0;
            --shadow-sm: 0 1px 2px 0 rgba(60, 64, 67, 0.1), 0 2px 6px 2px rgba(60, 64, 67, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --sidebar-width: 256px;
            --sidebar-mini-width: 72px;
            --navbar-height: 64px;
            --transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
        }

        /* Reset & Global Styles */
        body {
            background-color: #f8f9fa;
            font-family: 'Google Sans', 'Roboto', sans-serif;
            color: var(--text-color);
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        a {
            text-decoration: none !important;
            color: var(--text-color);
            transition: var(--transition);
        }

        a:hover {
            color: var(--primary-color);
        }

        /* Navbar Styles */
        .navbar {
            height: var(--navbar-height);
            background-color: white !important;
            box-shadow: var(--shadow-sm);
            padding: 0 24px;
            z-index: 1000;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            font-weight: 500;
            padding: 0;
            font-size: 22px;
        }

        .navbar-brand img {
            height: 28px;
            margin-right: 8px;
        }

        .navbar-start {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-info {
            font-size: 15px;
            color: var(--text-color);
            margin-left: 20px;
            border-left: 1px solid var(--border-color);
            padding-left: 20px;
            font-weight: 500;
        }

        /* Sidebar Toggle Button */
        .sidebar-toggle {
            cursor: pointer;
            padding: 10px;
            border-radius: 50%;
            transition: var(--transition);
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sidebar-toggle:hover {
            background-color: var(--hover-bg);
        }

        .sidebar-toggle i {
            font-size: 22px;
            color: var(--text-color);
        }

        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            position: fixed;
            left: 0;
            top: var(--navbar-height);
            bottom: 0;
            background: white;
            overflow-y: auto;
            z-index: 100;
            box-shadow: var(--shadow-sm);
            padding-top: 16px;
            transition: var(--transition);
        }

        .sidebar::-webkit-scrollbar {
            width: 8px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background-color: #dadce0;
            border-radius: 8px;
        }

        .sidebar::-webkit-scrollbar-track {
            background-color: transparent;
        }

        .nav-item-sidebar {
            position: relative;
            margin: 4px 12px;
            border-radius: 12px;
            overflow: hidden;
        }

        .nav-item-sidebar a {
            display: flex;
            align-items: center;
            padding: 12px 16px;
            color: var(--text-color);
            transition: var(--transition);
            font-weight: 500;
        }

        .nav-item-sidebar a:hover {
            background-color: var(--hover-bg);
            color: var(--primary-color);
        }

        .nav-item-sidebar i {
            width: 24px;
            font-size: 20px;
            margin-right: 24px;
            text-align: center;
            color: inherit;
        }

        .nav-item-sidebar.active a {
            background-color: var(--active-bg);
            color: var(--primary-color);
        }

        /* Collapsed Sidebar Styles */
        .sidebar.collapsed {
            width: var(--sidebar-mini-width);
        }

        .sidebar.collapsed .nav-item-sidebar {
            margin: 4px 8px;
        }

        .sidebar.collapsed .nav-item-sidebar a {
            padding: 12px;
            justify-content: center;
        }

        .sidebar.collapsed .nav-item-sidebar i {
            margin: 0;
            font-size: 22px;
        }

        .sidebar.collapsed .nav-item-sidebar span {
            display: none;
        }

        /* Divider Style */
        .sidebar-divider {
            height: 1px;
            background-color: var(--border-color);
            margin: 12px 24px;
            opacity: 0.7;
        }

        .sidebar.collapsed .sidebar-divider {
            margin: 12px 12px;
        }

        /* Main Content */
        .main-content {
            margin-left: var(--sidebar-width);
            margin-top: var(--navbar-height);
            padding: 28px;
            min-height: calc(100vh - var(--navbar-height));
            transition: var(--transition);
        }

        .main-content.expanded {
            margin-left: var(--sidebar-mini-width);
        }

        .video-grid-frame {
            width: 100%;
            height: calc(100vh - var(--navbar-height) - 56px);
            border: none;
            border-radius: 16px;
            background: white;
            box-shadow: var(--shadow-sm);
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                box-shadow: var(--shadow-md);
            }

            .sidebar.collapsed {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .main-content.expanded {
                margin-left: 0;
            }

            .navbar {
                padding: 0 16px;
            }
        }

        /* Additional Interactive Elements */
        .nav-item-sidebar a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            height: 65%;
            width: 4px;
            background-color: var(--primary-color);
            transform: translateY(-50%) scaleY(0);
            transition: transform 0.2s ease;
            border-radius: 0 4px 4px 0;
        }

        .nav-item-sidebar.active a::before {
            transform: translateY(-50%) scaleY(1);
        }

        /* Animation Effects */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .nav-item-sidebar {
            animation: fadeIn 0.3s ease-in-out;
        }

        .navbar-start {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .user-info {
            font-size: 14px;
            color: #606060;
            margin-left: 12px;
            border-left: 1px solid #e0e0e0;
            padding-left: 12px;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container-fluid">
        <div class="navbar-start">
            <div class="sidebar-toggle" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </div>
            <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/listVideo">
                <img src="/api/placeholder/90/20" alt="YouTube Logo" class="me-1">
            </a>
            <span class="user-info">${sessionScope.account != null ? sessionScope.account.fullName : 'Guest'}</span>
        </div>
    </div>
</nav>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <!-- Main Navigation -->
    <div class="nav-item-sidebar active">
        <a href="${pageContext.request.contextPath}/listVideo?page=1">
            <i class="fas fa-home"></i>
            <span>Trang chủ</span></a>
    </div>
    <div class="nav-item-sidebar">
        <a href="${pageContext.request.contextPath}/favorites">
            <i class="fas fa-heart"></i>
            <span>Yêu thích</span>
        </a>
    </div>

    <div class="sidebar-divider"></div>

    <!-- Account Management -->
    <div class="nav-item-sidebar">
        <a href="${pageContext.request.contextPath}/login">
            <i class="fas fa-sign-in-alt"></i>
            <span>Đăng nhập</span></a>
    </div>
    <div class="nav-item-sidebar">
        <a href="${pageContext.request.contextPath}/register"> <i class="fas fa-user-plus"></i>
            <span>Đăng ký</span></a>
    </div>
    <div class="nav-item-sidebar">
        <a href="${pageContext.request.contextPath}/changeAccount">
            <i class="fas fa-user-edit"></i>
            <span>Thông tin tài khoản</span></a>
    </div>
    <div class="nav-item-sidebar">
        <a href="${pageContext.request.contextPath}/changePassword">
            <i class="fas fa-lock"></i>
            <span>Đổi mật khẩu</span></a>
    </div>
    <div class="nav-item-sidebar">
        <a href="${pageContext.request.contextPath}/forgotPassword">
            <i class="fas fa-key"></i>
            <span>Quên mật khẩu</span></a>
    </div>
    <div class="nav-item-sidebar">
        <a href="${pageContext.request.contextPath}/logOut">
            <i class="fas fa-sign-out-alt"></i>
            <span>Đăng xuất</span></a>
    </div>
</div>

<!-- Main Content -->
<div class="main-content" id="mainContent">
    <jsp:include page="${pages}"></jsp:include>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Sidebar Toggle Functionality
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('mainContent');

    sidebarToggle.addEventListener('click', function () {
        sidebar.classList.toggle('collapsed');
        mainContent.classList.toggle('expanded');
    });

    // Add active class to sidebar items
    const sidebarItems = document.querySelectorAll('.nav-item-sidebar');
    sidebarItems.forEach(item => {
        item.addEventListener('click', () => {
            sidebarItems.forEach(i => i.classList.remove('active'));
            item.classList.add('active');
        });
    });
</script>
</body>
</html>