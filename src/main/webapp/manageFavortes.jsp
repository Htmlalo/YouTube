<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/13/2024
  Time: 8:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Favorites Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .search-box {
      max-width: 400px;
      margin: 20px 0;
    }
    .table-responsive {
      margin-top: 20px;
    }
    .table th {
      background-color: #f8f9fa;
      font-weight: 600;
    }
    .table tbody tr:hover {
      background-color: #f5f5f5;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <h2>Favorites Management</h2>

  <!-- Search Box -->

  <div class="search-box">
    <form action="${pageContext.request.contextPath}/favorites" method="post">
    <div class="input-group">
      <input name="textSearch" type="text" class="form-control" placeholder="Search favorites...">
      <button class="btn btn-primary" type="submit">
        <i class="bi bi-search"></i> Search
      </button>
    </div></form>
  </div>

  <!-- Table -->
  <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
      <tr>
        <th>ID</th>
        <th>Like Date</th>
        <th>User FullName</th>
        <th>Video Title</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${favoritesList}" var="favorites">
      <tr>
        <td>${favorites.id}</td>
        <td>${favorites.likeDate}</td>
        <td>${favorites.user.fullName}</td>
        <td>${favorites.video.title}</td>
      </tr>
      </c:forEach>

      </tbody>
    </table>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
