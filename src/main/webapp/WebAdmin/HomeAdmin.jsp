<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/14/2024
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 15px 25px;
            text-decoration: none;
            font-size: 16px;
            color: #fff;
            display: block;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .sidebar a.active {
            background-color: #0d6efd;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .card {
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                margin-bottom: 20px;
            }

            .main-content {
                margin-left: 0;
            }
        }

        .stats-card {
            border-left: 4px solid;
        }

        .stats-card.primary {
            border-left-color: #0d6efd;
        }

        .stats-card.success {
            border-left-color: #198754;
        }

        .stats-card.warning {
            border-left-color: #ffc107;
        }

        .stats-card.info {
            border-left-color: #0dcaf0;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <a href="${pageContext.request.contextPath}/admin" class="active" data-page="dashboard">
        <i class="fas fa-home me-2"></i> Trang chủ
    </a>
    <a href="${pageContext.request.contextPath}/manageVideo" data-page="videos">
        <i class="fas fa-video me-2"></i> Quản lý Video
    </a>
    <a href="${pageContext.request.contextPath}/manageUser" data-page="users">
        <i class="fas fa-users me-2"></i> Quản lý Người dùng
    </a>
    <a href="${pageContext.request.contextPath}/admin/manageFavorites" data-page="favorites">
        <i class="fas fa-heart me-2"></i> Quản lý Yêu thích
    </a>
    <a href="${pageContext.request.contextPath}/admin/manageShare" data-page="shares">
        <i class="fas fa-share-alt me-2"></i> Quản lý Chia sẻ
    </a>
    <a href="${pageContext.request.contextPath}/admin/reportPage" data-page="reports">
        <i class="fas fa-chart-bar me-2"></i> Báo cáo & Thống kê
    </a>
</div>

<div class="main-content">
    <!-- Dashboard Page -->
    <jsp:include page="${pageAdmin}"></jsp:include>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

        // Initialize Chart
</script>

</body>
</html>