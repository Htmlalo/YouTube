<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Detail</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Thêm vào phần head -->
    <%--    <script src="https://www.youtube.com/iframe_api"></script>--%>
    <style>
        .video-container {
            position: relative;
            width: 100%;
            padding-top: 56.25%; /* 16:9 Aspect Ratio */
        }

        .video-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }

        .action-btn {
            padding: 8px 20px;
            border-radius: 20px;
            border: 1px solid #dee2e6;
            background: white;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .action-btn:hover {
            background: #f8f9fa;
        }

        .action-btn.active {
            background: #e9ecef;
            border-color: #0d6efd;
            color: #0d6efd;
        }

        .recent-video-card {
            transition: transform 0.2s;
        }

        .recent-video-card:hover {
            transform: translateY(-3px);
        }

        .recent-video-thumbnail {
            position: relative;
            padding-top: 56.25%;
            overflow: hidden;
        }

        .recent-video-thumbnail img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .description {
            white-space: pre-line;
            color: #666;
            line-height: 1.6;
        }

        .content-link {
            color: #0d6efd;
            text-decoration: none;
            word-break: break-all;
        }

        .content-link:hover {
            text-decoration: underline;
        }

        .hashtag {
            color: #1DA1F2;
            text-decoration: none;
            display: inline-block;
            margin-right: 4px;
        }

        .hashtag:hover {
            text-decoration: underline;
            color: #0d6efd;
        }

        .phone-number {
            color: #198754;
            cursor: pointer;
        }

        .hashtag {
            color: #1DA1F2;
            text-decoration: none;
            display: inline-block;
            margin-right: 4px;
        }

        .hashtag:hover {
            text-decoration: underline;
            color: #0d6efd;
        }

        .video-link {
            color: #0d6efd;
            word-break: break-all;
        }

        .description-section {
            padding: 20px;
        }

        .video-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 1rem 0;
        }

        .video-stats {
            color: #666;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="row">
        <!-- Main Video Section -->
        <div class="col-lg-8">
            <!-- Video Player -->
            <div class="video-container mb-3">

                <div id="player"></div>

            </div>

            <!-- Video Info -->
            <h1 class="video-title">${video.title}</h1>

            <div class="video-stats d-flex align-items-center gap-3">
                <span>${video.viewCount} views</span>
                <span>•</span>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex gap-3 mb-4">
                <button class="action-btn" id="likeBtn" onclick="likeVideo('${video.id}')">
                    <i class="bi bi-heart"></i>
                    <span>Like</span>
                </button>
                <button class="action-btn" onclick="shareVideo('${video.id}')">
                    <i class="bi bi-share"></i>
                    <span>Share</span>
                </button>
            </div>

            <!-- Description -->
            <div class="card mb-4">
                <div class="card-body description-section">
                    <h5 class="card-title mb-3">Description</h5>
                    <c:set var="descriptionText" value="${video.description}"/>
                    <%!
                        public String formatDescription(String text) {
                            if (text == null) return "";

                            // Replace line breaks
                            text = text.replace("\\n", "\n");

                            // Convert URLs to links
                            text = text.replaceAll("(https?://[^\\s]+)", "<a href='$1' class='video-link' target='_blank'>$1</a>");

                            // Convert hashtags to styled spans
                            text = text.replaceAll("(#\\w+)", "<a href='javascript:void(0)' class='hashtag'>$1</a>");

                            return text;
                        }
                    %>
                    <div class="description">
                        <%= formatDescription((String) pageContext.getAttribute("descriptionText")) %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Videos Section -->
        <div class="col-lg-4">
            <h4 class="mb-3">Recently Watched</h4>
            <!-- Recent Videos List -->
            <c:forEach var="recentVideo" items="${recentVideos}">
                <div class="recent-video-card card mb-3">
                    <a href="${pageContext.request.contextPath}/video?id=${recentVideo.id}"
                       class="text-decoration-none text-dark">
                        <div class="recent-video-thumbnail">
                            <img src="${recentVideo.poster}" alt="${recentVideo.title}">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 1rem;">${recentVideo.title}</h5>
                            <div class="d-flex gap-2 text-muted" style="font-size: 0.9rem;">
                                <span>${recentVideo.viewCount} views</span>
                                <span>•</span>
                                <span>${recentVideo.uploadDate}</span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    var player;
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


    const videoID = '${video.url}'.split('/').pop();

    function onYouTubeIframeAPIReady() {

        player = new YT.Player('player', {
            height: '720',
            width: '1280',
            videoId: videoID,
            playerVars: {
                'autoplay': 1,
                'enablejsapi': 1,
                'playsinline': 1
            },
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
    }

    function onPlayerReady(event) {
        event.target.playVideo();
    }

    var done = false;

    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
            let intervalID = setInterval(function () {
                let currentTime = player.getCurrentTime();
                if (currentTime > 30) {
                    updateViewCount();
                    done = true;
                    clearInterval(intervalID);
                }
            }, 100)
        }
    }

    function updateViewCount() {
        fetch(`${pageContext.request.contextPath}/detailVideo/updateCount?videoId=${video.id}`, {
            'method': 'POST',
        })
            .then((response) => {
                if (!response.status == 200) {
                    console.log("Khong thành công");
                } else {
                    console.log(" thành công");
                }
            })
    }

    function shareVideo(id) {
        // Code xử lý share video
        const shareUrl = window.location.href;
        if (navigator.share) {
            navigator.share({
                title: '${video.title}',
                url: shareUrl
            });
        } else {
            // Fallback cho các trình duyệt không hỗ trợ Web Share API
            alert('Share URL: ' + shareUrl);
        }
    }
</script>
</body>
</html>