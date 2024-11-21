<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/listVideo.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <title></title>
    <style>
        /* Video Grid Layout */
        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 24px;
            padding: 16px 0;
        }

        /* Video Card Styles */
        .video-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            box-shadow: var(--shadow-sm);
        }

        .video-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        /* Thumbnail Styles */
        .video-thumbnail {
            position: relative;
            width: 100%;
            padding-top: 56.25%; /* 16:9 Aspect Ratio */
            background: #f8f9fa;
            overflow: hidden;
        }

        .video-thumbnail img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .video-thumbnail:hover img {
            transform: scale(1.05);
        }

        /* Video Information */
        .video-info {
            padding: 16px;
        }

        .video-title {
            font-size: 16px;
            font-weight: 500;
            margin: 0 0 8px 0;
            color: var(--text-color);
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .video-meta {
            font-size: 14px;
            color: #606060;
            line-height: 1.4;
        }

        .video-meta div {
            margin-bottom: 4px;
        }

        /* Action Buttons */
        .action-buttons {
            padding: 8px 16px 16px;
            display: flex;
            gap: 12px;
        }

        .action-button {
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            border: none;
            border-radius: 20px;
            background-color: var(--hover-bg);
            color: var(--text-color);
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .action-button:hover {
            background-color: var(--active-bg);
            color: var(--primary-color);
        }

        .action-button i {
            font-size: 16px;
        }

        /* Pagination Styles */
        .pagination {
            margin-top: 32px;
            margin-bottom: 32px;
        }

        .pagination .page-link {
            border: none;
            padding: 8px 16px;
            color: var(--text-color);
            background-color: transparent;
            transition: all 0.2s ease;
        }

        .pagination .page-link:hover {
            background-color: var(--hover-bg);
            color: var(--primary-color);
        }

        .pagination .page-item.active .page-link {
            background-color: var(--primary-color);
            color: white;
        }

        .pagination .page-item.disabled .page-link {
            color: #9aa0a6;
            pointer-events: none;
            background-color: transparent;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .video-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 16px;
                padding: 12px 0;
            }

            .video-info {
                padding: 12px;
            }

            .action-buttons {
                padding: 6px 12px 12px;
            }

            .action-button {
                padding: 6px 12px;
                font-size: 13px;
            }
        }
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .action-button {
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 5px 10px;
            border: none;
            border-radius: 20px;
            background-color: #f0f0f0;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .action-button:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
<div class="video-grid">

    <c:forEach var="video" items="${listVideos}">
        <form action="${pageContext.request.contextPath}/detailVideo" method="get">
            <div class="video-card">
                <div class="video-thumbnail">
                    <a href="${pageContext.request.contextPath}/detailVideo?videoFindId=${video.id}" id="screenIframe">
                        <img src="${video.poster}" alt="${video.title}"
                             style="width: 100%; height: 100%; object-fit: cover;">
                    </a>
                </div>

                <div class="video-info">
                    <h3 class="video-title">${video.title}</h3>
                    <div class="video-meta">
                        <div>${video.viewCount} views</div>
                        <div>${listDays[video.id]}</div>
                    </div>
                    <form action="${pageContext.request.contextPath}/detailVideo" method="post">
                        <!-- Action Buttons -->
                        <div class="action-buttons">
                            <button class="action-button" onclick="likeVideo('${video.id}')">
                                <i class="bi bi-heart"></i>
                                <span>Like</span>
                            </button>
                            <button class="action-button" onclick="shareVideo('${video.id}')">
                                <i class="bi bi-share"></i>
                                <span>Share</span>
                            </button>

                        </div>
                    </form>
                </div>
            </div>
        </form>
    </c:forEach>

</div>

<!-- Navigation -->
<nav aria-label="Page navigation" class="mt-4">
    <ul class="pagination justify-content-center">
        <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
            <a class="page-link" href="${pageContext.request.contextPath}/listVideo?page=1">&laquo; First</a>
        </li>
        <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
            <a class="page-link" href="${pageContext.request.contextPath}/listVideo?page=${currentPage-1}">&lsaquo;
                Prev</a>
        </li>

        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/listVideo?page=${pageNum}">${pageNum}</a>
            </li>
        </c:forEach>

        <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
            <a class="page-link" href="${pageContext.request.contextPath}/listVideo?page=${currentPage+1}">Next
                &rsaquo;</a>
        </li>
        <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
            <a class="page-link" href="${pageContext.request.contextPath}/listVideo?page=${totalPages}">Last &raquo;</a>
        </li>
    </ul>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>


    // Trong
    // listVideo.jsp, thêm
    // script
    // xử
    // lý
    // click
    // document.querySelectorAll('a[href*="/detailVideo"]').forEach(link => {
    //     link.addEventListener("click", function (event) {
    //         event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ a
    //         const videoUrl = this.getAttribute('href');
    //         const iframeVideo = window.parent.document.getElementById("iframeVideo");
    //         if (iframeVideo) {
    //             // 1. Đổi src của iframe thành detailVideo.jsp
    //             iframeVideo.src = 'detailVideo.jsp';
    //             // 2. Đợi iframe load xong và chuyển đến trang detail với id tương ứng
    //             iframeVideo.onload = function () {
    //                 window.location.href = videoUrl;
    //             };
    //         } else {
    //             // Fallback nếu không tìm thấy iframe
    //             window.location.href = videoUrl;
    //         }
    //     });
    // });

    function likeVideo(id) {
        alert('Đã thích video ' + id);
    }

    function shareVideo(id) {
        alert('Chia sẻ video ' + id);
    }
</script>
</body>
</html>