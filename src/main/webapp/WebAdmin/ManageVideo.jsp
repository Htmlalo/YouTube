<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="videos" class="content-page">
    <h2 class="mb-4">Quản lý Video</h2>
    <div class="card shadow-sm">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Danh sách Video</h5>
            <button class="btn btn-primary">
                <i class="fas fa-plus me-2"></i>Thêm Video mới
            </button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead class="bg-light">
                    <tr>
                        <th class="border-0">Thông tin</th>
                        <th class="border-0">Lượt xem</th>
                        <th class="border-0">Ngày đăng</th>
                        <th class="border-0">Trạng thái</th>
                        <th class="border-0">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="video" items="${videosList}">
                        <tr data-video-id="${video.id}">
                            <td>
                                <div class="d-flex align-items-center edit-video-trigger">
                                    <img src="${video.poster}" alt="Poster" class="rounded"
                                         style="width: 64px; height: 36px; object-fit: cover;">
                                    <div class="ms-3">
                                        <strong class="d-block">${video.title}</strong>
                                        <small class="text-muted">ID: ${video.id}</small>
                                    </div>
                                </div>
                            </td>
                            <td>${video.viewCount}</td>
                            <td>${video.postedDate}</td>
                            <td class="url" style="display: none;">${video.url}</td>
                            <td class="content" style="display: none;">${video.description}</td>
                            <td>
            <span class="badge ${video.active ? 'bg-success' : 'bg-secondary'}">
                    ${video.active ? 'Hoạt động' : 'Không hoạt động'}
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

    <!-- Edit Modal -->
    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa Video</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm" action="video-update" method="POST" enctype="multipart/form-data">
                        <input type="hidden" id="editVideoId" name="videoId">
                        <div class="mb-3">
                            <label class="form-label">Tiêu đề</label>
                            <input type="text" class="form-control" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">URL</label>
                            <input type="text" class="form-control" name="url" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Poster URL</label>
                            <input type="text" class="form-control" name="poster">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mô tả</label>
                            <textarea class="form-control" name="description" rows="3"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trạng thái</label>
                            <select class="form-select" name="active">
                                <option value="true">Hoạt động</option>
                                <option value="false">Không hoạt động</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Chọn file</label>
                            <input type="file" multiple accept="image/*" class="form-control" name="photo">
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button id="updateVideo" type="submit" class="btn btn-primary">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Create Modal -->
    <div class="modal fade" id="createModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm Video Mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="video-create" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label">Tiêu đề</label>
                            <input id="titleCreate" type="text" class="form-control" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">URL</label>
                            <input id="urlCreate" type="text" class="form-control" name="url" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Poster URL</label>
                            <input id="posterUrlCreate" type="text" class="form-control" name="poster">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mô tả</label>
                            <textarea id="descriptionCreate" class="form-control" name="description"
                                      rows="3"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trạng thái</label>
                            <select id="activeCreate" class="form-select" name="active">
                                <option value="true">Hoạt động</option>
                                <option value="false">Không hoạt động</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Chọn file</label>
                            <input type="file" multiple accept="image/*" class="form-control" name="photo">
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button id="createVideo" type="submit" class="btn btn-primary">Thêm mới</button>
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
        const createModal = new bootstrap.Modal(document.getElementById('createModal'));

        // Xử lý nút thêm mới
        const addButton = document.querySelector('.btn-primary');
        addButton.addEventListener('click', function () {
            // Reset form create khi mở modal
            const createForm = document.querySelector('#createModal form');
            createForm.reset();
            createModal.show();
        });

        // Xử lý các nút edit
        const editButtons = document.querySelectorAll('.edit-video-btn');
        editButtons.forEach(button => {
            button.addEventListener('click', function () {
                // Lấy thẻ tr chứa dữ liệu video
                const videoRow = this.closest('tr');
                const videoId = videoRow.dataset.videoId;

                // Lấy các thông tin từ row
                const title = videoRow.querySelector('.d-block').textContent;
                const poster = videoRow.querySelector('img').src;
                const active = videoRow.querySelector('.badge').textContent.includes('Hoạt động');
                const description = videoRow.querySelector('.content').textContent.trim();
                const url = videoRow.querySelector('.url').textContent.trim();

                console.log(description + url);
                // Điền thông tin vào form
                const form = document.getElementById('editForm');
                form.querySelector('#editVideoId').value = videoId;
                form.querySelector('input[name="title"]').value = title;
                form.querySelector('input[name="poster"]').value = poster;
                form.querySelector('select[name="active"]').value = active.toString();
                form.querySelector('textarea[name="description"]').value = description;
                form.querySelector('input[name="url"]').value = url;
                // Hiển thị modal
                editModal.show();
            });
        });


        document.getElementById()
        // Reset form khi đóng modal
        document.querySelector('#editModal .btn-close').addEventListener('click', function () {
            document.getElementById('editForm').reset();
        });

        document.querySelector('#editModal .btn-secondary').addEventListener('click', function () {
            document.getElementById('editForm').reset();
        });

        document.querySelector('#createModal .btn-close').addEventListener('click', function () {
            document.querySelector('#createModal form').reset();
        });

        document.querySelector('#createModal .btn-secondary').addEventListener('click', function () {
            document.querySelector('#createModal form').reset();
        });
    });

    document.getElementById('createVideo').addEventListener('click', function (e) {
        createVideo(e)
    });

    function createVideo(e) {
        e.preventDefault();
        const form = document.querySelector('#createModal form');
        const title = form.querySelector('input[name="title"]').value;
        const url = form.querySelector('input[name="url"]').value;
        const poster = form.querySelector('input[name="poster"]').value;
        const description = form.querySelector('textarea[name="description"]').value;
        const active = form.querySelector('select[name="active"]').value;

        const data = {
            title: title,
            url: url,
            poster: poster,
            description: description,
            active: active
        };

        fetch(`${pageContext.request.contextPath}/manageVideo`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json' // Set content type to JSON
            },
            body: JSON.stringify(data) // Convert the data to JSON format
        })
            .then(response => response.json()) // Parse the JSON response
            .then(data => {
                console.log(data);
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

    document.getElementById('updateVideo').addEventListener('click', function (e) {
        updateVideo(e);
    });


    const deleteBtn = document.querySelectorAll('.delete-video-btn')
    deleteBtn.forEach(btn => {
        btn.addEventListener('click', function () {
                const confirmation = confirm('Are you sure you want to delete this video?');

                if (confirmation) {
                    const videoRow = this.closest('tr');
                    const videoId = videoRow.dataset.videoId;
                    console.log(videoId);
                    console.log(123)
                    fetch(`${pageContext.request.contextPath}/manageVideo`, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({videoId: videoId})
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


    function updateVideo(e) {
        e.preventDefault();

        const form = document.querySelector('#editModal form');
        const title = form.querySelector('input[name="title"]').value;
        const url = form.querySelector('input[name="url"]').value;
        const poster = form.querySelector('input[name="poster"]').value;
        const description = form.querySelector('textarea[name="description"]').value;
        const active = form.querySelector('select[name="active"]').value;
        const videoId = form.querySelector('input[name="videoId"]').value;

        const data = {
            title: title,
            url: url,
            poster: poster,
            description: description,
            active: active,
            videoId: videoId
        };

        fetch(`${pageContext.request.contextPath}/manageVideo`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json' // Set content type to JSON
            },
            body: JSON.stringify(data) // Convert the data to JSON format
        })
            .then(response => response.json()) // Parse the JSON response
            .then(data => {
                console.log(data);
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
