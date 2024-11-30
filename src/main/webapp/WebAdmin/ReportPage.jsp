<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="reports" class="content-page">
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

