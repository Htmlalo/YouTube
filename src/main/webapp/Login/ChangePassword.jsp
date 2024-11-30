<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="change-password-container">
    <div class="change-password-form">
        <div class="form-header">
            <div class="lock-animation">
                <i class="fas fa-lock"></i>
            </div>
            <h2>Đổi mật khẩu</h2>
            <p>Cập nhật mật khẩu mới để bảo vệ tài khoản của bạn</p>
        </div>

        <form id="changePasswordForm" class="floating-labels-form">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="text" id="username" name="username" value="${sessionScope.account.id}" disabled>
                        <div class="input-underline"></div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-key"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="password" id="currentPassword" name="currentPassword" required>
                        <label for="currentPassword">Mật khẩu hiện tại</label>
                        <div class="input-underline"></div>
                        <i class="fas fa-eye toggle-password" data-target="currentPassword"></i>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="password" id="newPassword" name="newPassword" required>
                        <label for="newPassword">Mật khẩu mới</label>
                        <div class="input-underline"></div>
                        <i class="fas fa-eye toggle-password" data-target="newPassword"></i>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                        <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                        <div class="input-underline"></div>
                        <i class="fas fa-eye toggle-password" data-target="confirmPassword"></i>
                    </div>
                </div>
            </div>

            <button type="submit" class="submit-btn">
                <span class="btn-text">Đổi mật khẩu</span>
                <i class="fas fa-arrow-right"></i>
            </button>
        </form>
    </div>
</div>

<style>
    .change-password-container {
        padding: 20px;
        max-width: 550px;
        margin: 60px auto 0;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    .change-password-form {
        background: #ffffff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        transition: transform 0.3s ease;
    }

    .change-password-form:hover {
        transform: translateY(-5px);
    }

    .form-header {
        text-align: center;
        margin-bottom: 40px;
    }

    .lock-animation {
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
        animation: pulse 2s infinite;
    }

    .lock-animation i {
        color: white;
        font-size: 32px;
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
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
        border-bottom-color: #667eea;
    }

    .input-wrapper input:focus + label,
    .input-wrapper input:valid + label {
        top: -10px;
        font-size: 12px;
        color: #667eea;
    }

    .input-underline {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0;
        height: 2px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
        color: #667eea;
    }

    .submit-btn {
        width: 100%;
        padding: 15px;
        border: none;
        border-radius: 10px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        transition: all 0.3s ease;
        margin-top: 20px;
    }

    .submit-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }

    .submit-btn i {
        transition: transform 0.3s ease;
    }

    .submit-btn:hover i {
        transform: translateX(5px);
    }

    @keyframes pulse {
        0% {
            box-shadow: 0 0 0 0 rgba(102, 126, 234, 0.4);
        }
        70% {
            box-shadow: 0 0 0 20px rgba(102, 126, 234, 0);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(102, 126, 234, 0);
        }
    }

    @media (max-width: 576px) {
        .change-password-container {
            padding: 15px;
            margin-top: 40px;
        }

        .change-password-form {
            padding: 25px;
        }

        .form-header h2 {
            font-size: 24px;
        }

        .lock-animation {
            width: 60px;
            height: 60px;
        }

        .lock-animation i {
            font-size: 24px;
        }

        .input-icon {
            width: 35px;
            height: 35px;
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
    document.getElementById('changePasswordForm').addEventListener('submit', function (e) {
        e.preventDefault();

        // Get form data
        const formData = {
            username: document.getElementById('username').value,
            currentPassword: document.getElementById('currentPassword').value,
            newPassword: document.getElementById('newPassword').value,
            confirmPassword: document.getElementById('confirmPassword').value
        };

        fetch(`${pageContext.request.contextPath}/changePassword`, {
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
                        text: data.message || 'Mật khâẩu đã được thay đổi thành công.',
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
                text: error.message || 'Có lỗi xảy ra khi cập nhật mật khẩu. Vui lòng thử lại sau.',
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


    function formNotificationSuccess(message) {
        Swal.fire({
            title: 'Thành công!',
            text: message || 'Mật khâẩu đã được thay đổi thành công.',
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
            text: message || 'Có lỗi xảy ra khi cập nhật mật khẩu. Vui lòng thử lại sau.',
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