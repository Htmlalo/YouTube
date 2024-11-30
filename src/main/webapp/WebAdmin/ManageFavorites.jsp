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
