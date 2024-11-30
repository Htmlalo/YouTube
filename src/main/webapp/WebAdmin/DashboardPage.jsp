<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
              <div class="h5 mb-0">${applicationScope.visitCount}</div>
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
