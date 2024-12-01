<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="favorites" class="content-page">
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
            <th>Tiêu đề</th>
            <th>Số Lượng thích</th>
            <th>LastDate</th>
            <th>Old Date</th>
          </tr>
          </thead>
          <tbody>
<c:forEach var="favorite" items="${listFavorites}">
          <tr>
            <td>${favorite[0]}</td>
            <td>${favorite[1]}</td>
            <td>${favorite[2]}</td>
            <td>${favorite[3]}</td>
          </tr>
</c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
