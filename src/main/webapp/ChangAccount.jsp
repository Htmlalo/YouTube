<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/14/2024
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="update-profile-container">

    <div class="update-profile-form">

        <div class="form-header">
            <div class="profile-avatar">
                <div class="avatar-preview">
                    <img src="https://api.dicebear.com/6.x/initials/svg?seed=${sessionScope.account.fullName}"
                         alt="Avatar" id="avatarImage">
                </div>
            </div>
            <h2>Cập nhật tài khoản</h2>
            <p>Cập nhật thông tin cá nhân của bạn</p>

        </div>

        <form id="changeAccountForm" class="floating-labels-form">

            <!-- Username Field -->
            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="text" id="username" name="username" required value="${sessionScope.account.id}"
                               placeholder="Tên Đăng nhập" disabled>
                        <div class="input-underline"></div>
                    </div>
                </div>
            </div>

            <!-- Password Field -->
            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password"
                               value="${sessionScope.account.passWord}" disabled>
                        <div class="input-underline"></div>
                        <i class="fas fa-eye toggle-password" data-target="password"></i>
                    </div>
                </div>
            </div>

            <!-- Full Name Field -->
            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-id-card"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="text" id="fullname" name="fullname" required
                               value="${sessionScope.account.fullName}">
                        <label for="fullname">Họ và tên</label>
                        <div class="input-underline"></div>
                    </div>
                </div>
            </div>

            <!-- Email Field -->
            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="email" id="email" name="email" required value="${sessionScope.account.email}">
                        <label for="email">Địa chỉ email</label>
                        <div class="input-underline"></div>
                    </div>
                </div>
            </div>

            <div class="button-group">
                <button type="submit" class="submit-btn update-btn">
                    <span class="btn-text">Cập nhật</span>
                    <i class="fas fa-save"></i>
                </button>
                <button type="reset" class="submit-btn reset-btn">
                    <span class="btn-text">Đặt lại</span>
                    <i class="fas fa-undo"></i>
                </button>
            </div>
        </form>

    </div>
</div>

<style>
    .update-profile-container {
        padding: 20px;
        max-width: 600px;
        margin: 60px auto 0;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    .update-profile-form {
        position: relative;
        background: #ffffff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        transition: transform 0.3s ease;
    }

    .update-profile-form:hover {
        transform: translateY(-5px);
    }

    .form-header {
        text-align: center;
        margin-bottom: 40px;
    }

    .profile-avatar {
        margin-bottom: 20px;
    }

    .avatar-preview {
        width: 120px;
        height: 120px;
        border-radius: 60px;
        margin: 0 auto;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        border: 4px solid #fff;
        transition: transform 0.3s ease;
    }

    .avatar-preview:hover {
        transform: scale(1.05);
    }

    .avatar-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .form-header h2 {
        color: #2d3748;
        font-size: 28px;
        margin-bottom: 10px;
        font-weight: 600;
    }

    .form-header p {
        color: #718096;
        font-size: 16px;
    }

    .form-group {
        margin-bottom: 25px;
    }

    .input-group {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .input-icon {
        width: 40px;
        height: 40px;
        background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .input-icon i {
        color: white;
        font-size: 16px;
    }

    .input-wrapper {
        position: relative;
        flex: 1;
    }

    .input-wrapper input {
        width: 100%;
        padding: 12px 35px 12px 5px;
        border: none;
        border-bottom: 2px solid #e2e8f0;
        background: transparent;
        font-size: 16px;
        transition: all 0.3s ease;
    }

    .input-wrapper label {
        position: absolute;
        left: 5px;
        top: 50%;
        transform: translateY(-50%);
        color: #a0aec0;
        pointer-events: none;
        transition: all 0.3s ease;
    }

    .input-wrapper input:focus,
    .input-wrapper input:valid {
        border-bottom-color: #6366f1;
    }

    .input-wrapper input:focus + label,
    .input-wrapper input:valid + label {
        top: -10px;
        font-size: 12px;
        color: #6366f1;
    }

    .input-underline {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0;
        height: 2px;
        background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
        transition: width 0.3s ease;
    }

    .input-wrapper input:focus ~ .input-underline {
        width: 100%;
    }

    .toggle-password {
        position: absolute;
        right: 5px;
        top: 50%;
        transform: translateY(-50%);
        color: #a0aec0;
        cursor: pointer;
        transition: color 0.3s ease;
    }

    .toggle-password:hover {
        color: #6366f1;
    }

    .button-group {
        display: flex;
        gap: 15px;
        margin-top: 30px;
    }

    .submit-btn {
        flex: 1;
        padding: 15px;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        transition: all 0.3s ease;
    }

    .update-btn {
        background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
    }

    .reset-btn {
        background: linear-gradient(135deg, #64748b 0%, #94a3b8 100%);
    }

    .submit-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(99, 102, 241, 0.4);
    }

    .submit-btn i {
        transition: transform 0.3s ease;
    }

    .submit-btn:hover i {
        transform: rotate(360deg);
    }

    @media (max-width: 576px) {
        .update-profile-container {
            padding: 15px;
            margin-top: 40px;
        }

        .update-profile-form {
            padding: 25px;
        }

        .form-header h2 {
            font-size: 24px;
        }

        .avatar-preview {
            width: 100px;
            height: 100px;
        }

        .input-icon {
            width: 35px;
            height: 35px;
        }

        .button-group {
            flex-direction: column;
        }
    }


</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<!-- Animate CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<script>

    document.querySelectorAll('.toggle-password').forEach(icon => {
        icon.addEventListener('click', function () {
            const targetId = this.getAttribute('data-target');
            const input = document.getElementById(targetId);

            if (input.type === 'password') {
                input.type = 'text';
                this.classList.remove('fa-eye');
                this.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                this.classList.remove('fa-eye-slash');
                this.classList.add('fa-eye');
            }
        });
    });
    // Handle form submission
    document.getElementById('changeAccountForm').addEventListener('submit', function (e) {
        e.preventDefault();

        // Get form data
        const formData = {
            username: document.getElementById('username').value,
            password: document.getElementById('password').value,
            fullname: document.getElementById('fullname').value,
            email: document.getElementById('email').value
        };

        fetch(`${pageContext.request.contextPath}/changeAccount`, {
            method: "post",
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: data.message || 'Thông tin tài khoản đã được cập nhật.',
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
                } else {
                    throw new Error(data.message || 'Cập nhật thất bại');
                }

            }).catch(error => {
            console.error('Error:', error);
            Swal.fire({
                title: 'Lỗi!',
                text: error.message || 'Có lỗi xảy ra khi cập nhật thông tin. Vui lòng thử lại sau.',
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
        });
    });

    // Add animation when form loads
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.querySelector('.update-profile-form');
        form.style.opacity = '0';
        form.style.transform = 'translateY(20px)';

        setTimeout(() => {
            form.style.transition = 'all 0.6s ease';
            form.style.opacity = '1';
            form.style.transform = 'translateY(0)';
        }, 100);
    });
</script>
