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
    <a href="#" class="active" data-page="dashboard">
        <i class="fas fa-home me-2"></i> Trang chủ
    </a>
    <a href="#" data-page="videos">
        <i class="fas fa-video me-2"></i> Quản lý Video
    </a>
    <a href="#" data-page="users">
        <i class="fas fa-users me-2"></i> Quản lý Người dùng
    </a>
    <a href="#" data-page="favorites">
        <i class="fas fa-heart me-2"></i> Quản lý Yêu thích
    </a>
    <a href="#" data-page="shares">
        <i class="fas fa-share-alt me-2"></i> Quản lý Chia sẻ
    </a>
    <a href="#" data-page="reports">
        <i class="fas fa-chart-bar me-2"></i> Báo cáo & Thống kê
    </a>
</div>

<div class="main-content">
    <!-- Dashboard Page -->
    <div id="dashboard" class="content-page">
        <h2 class="mb-4">Trang chủ</h2>

        <!-- Stats Cards -->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card stats-card primary">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="text-uppercase mb-1">Tổng Video</div>
                                <div class="h5 mb-0">215</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-video fa-2x text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="card stats-card success">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="text-uppercase mb-1">Người dùng</div>
                                <div class="h5 mb-0">1,258</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-users fa-2x text-success"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="card stats-card warning">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="text-uppercase mb-1">Lượt xem</div>
                                <div class="h5 mb-0">45,925</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-eye fa-2x text-warning"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="card stats-card info">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="text-uppercase mb-1">Số lượng truy cập</div>
                                <div class="h5 mb-0">${visitCount}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-eye fa-2x text-info"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Activities Table -->
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">Hoạt động gần đây</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Người dùng</th>
                            <th>Hoạt động</th>
                            <th>Video</th>
                            <th>Thời gian</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Nguyễn Văn A</td>
                            <td><span class="badge bg-success">Đã xem</span></td>
                            <td>Hướng dẫn Bootstrap</td>
                            <td>5 phút trước</td>
                        </tr>
                        <tr>
                            <td>Trần Thị B</td>
                            <td><span class="badge bg-primary">Đã thích</span></td>
                            <td>Tutorial CSS</td>
                            <td>10 phút trước</td>
                        </tr>
                        <tr>
                            <td>Lê Văn C</td>
                            <td><span class="badge bg-warning">Bình luận</span></td>
                            <td>JavaScript cơ bản</td>
                            <td>15 phút trước</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Videos Page -->
    <div id="videos" class="content-page" style="display: none;">
        <h2 class="mb-4">Quản lý Video</h2>
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Danh sách Video</h5>
                <button class="btn btn-primary">Thêm Video mới</button>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Lượt xem</th>
                            <th>Ngày đăng</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Bootstrap Tutorial</td>
                            <td>1,234</td>
                            <td>01/01/2024</td>
                            <td>
                                <button class="btn btn-sm btn-primary">Sửa</button>
                                <button class="btn btn-sm btn-danger">Xóa</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Users Page -->
    <div id="users" class="content-page" style="display: none;">
        <h2 class="mb-4">Quản lý Người dùng</h2>
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Danh sách Người dùng</h5>
                <button class="btn btn-primary">Thêm Người dùng</button>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Ngày tham gia</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nguyễn Văn A</td>
                            <td>nguyenvana@email.com</td>
                            <td>01/01/2024</td>
                            <td>
                                <button class="btn btn-sm btn-primary">Sửa</button>
                                <button class="btn btn-sm btn-danger">Xóa</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="favorites" class="content-page" style="display: none;">
        <h2 class="mb-4">Quản lý Yêu thích</h2>
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Danh sách Video được yêu thích</h5>
                <button class="btn btn-primary">
                    <i class="fas fa-file-export me-2"></i>Xuất báo cáo
                </button>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID Video</th>
                            <th>Tiêu đề</th>
                            <th>Người yêu thích</th>
                            <th>Ngày yêu thích</th>
                            <th>Trạng thái</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Bootstrap Tutorial</td>
                            <td>Nguyễn Văn A</td>
                            <td>01/01/2024</td>
                            <td><span class="badge bg-success">Đang hoạt động</span></td>
                            <td>
                                <button class="btn btn-sm btn-info"><i class="fas fa-info-circle"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Shares Page -->
    <div id="shares" class="content-page" style="display: none;">
        <h2 class="mb-4">Quản lý Chia sẻ</h2>
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Danh sách Video được chia sẻ</h5>
                <button class="btn btn-primary">
                    <i class="fas fa-file-export me-2"></i>Xuất báo cáo
                </button>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-3">
                        <select class="form-select">
                            <option value="">Tất cả nền tảng</option>
                            <option value="facebook">Facebook</option>
                            <option value="twitter">Twitter</option>
                            <option value="email">Email</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <input type="date" class="form-control">
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID Video</th>
                            <th>Tiêu đề</th>
                            <th>Người chia sẻ</th>
                            <th>Nền tảng</th>
                            <th>Ngày chia sẻ</th>
                            <th>Lượt click</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Bootstrap Tutorial</td>
                            <td>Nguyễn Văn A</td>
                            <td><i class="fab fa-facebook text-primary"></i> Facebook</td>
                            <td>01/01/2024</td>
                            <td>150</td>
                            <td>
                                <button class="btn btn-sm btn-info"><i class="fas fa-info-circle"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Reports Page -->
    <div id="reports" class="content-page" style="display: none;">
        <h2 class="mb-4">Báo cáo & Thống kê</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">Thống kê lượt xem</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="viewsChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">Thống kê người dùng</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="usersChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Page Navigation
        const links = document.querySelectorAll('.sidebar a');
        const pages = document.querySelectorAll('.content-page');

        links.forEach(link => {
            link.addEventListener('click', function (e) {
                e.preventDefault();

                // Remove active class from all links
                links.forEach(l => l.classList.remove('active'));

                // Add active class to clicked link
                this.classList.add('active');

                // Hide all pages
                pages.forEach(page => page.style.display = 'none');

                // Show selected page
                const pageId = this.getAttribute('data-page');
                document.getElementById(pageId).style.display = 'block';
            });
        });

        // Initialize Charts
        if (document.getElementById('viewsChart')) {
            new Chart(document.getElementById('viewsChart'), {
                type: 'line',
                data: {
                    labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6'],
                    datasets: [{
                        label: 'Lượt xem',
                        data: [1000, 1500, 1200, 1800, 2000, 2500],
                        borderColor: '#0d6efd',
                        tension: 0.1
                    }]
                }
            });
        }
        document.addEventListener('DOMContentLoaded', function () {
            // Lấy tất cả các liên kết trong sidebar
            const sidebarLinks = document.querySelectorAll('.sidebar a');
            // Lấy tất cả các phần nội dung
            const contentPages = document.querySelectorAll('.content-page');

            // Thêm sự kiện click cho mỗi liên kết
            sidebarLinks.forEach(link => {
                link.addEventListener('click', function (e) {
                    e.preventDefault();

                    // Xóa class active khỏi tất cả các liên kết
                    sidebarLinks.forEach(l => l.classList.remove('active'));

                    // Thêm class active cho liên kết được click
                    this.classList.add('active');

                    // Lấy trang cần hiển thị
                    const pageToShow = this.getAttribute('data-page');

                    // Ẩn tất cả các trang
                    contentPages.forEach(page => {
                        page.style.display = 'none';
                    });

                    // Hiển thị trang được chọn
                    document.getElementById(pageToShow).style.display = 'block';
                });
            });
        });
        if (document.getElementById('usersChart')) {
            new Chart(document.getElementById('usersChart'), {
                type: 'doughnut',
                data: {
                    labels: ['Mới', 'Thường xuyên', 'Không hoạt động'],
                    datasets: [{
                        data: [30, 50, 20],
                        backgroundColor: ['#0d6efd', '#198754', '#dc3545']
                    }]
                }
            });
        }
    });
</script>

</body>
</html>