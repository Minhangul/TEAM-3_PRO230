<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Quản lý chung cư</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
        }

        .login-page {
            min-height: 100vh;
            position: relative;
            overflow: hidden;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Ảnh nền */
        .background-frame {
            position: absolute;
            inset: 0;

            background:
                    linear-gradient(rgba(15, 23, 42, 0.45), rgba(15, 23, 42, 0.65)),
                    url("anh/thiet-ke-canh-quan-chung-cu.jpeg");

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        /* Khung đăng nhập */
        .login-card {
            position: relative;
            z-index: 2;

            width: 420px;
            padding: 36px;
            border-radius: 26px;

            background: rgba(15, 23, 42, 0.55);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);

            border: 1px solid rgba(255, 255, 255, 0.35);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.45);

            color: white;
            text-align: center;
        }

        /* Khung logo - sau này bạn tự thay logo */
        .logo-circle {
            width: 90px;
            height: 90px;
            margin: 0 auto 20px;

            border-radius: 50%;
            border: 2px dashed rgba(255, 255, 255, 0.55);
            background: rgba(255, 255, 255, 0.16);

            display: flex;
            justify-content: center;
            align-items: center;

            color: rgba(255, 255, 255, 0.85);
            font-weight: bold;
        }

        .login-card h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #dbeafe;
            margin-bottom: 28px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-size: 14px;
            color: #f1f5f9;
        }

        .form-group input {
            width: 100%;
            padding: 14px;
            border-radius: 13px;

            border: 1px solid rgba(255, 255, 255, 0.35);
            outline: none;

            background: rgba(255, 255, 255, 0.12);
            color: white;

            font-size: 15px;
        }

        .form-group input::placeholder {
            color: #d1d5db;
        }

        .form-group input:focus {
            border-color: #38bdf8;
            box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.28);
        }

        /* Ghi nhớ + Quên mật khẩu */
        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin: 4px 0 22px;
            font-size: 14px;
            color: #f8fafc;
        }

        .form-options label {
            display: flex;
            align-items: center;
            gap: 7px;
            cursor: pointer;
        }

        .form-options input {
            width: 16px;
            height: 16px;
        }

        .form-options a {
            color: #bfdbfe;
            text-decoration: none;
        }

        .form-options a:hover {
            text-decoration: underline;
        }

        button {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 14px;

            background: linear-gradient(135deg, #38bdf8, #6366f1, #a855f7);
            color: white;

            font-size: 17px;
            font-weight: bold;
            cursor: pointer;

            box-shadow: 0 14px 30px rgba(99, 102, 241, 0.45);
            transition: 0.25s;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 18px 38px rgba(99, 102, 241, 0.6);
        }

        .login-footer {
            margin-top: 22px;
            font-size: 13px;
            color: #d1d5db;
        }

        @media (max-width: 600px) {
            .login-card {
                width: 90%;
                padding: 28px 22px;
            }

            .login-card h1 {
                font-size: 26px;
            }
        }
    </style>
</head>
<body>

<div class="login-page">

    <div class="background-frame"></div>

    <div class="login-card">

        <div class="logo-circle">
            <span>LOGO</span>
        </div>

        <h1>Quản lý chung cư</h1>
        <p class="subtitle">Đăng nhập vào hệ thống</p>

        <form action="login" method="post">

            <div class="form-group">
                <label>Tên đăng nhập</label>
                <input type="text" name="username" placeholder="Nhập tên đăng nhập" required>
            </div>

            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu" required>
            </div>

            <div class="form-options">
                <label>
                    <input type="checkbox" name="remember">
                    <span>Ghi nhớ</span>
                </label>

                <a href="#">Quên mật khẩu?</a>
            </div>

            <button type="submit">Đăng nhập</button>

        </form>

        <div class="login-footer">
            Bảo mật thông tin • Ổn định • Phục vụ tận tâm
        </div>

    </div>

</div>

</body>
</html>