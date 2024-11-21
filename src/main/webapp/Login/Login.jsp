<%--
  Created by IntelliJ IDEA.
  User: TVT
  Date: 11/12/2024
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YouTube - Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .form-container {
            max-width: 400px;
            margin: 20px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: scale(1.02);
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo i {
            color: #ff0000;
            font-size: 40px;
            margin-bottom: 10px;
        }

        .logo h2 {
            color: #333;
            font-weight: 700;
            margin: 0;
            background: linear-gradient(45deg, #ff0000, #ff4d4d);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: textGradient 3s ease infinite;
        }

        @keyframes textGradient {
            0% {
                filter: hue-rotate(0deg);
            }
            100% {
                filter: hue-rotate(360deg);
            }
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
            border: 2px solid #eee;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        .form-control:focus {
            transform: scale(1.02);
            border-color: #ff0000;
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.2);
            background: rgba(255, 255, 255, 1);
        }

        .btn-custom {
            background: linear-gradient(45deg, #ff0000, #ff4d4d);
            color: white;
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background: linear-gradient(45deg, #ff4d4d, #ff0000);
            transform: translateY(-2px);
        }

        .input-group {
            position: relative;
        }

        .input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s ease;
        }

        .input-icon:hover {
            color: #ff0000;
            transform: translateY(-50%) scale(1.2);
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #ff0000;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .register-link a:hover {
            color: #ff4d4d;
            text-decoration: underline;
        }

        /*login-notification*/
        #notification {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 15px 30px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .notification-success {
            background-color: #28a745;
        }

        .notification-error {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="notification"></div>
    <div class="form-container">
        <div class="logo">
            <i class="fab fa-youtube"></i>
            <h2>YouTube</h2>
        </div>

        <form id="loginForm">
            <div class="mb-3">
                <label for="loginUsername" class="form-label">Tài khoản</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="loginUsername" required value="${username}">
                    <span class="input-icon"><i class="fas fa-user"></i></span>
                </div>
            </div>
            <div class="mb-3">
                <label for="loginPassword" class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="loginPassword" required>
                    <span class="input-icon" onclick="togglePassword('loginPassword')">
            <i class="fas fa-eye"></i>
          </span>
                </div>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="rememberMe">
                <label class="form-check-label" for="rememberMe">Ghi nhớ đăng nhập</label>
            </div>
            <button type="submit" class="btn btn-custom">
                <i class="fas fa-sign-in-alt me-2"></i>Đăng nhập
            </button>
        </form>

        <div class="register-link">
            Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
            <br>
            <a href="${pageContext.request.contextPath}/forgotPassword" class="forgot-link">Quên mật khẩu?</a>
        </div>
    </div>
</div>

<script>
    function togglePassword(inputId) {
        const input = document.getElementById(inputId);
        const icon = input.nextElementSibling.children[0];
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

    document.getElementById('loginForm').addEventListener('submit', function (e) {
        e.preventDefault();
        let user = document.getElementById('loginUsername').value;
        let password = document.getElementById('loginPassword').value;
        fetch(`${pageContext.request.contextPath}/login`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({username: user, password: password})
        })
            .then(response => response.json())
            .then(json => {
                if (json.success) {
                    const btn = this.querySelector('.btn-custom');
                    btn.style.transform = 'scale(0.95)';
                    setTimeout(() => {
                        btn.style.transform = 'scale(1)';
                    }, 100);

                    showNotification(json.message, 'success');
                    setTimeout(function () {
                        window.location.href = "${pageContext.request.contextPath}"+json.pages;
                    }, 1500);

                } else {
                    showNotification(json.message, 'error');
                }
            })
            .catch(err => console.error(err));
    });


    function showNotification(message, type = 'success') {
        const notification = document.getElementById('notification');
        notification.textContent = message;
        notification.className = `notification-${type}`;
        notification.style.opacity = '1';
        notification.style.transform = 'translateX(-50%) translateY(0)';

        setTimeout(() => {
            notification.style.opacity = '0';
            notification.style.transform = 'translateX(-50%) translateY(-20px)';
        }, 3000);
    }
</script>
</body>
</html>