<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="users" class="content-page" >
  <h2 class="mb-4">Quản lý Người dùng</h2>
  <div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
      <h5 class="mb-0">Danh sách Người dùng</h5>
      <button class="btn btn-primary">Thêm Người dùng</button>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-hover">
          <thead>
          <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Ngày tham gia</th>
            <th>Hành động</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>Nguyễn Văn A</td>
            <td>nguyenvana@email.com</td>
            <td>01/01/2024</td>
            <td>
              <button class="btn btn-sm btn-primary">Sửa</button>
              <button class="btn btn-sm btn-danger">Xóa</button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
