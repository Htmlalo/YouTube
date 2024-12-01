<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/28/2024
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    /* Custom Modal Styles */
    .modal-dialog {
        max-width: 600px;
        margin: 1.75rem auto;
    }

    .modal-content {
        border: none;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .modal-header {
        border-bottom: 1px solid #e9ecef;
        padding: 1.5rem;
        background-color: #f8f9fa;
        border-radius: 12px 12px 0 0;
    }

    .modal-title {
        font-size: 1.25rem;
        font-weight: 600;
        color: #2c3e50;
    }

    .modal-body {
        padding: 1.75rem;
    }

    .modal-footer {
        border-top: 1px solid #e9ecef;
        padding: 1.25rem;
        background-color: #f8f9fa;
        border-radius: 0 0 12px 12px;
    }

    .btn-close {
        background: transparent url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23000'%3e%3cpath d='M.293.293a1 1 0 011.414 0L8 6.586 14.293.293a1 1 0 111.414 1.414L9.414 8l6.293 6.293a1 1 0 01-1.414 1.414L8 9.414l-6.293 6.293a1 1 0 01-1.414-1.414L6.586 8 .293 1.707a1 1 0 010-1.414z'/%3e%3c/svg%3e") center/1em auto no-repeat;
    }

    /* Form Styles */
    .form-label {
        font-weight: 500;
        color: #2c3e50;
        margin-bottom: 0.5rem;
    }

    .form-control, .form-select {
        border-radius: 8px;
        border: 1px solid #ced4da;
        padding: 0.625rem 0.75rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .form-control:focus, .form-select:focus {
        border-color: #86b7fe;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
    }

    textarea.form-control {
        min-height: 100px;
    }

    /* Button Styles */
    .modal .btn {
        padding: 0.625rem 1.25rem;
        font-weight: 500;
        border-radius: 8px;
        transition: all 0.2s ease;
    }

    .modal .btn-primary {
        background-color: #0d6efd;
        border: none;
    }

    .modal .btn-primary:hover {
        background-color: #0b5ed7;
        transform: translateY(-1px);
    }

    .modal .btn-secondary {
        background-color: #6c757d;
        border: none;
    }

    .modal .btn-secondary:hover {
        background-color: #5c636a;
        transform: translateY(-1px);
    }

    /* Z-index fix for sidebar conflict */
    .modal {
        z-index: 1060;
    }

    .modal-backdrop {
        z-index: 1050;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .modal-dialog {
            margin: 1rem;
            max-width: calc(100% - 2rem);
        }

        .modal-body {
            padding: 1.25rem;
        }
    }

    /* Animation effects */
    .modal.fade .modal-dialog {
        transform: scale(0.9);
        transition: transform 0.2s ease-out;
    }

    .modal.show .modal-dialog {
        transform: scale(1);
    }
</style>
<div id="users" class="content-page">
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
                    <c:forEach var="user" items="${userList}">
                        <tr data-user-id="${user.id}">
                            <td class="userID">${user.id}</td>
                            <td class="fullName">${user.fullName}</td>
                            <td class="email">${user.email}</td>
                            <td style="display: none" class="passWord">${user.passWord}</td>
                            <td>
            <span class="badge ${user.admin ? 'bg-success' : 'bg-secondary'}">
                    ${user.admin ? 'Quản lý' : 'Người dùng'}
            </span>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-primary edit-video-btn">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn btn-sm btn-danger delete-video-btn">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm" onsubmit="updateUser(event)" enctype="multipart/form-data" >
                        <input type="hidden" id="editUserId" name="userIds">
                        <div class="mb-3">
                            <label class="form-label">UserID</label>
                            <input type="text" class="form-control" name="userId" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="text" class="form-control" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">FullName</label>
                            <input type="text" class="form-control" name="fullName" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">PassWord</label>
                            <input type="text" class="form-control" name="passWord" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Quyền</label>
                            <select class="form-select" name="activeAdmin">
                                <option value="true">Admin</option>
                                <option value="false">User</option>
                            </select>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<!-- Animate CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Lấy reference đến các modal
        const editModal = new bootstrap.Modal(document.getElementById('editModal'));


        // Xử lý các nút edit
        const editButtons = document.querySelectorAll('.edit-video-btn');
        editButtons.forEach(button => {
            button.addEventListener('click', function () {
                // Lấy thẻ tr chứa dữ liệu video
                const userRow = this.closest('tr');
                const userId = userRow.dataset.userId;

                // Lấy các thông tin từ row

                const userIDs = userRow.querySelector('.userID').textContent;
                const fullName = userRow.querySelector('.fullName').textContent;
                const passWord = userRow.querySelector('.passWord').textContent;
                const email = userRow.querySelector('.email').textContent;
                const admin = userRow.querySelector('.badge').textContent.includes('Quản lý');

                console.log(fullName + email + admin + passWord);


                // Điền thông tin vào form
                const form = document.getElementById('editForm');
                form.querySelector('#editUserId').value = userId;
                form.querySelector('input[name="userId"]').value = userIDs;
                form.querySelector('input[name="fullName"]').value = fullName;
                form.querySelector('input[name="email"]').value = email;
                form.querySelector('input[name="passWord"]').value = passWord;
                form.querySelector('select[name="activeAdmin"]').value = admin.toString();

                // const title = userRow.querySelector('.d-block').textContent;
                // const poster = userRow.querySelector('img').src;
                // const active = videoRow.querySelector('.badge').textContent.includes('Hoạt động');
                // const description = videoRow.querySelector('.content').textContent.trim();
                // const url = videoRow.querySelector('.url').textContent.trim();
                //
                // console.log(description + url);
                // // Điền thông tin vào form
                // const form = document.getElementById('editForm');
                // form.querySelector('#editVideoId').value = videoId;
                // form.querySelector('input[name="title"]').value = title;
                // form.querySelector('input[name="poster"]').value = poster;
                // form.querySelector('select[name="active"]').value = active.toString();
                // form.querySelector('textarea[name="description"]').value = description;
                // form.querySelector('input[name="url"]').value = url;
                // Hiển thị modal
                editModal.show();
            });
        });
    });

    function updateUser(event) {
        event.preventDefault();

        const form = document.getElementById('editForm')
        const formData = new FormData(form);

        fetch(`${pageContext.request.contextPath}/manageUser`, {
            method: 'PUT',
            body: formData // Convert the data to JSON format
        })
            .then(response => response.json()) // Parse the JSON response
            .then(data => {

                if (data.success) {
                    formNotificationSuccess(data.message)
                } else {
                    alert('Error: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Something went wrong, please try again.');
            });
    }


    function formNotificationSuccess(message) {
        Swal.fire({
            title: 'Thành công!',
            text: message,
            icon: 'success',
            showConfirmButton: false,
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            timer: 3000,
            timerProgressBar: true
        }).then((result) => {
            if (
                result.dismiss === Swal.DismissReason.timer ||
                result.dismiss === Swal.DismissReason.backdrop ||
                result.dismiss === Swal.DismissReason.esc
            ) {
                // Reload page after successful update
                window.location.reload();
            }
        })
    }

    const deleteBtn = document.querySelectorAll('.delete-video-btn')
    deleteBtn.forEach(btn => {
        btn.addEventListener('click', function () {
                const confirmation = confirm('Are you sure you want to delete this video?');

                if (confirmation) {
                    const userRow = this.closest('tr');
                    const userId = userRow.dataset.userId;


                    fetch(`${pageContext.request.contextPath}/manageUser`, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({userId: userId})
                    }).then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                formNotificationSuccess(data.message)
                            } else {
                                formNotificationError(data.message)
                            }
                        }).catch(error => {
                        console.error('Error:', error);
                        alert('Something went wrong, please try again.');
                    })
                }
            }
        )
    })

    function formNotificationError(message) {
        console.error('Error:', error);
        Swal.fire({
            title: 'Lỗi!',
            text: message || 'Có lỗi xảy ra . Vui lòng thử lại sau.',
            icon: 'error',
            showConfirmButton: false,
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            timer: 3000,
            timerProgressBar: true
        });
    }
</script>
