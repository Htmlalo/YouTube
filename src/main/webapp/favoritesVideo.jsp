<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/21/2024
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid favorites-page">
    <%-- Sample Favorites Data --%>

    <div class="row">
        <div class="col-12">
            <h2 class="mb-4 text-center">Videos Yêu Thích</h2>
        </div>
    </div>

    <div class="row g-4">

        <c:choose>
            <c:when test="${not empty favoritesList}">
                <c:forEach var="video" items="${favoritesList}">
                    <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                        <div class="card favorite-video-card shadow-sm">
                            <div class="card-body">
                                <div class="row g-3 align-items-center">
                                    <div class="col-4">
                                        <a href="${pageContext.request.contextPath}/detailVideo?videoFindId=${video.id}">
                                            <img src="${video.poster}"
                                                 class="img-fluid rounded favorite-poster"
                                                 alt="${video.title}">
                                        </a>
                                    </div>
                                    <div class="col-8">
                                        <a href="${pageContext.request.contextPath}/detailVideo?videoFindId=${video.id}"
                                           class="text-decoration-none text-dark">
                                            <h5 class="card-title text-truncate mb-2">${video.title}</h5>
                                        </a>
                                        <div class="video-meta d-flex justify-content-between small text-muted">
                                            <span>
                                                <i class="fas fa-eye me-1"></i>${video.viewCount} lượt xem
                                            </span>
                                            <span>
                                                <i class="fas fa-clock me-1"></i>${video.postedDate}
                                            </span>
                                        </div>
                                        <div class="mt-3 text-end">
                                            <form action="${pageContext.request.contextPath}/favorites" method="post">
                                                <input type="hidden" name="videoId" value="${video.id}">
                                                <button type="submit" class="btn btn-sm btn-outline-danger">
                                                    <i class="fas fa-trash-alt me-1"></i>Xóa
                                                </button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-12 text-center">
                    <p class="alert alert-info">Bạn chưa có video yêu thích nào.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<style>
    .favorite-video-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border: none;
        background-color: white;
        margin-bottom: 1rem;
    }

    .favorite-video-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .favorite-poster {
        object-fit: cover;
        height: 120px;
        width: 100%;
        border-radius: 8px;
        transition: opacity 0.3s ease;
    }

    .favorite-poster:hover {
        opacity: 0.8;
    }

    .favorite-video-card .video-meta {
        color: #6c757d;
    }

    .card-title:hover {
        color: var(--primary-color);
    }
</style>
