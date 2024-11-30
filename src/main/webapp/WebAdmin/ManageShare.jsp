<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="shares" class="content-page">
  <h2 class="mb-4">Quản lý Chia sẻ</h2>
  <div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
      <h5 class="mb-0">Danh sách Video được chia sẻ</h5>
      <button class="btn btn-primary">
        <i class="fas fa-file-export me-2"></i>Xuất báo cáo
      </button>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-md-3">
          <select class="form-select">
            <option value="">Tất cả nền tảng</option>
            <option value="facebook">Facebook</option>
            <option value="twitter">Twitter</option>
            <option value="email">Email</option>
          </select>
        </div>
        <div class="col-md-3">
          <input type="date" class="form-control">
        </div>
      </div>

      <div class="table-responsive">
        <table class="table table-hover">
          <thead>
          <tr>
            <th>ID Video</th>
            <th>Tiêu đề</th>
            <th>Người chia sẻ</th>
            <th>Nền tảng</th>
            <th>Ngày chia sẻ</th>
            <th>Lượt click</th>
            <th>Hành động</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>Bootstrap Tutorial</td>
            <td>Nguyễn Văn A</td>
            <td><i class="fab fa-facebook text-primary"></i> Facebook</td>
            <td>01/01/2024</td>
            <td>150</td>
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
