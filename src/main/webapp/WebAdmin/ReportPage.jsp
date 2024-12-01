<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .table th, .table td {
        vertical-align: middle;
    }

    .tab-content {
        margin-top: 20px;
    }

    .security-section {
        margin-top: 20px;
    }

    .security-section table {
        width: 100%;
    }
</style>
<div class="talk-bar">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item"><a class="nav-link active" id="favorites-tab" data-toggle="tab" href="${pageContext.request.contextPath}/mangeFavorites"
                                role="tab" aria-controls="favorites" aria-selected="true">Favorites</a></li>
        <li class="nav-item"><a class="nav-link" id="favorite-users-tab" data-toggle="tab" href="${pageContext.request.contextPath}/manageFavoriteUser"
                                role="tab" aria-controls="favorite-users" aria-selected="false">Favorite Users</a></li>
        <li class="nav-item"><a class="nav-link" id="shared-friends-tab" data-toggle="tab" href="${pageContext.request.contextPath}/manageShare"
                                role="tab" aria-controls="shared-friends" aria-selected="false">Shared Friends</a></li>
    </ul>
    <jsp:include page="${pageReport}"></jsp:include>
</div>

