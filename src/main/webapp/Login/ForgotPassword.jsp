<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% boolean isStandalone = request.getAttribute("javax.servlet.include.request_uri") == null; %>
<% if (isStandalone) { %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YouTube - Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <% } %>
    <style>
        .forgot-password-container {
            background: ${isStandalone ? 'linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab)' : 'none'};
            background-size: 400% 400%;
            animation: ${isStandalone ? 'gradient 15s ease infinite' : 'none'};
            min-height: ${isStandalone ? '100vh' : 'auto'};
            display: flex;
            align-items: center;
            padding: 20px;
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .forgot-form-container {
            max-width: 400px;
            margin: 20px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease;
        }

        .forgot-form-container:hover {
            transform: scale(1.02);
        }

        .forgot-logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .forgot-logo i {
            color: #ff0000;
            font-size: 40px;
            margin-bottom: 10px;
        }

        .forgot-logo h2 {
            color: #333;
            font-weight: 700;
            margin: 0;
            background: linear-gradient(45deg, #ff0000, #ff4d4d);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: textGradient 3s ease infinite;
        }

        @keyframes textGradient {
            0% { filter: hue-rotate(0deg); }
            100% { filter: hue-rotate(360deg); }
        }

        .forgot-form-control {
            border-radius: 10px;
            padding: 12px;
            border: 2px solid #eee;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        .forgot-form-control:focus {
            transform: scale(1.02);
            border-color: #ff0000;
            box-shadow: 0 0 15px rgba(255,0,0,0.2);
            background: rgba(255, 255, 255, 1);
        }

        .forgot-btn-custom {
            background: linear-gradient(45deg, #ff0000, #ff4d4d);
            color: white;
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        .forgot-btn-custom:hover {
            background: linear-gradient(45deg, #ff4d4d, #ff0000);
            transform: translateY(-2px);
        }

        .forgot-input-group {
            position: relative;
            margin-bottom: 15px;
        }

        .forgot-input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s ease;
        }

        .forgot-input-icon:hover {
            color: #ff0000;
            transform: translateY(-50%) scale(1.2);
        }

        .forgot-back-link {
            text-align: center;
            margin-top: 20px;
        }

        .forgot-back-link a {
            color: #ff0000;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .forgot-back-link a:hover {
            color: #ff4d4d;
            text-decoration: underline;
        }

        .forgot-info-text {
            text-align: center;
            color: #666;
            margin-bottom: 20px;
            font-size: 0.9rem;
            padding: 0 15px;
        }

        #forgotResetSuccess {
            display: none;
            text-align: center;
            color: #28a745;
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            background-color: rgba(40, 167, 69, 0.1);
        }

        .forgot-verification-method {
            margin: 15px 0;
            padding: 15px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.8);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .forgot-verification-method:hover {
            background: rgba(255, 0, 0, 0.1);
            transform: translateX(5px);
        }
    </style>
    <% if (isStandalone) { %>
</head>
<body>
<% } %>

<div class="forgot-password-container">
    <div class="forgot-form-container">
        <div class="forgot-logo">
            <i class="fab fa-youtube"></i>
            <h2>Quên mật khẩu</h2>
        </div>

        <div class="forgot-info-text">
            Vui lòng nhập tên đăng nhập và email đã đăng ký.
            Chúng tôi sẽ gửi link đặt lại mật khẩu cho bạn.
        </div>

        <form id="forgotPasswordForm">
            <div class="forgot-input-group">
                <label for="username" class="form-label">Tên đăng nhập</label>
                <div class="input-group">
                    <input type="text" class="form-control forgot-form-control" id="username" required>
                    <span class="forgot-input-icon"><i class="fas fa-user"></i></span>
                </div>
            </div>

            <div class="forgot-input-group">
                <label for="email" class="form-label">Email</label>
                <div class="input-group">
                    <input type="email" class="form-control forgot-form-control" id="email" required>
                    <span class="forgot-input-icon"><i class="fas fa-envelope"></i></span>
                </div>
            </div>

            <div class="forgot-verification-method">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="verificationMethod" id="emailMethod" checked>
                    <label class="form-check-label" for="emailMethod">
                        <i class="fas fa-envelope-circle-check me-2"></i>
                        Gửi link đặt lại qua email
                    </label>
                </div>
            </div>

            <button type="submit" class="forgot-btn-custom">
                <i class="fas fa-paper-plane me-2"></i>Gửi yêu cầu đặt lại mật khẩu
            </button>

            <div id="forgotResetSuccess">
                Link đặt lại mật khẩu đã được gửi vào email của bạn!
            </div>
        </form>

        <div class="forgot-back-link">
            <a href="Login.jsp"><i class="fas fa-arrow-left me-1"></i>Quay lại đăng nhập</a>
        </div>
    </div>
</div>

<script>
    document.getElementById('forgotPasswordForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const btn = this.querySelector('.forgot-btn-custom');
        const username = document.getElementById('username').value;
        const email = document.getElementById('email').value;

        if (!username || !email) {
            alert('Vui lòng nhập đầy đủ thông tin!');
            return;
        }

        btn.style.transform = 'scale(0.95)';
        btn.disabled = true;
        btn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Đang xử lý...';

        setTimeout(() => {
            btn.style.transform = 'scale(1)';
            document.getElementById('forgotResetSuccess').style.display = 'block';
            btn.disabled = false;
            btn.innerHTML = '<i class="fas fa-paper-plane me-2"></i>Gửi yêu cầu đặt lại mật khẩu';

            this.reset();

            setTimeout(() => {
                document.getElementById('forgotResetSuccess').style.display = 'none';
            }, 5000);
        }, 1500);
    });
</script>

<% if (isStandalone) { %>
</body>
</html>
<% } %>