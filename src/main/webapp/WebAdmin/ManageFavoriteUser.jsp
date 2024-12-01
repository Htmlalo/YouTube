<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="content-page">
    <h2 class="mb-4">Quản lý Chia sẻ User</h2>
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Danh sách Chia sẻ User</h5>
            <button class="btn btn-primary">
                <i class="fas fa-file-export me-2"></i>Xuất báo cáo
            </button>
        </div>
        <div class="card-body">
            <div class="row mb-10">
                <div class="col-md-10">
                    <label>
                        <select id="titleSelect" class="form-select">
                            <option value="">Tất cả nền tảng</option>
                            <c:forEach var="title" items="${stringTitle}">
                                <option value="${title}">${title}</option>
                            </c:forEach>
                        </select>
                    </label>
                </div>
                <div class="col-md-2">
                    <button id="search-button" class="btn btn-primary">
                        <i class="fas fa-search me-2"></i>Tìm kiếm
                    </button>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>SENDER NAME</th>
                        <th>SENDER EMAIL</th>
                        <th>RECEIVER EMAIL</th>
                        <th>SENT DATE</th>

                    </tr>
                    </thead>
                    <tbody id="favoriteRow">
                    <c:forEach var="favorite" items="${favoriteUserList}">
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
<script>
    document.getElementById('search-button').addEventListener('click', function () {
        fetch(`${pageContext.request.contextPath}/manageFavoriteUser`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                title: document.getElementById('titleSelect').value
            })

        }).then(response => response.json())
            .then(data => {
                console.log(123)
                if (data.success) {

                    const tableBody = document.getElementById('favoriteRow')
                    tableBody.innerHTML = '';

                    data.favoriteUserList.forEach(share => {
                        // Tạo một thẻ <tr>
                        const row = document.createElement('tr');

                        // Tạo các thẻ <td> cho từng phần tử trong share
                        const senderNameCell = document.createElement('td');
                        senderNameCell.textContent = share[0];  // Dữ liệu từ share[0]
                        row.appendChild(senderNameCell);

                        const senderEmailCell = document.createElement('td');
                        senderEmailCell.textContent = share[1];  // Dữ liệu từ share[1]
                        row.appendChild(senderEmailCell);

                        const receiverEmailCell = document.createElement('td');
                        receiverEmailCell.textContent = share[2];  // Dữ liệu từ share[2]
                        row.appendChild(receiverEmailCell);

                        const sentDateCell = document.createElement('td');
                        sentDateCell.textContent = share[3];  // Dữ liệu từ share[3]
                        row.appendChild(sentDateCell);

                        // Thêm row vào tableBody
                        tableBody.appendChild(row);
                    });


                }
            })


    })
</script>
