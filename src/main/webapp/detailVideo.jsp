<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>


<html lang="vi">
<head>
    <%Boolean iLike = (Boolean) request.getAttribute("isLiked");%>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Detail</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Thêm vào phần head -->

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

        /*sharevideo*/


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
            <h5 class="card-title mb-3">${listDays[video.id]}</h5>
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
                    <a href="${pageContext.request.contextPath}/detailVideo?videoFindId=${recentVideo.id}"
                       class="text-decoration-none text-dark">
                        <div class="recent-video-thumbnail">
                            <img src="${recentVideo.poster}" alt="${recentVideo.title}">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 1rem;">${recentVideo.title}</h5>
                            <div class="d-flex gap-2 text-muted" style="font-size: 0.9rem;">
                                <span>${recentVideo.viewCount} views</span>
                                <span>•</span>
                                <span>${recentVideo.postedDate}</span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Share Modal -->
<div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="shareModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="shareModalLabel">Share Video</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="emailInput" class="form-label">Enter email addresses</label>
                    <input type="text" class="form-control mb-2" id="emailInput"
                           placeholder="Type email and press Enter">
                    <div id="emailChips" class="d-flex flex-wrap gap-2">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="messageInput" class="form-label">Message (optional)</label>
                    <textarea class="form-control" id="messageInput" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="sendShare()">Share</button>
            </div>
        </div>
    </div>
</div>

</body>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    var player;
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);



    const extractVideoID = (url) => {
        let videoID = null;

        if (url.includes('youtube.com/watch')) {
            // Xử lý URL dạng: https://www.youtube.com/watch?v=whkFt-HKTVg
            const urlParams = new URLSearchParams(new URL(url).search);
            videoID = urlParams.get('v'); // Lấy giá trị tham số 'v'
        } else if (url.includes('youtube.com/embed/') || url.includes('youtu.be/')) {
            // Xử lý URL dạng embed hoặc youtu.be: https://www.youtube.com/embed/whkFt-HKTVg
            videoID = url.split('/').pop(); // Lấy phần cuối sau dấu '/'
        }

        return videoID;
    };
    const videoID = extractVideoID('${video.url}');

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

    let intervalID = null;
    var done = false;

    function onPlayerStateChange(event) {
        if (event.data === YT.PlayerState.PLAYING && !done) {
            if (!intervalID) { // Chỉ tạo setInterval nếu chưa tồn tại
                intervalID = setInterval(function () {
                    let currentTime = player.getCurrentTime();
                    if (currentTime > 30) {
                        done = true;
                        clearInterval(intervalID);
                        intervalID = null; // Reset intervalID
                        updateViewCount();
                    }
                }, 100);
            }
        } else if (event.data !== YT.PlayerState.PLAYING) {
            // Dừng theo dõi nếu không còn ở trạng thái PLAYING
            clearInterval(intervalID);
            intervalID = null;
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

    // shareVideo
    // Thay thế hàm shareVideo cũ
    function shareVideo(id) {
        const shareModal = new bootstrap.Modal(document.getElementById('shareModal'));
        shareModal.show();
    }

    let emails = [];

    // Xử lý thêm email
    document.getElementById('emailInput').addEventListener('keyup', function (e) {
        if (e.key === 'Enter' || e.key === ',') {
            e.preventDefault();
            const email = this.value.trim().replace(',', '');
            if (validateEmail(email) && !emails.includes(email)) {
                emails.push(email);
                updateEmailChips();
            }
            this.value = '';
        }
    });

    // Hàm validate email
    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    // Cập nhật hiển thị email chips
    function updateEmailChips() {
        console.log("Emails set:", emails);
        const container = document.getElementById('emailChips');
        console.log("Container:", container);
        container.innerHTML = '';

        emails.forEach((email) => {
            console.log("Processing email:", email);
            const chip = document.createElement('div');
            chip.className = 'badge bg-primary d-flex align-items-center p-2 m-1';

            const content = `
            <span>${email}</span>
            <button type="button" class="btn-close btn-close-white ms-2" style="font-size: 0.5em;"></button>
        `;
            chip.innerHTML = content;
            console.log("Created chip:", chip);

            chip.querySelector('.btn-close').addEventListener('click', () => removeEmail(email));
            container.appendChild(chip);
        });
    }

    // Xóa email
    function removeEmail(index) {
        emails.splice(index, 1);
        updateEmailChips();
    }

    // Gửi share
    function sendShare() {
        if (emails.length === 0) {
            alert('Please add at least one email address');
            return;
        }

        const message = document.getElementById('messageInput').value;
        const videoData = {
            videoId: '${video.id}',
            emails: emails,
            message: message
        };

        // Gửi request đến server
        fetch(`${pageContext.request.contextPath}/share`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(videoData)
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Video shared successfully!');
                    bootstrap.Modal.getInstance(document.getElementById('shareModal')).hide();
                    // Reset form
                    emails = [];
                    updateEmailChips();
                    document.getElementById('messageInput').value = '';
                } else {
                    alert('Failed to share video. Please try again.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while sharing the video.');
            });
    }

    function likeVideo(videoId) {
        const likeBtn = document.getElementById('likeBtn');
        likeVideoOrUnlike();
        // Toggle trạng thái active của nút
        if (likeBtn.classList.contains('active')) {
            likeBtn.classList.remove('active');
            likeBtn.innerHTML = '<i class="bi bi-heart"></i><span>Like</span>';
        } else {
            likeBtn.classList.add('active');
            likeBtn.innerHTML = '<i class="bi bi-heart-fill"></i><span>Liked</span>';
        }

        // Lưu trạng thái like vào localStorage

    }

    function likeVideoOrUnlike() {
        fetch(`${pageContext.request.contextPath}/detailVideo/likeVideo?videoId=${video.id}`, {
            'method': 'POST',
        }).then((response) => {
            if (!response.status == 200) {
                console.log("Khong thông công");
            } else {
                console.log("Thành cong");
            }
        })
    }

    document.addEventListener('DOMContentLoaded', function () {
        <% if (iLike != null && iLike) { %>
        const likeBtn = document.getElementById('likeBtn')
        likeBtn.classList.add('active');
        likeBtn.innerHTML = '<i class="bi bi-heart-fill"></i><span>Liked</span>';
        <% } %>
    })


    <%--function shareVideo(id) {--%>
    <%--    // Code xử lý share video--%>
    <%--    const shareUrl = window.location.href;--%>
    <%--    if (navigator.share) {--%>
    <%--        navigator.share({--%>
    <%--            title: '${video.title}',--%>
    <%--            url: shareUrl--%>
    <%--        });--%>
    <%--    } else {--%>
    <%--        // Fallback cho các trình duyệt không hỗ trợ Web Share API--%>
    <%--        alert('Share URL: ' + shareUrl);--%>
    <%--    }--%>
    <%--}--%>

    // Thêm hàm này để kiểm tra trạng thái like khi trang được tải
    <%--document.addEventListener('DOMContentLoaded', function () {--%>
    <%--    const videoId = '${video.id}'; // Lấy video ID từ JSP--%>
    <%--    const likedVideos = JSON.parse(localStorage.getItem('likedVideos') || '[]');--%>

    <%--    if (likedVideos.includes(videoId)) {--%>
    <%--        const likeBtn = document.getElementById('likeBtn');--%>
    <%--        likeBtn.classList.add('active');--%>
    <%--        likeBtn.innerHTML = '<i class="bi bi-heart-fill"></i><span>Liked</span>';--%>
    <%--    }--%>
    <%--});--%>
</script>
</html>