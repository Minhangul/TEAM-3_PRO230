<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý cư dân</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background:
                    radial-gradient(circle at top left, rgba(56, 189, 248, 0.18), transparent 35%),
                    radial-gradient(circle at bottom right, rgba(99, 102, 241, 0.22), transparent 35%),
                    #020617;
            color: white;
        }

        .layout {
            display: flex;
            min-height: 100vh;
            padding: 22px;
            gap: 22px;
        }

        .sidebar {
            width: 280px;
            border-radius: 30px;
            padding: 22px;
            background: rgba(15, 23, 42, 0.78);
            border: 1px solid rgba(148, 163, 184, 0.25);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.45);
        }

        .logo-box {
            padding: 22px;
            border-radius: 26px;
            background: linear-gradient(135deg, rgba(14, 165, 233, 0.28), rgba(99, 102, 241, 0.16));
            border: 1px solid rgba(125, 211, 252, 0.35);
            margin-bottom: 28px;
        }

        .logo-box h2 {
            font-size: 22px;
            margin-bottom: 6px;
        }

        .logo-box p {
            color: #bae6fd;
            font-size: 13px;
        }

        .menu-title {
            font-size: 11px;
            color: #7dd3fc;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin: 22px 0 10px 10px;
        }

        .menu {
            list-style: none;
        }

        .menu li {
            margin-bottom: 9px;
        }

        .menu a {
            display: flex;
            align-items: center;
            gap: 13px;
            text-decoration: none;
            color: #cbd5e1;
            padding: 14px 15px;
            border-radius: 18px;
            transition: 0.25s;
        }

        .menu a:hover,
        .menu a.active {
            background: rgba(56, 189, 248, 0.16);
            color: white;
            box-shadow: inset 0 0 0 1px rgba(125, 211, 252, 0.28);
        }

        .menu-icon {
            width: 34px;
            height: 34px;
            border-radius: 13px;
            background: rgba(255, 255, 255, 0.08);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout {
            margin-top: 25px;
            padding-top: 18px;
            border-top: 1px solid rgba(148, 163, 184, 0.22);
        }

        .main {
            flex: 1;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .page-title h1 {
            font-size: 34px;
            margin-bottom: 8px;
        }

        .page-title p {
            color: #94a3b8;
            font-size: 14px;
        }

        .admin-card {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px 14px;
            border-radius: 20px;
            background: rgba(15, 23, 42, 0.72);
            border: 1px solid rgba(148, 163, 184, 0.25);
        }

        .admin-avatar {
            width: 44px;
            height: 44px;
            border-radius: 16px;
            background: linear-gradient(135deg, #38bdf8, #2563eb);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .admin-card span {
            display: block;
            font-size: 12px;
            color: #94a3b8;
        }

        .content-grid {
            display: grid;
            grid-template-columns: 380px 1fr;
            gap: 22px;
        }

        .panel {
            border-radius: 28px;
            padding: 24px;
            background: rgba(15, 23, 42, 0.74);
            border: 1px solid rgba(148, 163, 184, 0.24);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
        }

        .panel h2 {
            font-size: 21px;
            margin-bottom: 18px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            color: #cbd5e1;
            margin-bottom: 7px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 13px 14px;
            border-radius: 15px;
            border: 1px solid rgba(148, 163, 184, 0.28);
            background: rgba(255, 255, 255, 0.06);
            color: white;
            outline: none;
        }

        .form-group input::placeholder {
            color: #64748b;
        }

        .form-group select option {
            color: black;
        }

        .btn-row {
            display: flex;
            gap: 10px;
            margin-top: 18px;
        }

        .btn {
            border: none;
            padding: 13px 16px;
            border-radius: 15px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.25s;
        }

        .btn-add {
            flex: 1;
            color: white;
            background: linear-gradient(135deg, #38bdf8, #2563eb);
        }

        .btn-reset {
            background: rgba(255, 255, 255, 0.08);
            color: #cbd5e1;
            border: 1px solid rgba(148, 163, 184, 0.25);
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
            gap: 16px;
        }

        .search-box {
            width: 300px;
            padding: 13px 16px;
            border-radius: 16px;
            border: 1px solid rgba(148, 163, 184, 0.25);
            background: rgba(255, 255, 255, 0.06);
            color: white;
            outline: none;
        }

        .search-box::placeholder {
            color: #64748b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
        }

        thead {
            background: rgba(56, 189, 248, 0.13);
        }

        th, td {
            padding: 15px 12px;
            text-align: left;
            font-size: 14px;
            border-bottom: 1px solid rgba(148, 163, 184, 0.18);
        }

        th {
            color: #7dd3fc;
            font-weight: bold;
        }

        td {
            color: #e5e7eb;
        }

        .status {
            padding: 6px 10px;
            border-radius: 999px;
            font-size: 12px;
        }

        .status-active {
            background: rgba(34, 197, 94, 0.16);
            color: #86efac;
        }

        .status-away {
            background: rgba(245, 158, 11, 0.16);
            color: #fcd34d;
        }

        .action-btn {
            padding: 7px 10px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            margin-right: 5px;
            color: white;
        }

        .edit {
            background: #2563eb;
        }

        .delete {
            background: #dc2626;
        }

        @media (max-width: 1100px) {
            .layout {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
            }

            .content-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 700px) {
            .layout {
                padding: 12px;
            }

            .topbar,
            .table-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .search-box {
                width: 100%;
            }

            table {
                font-size: 12px;
            }
        }
    </style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <aside class="sidebar">

        <div class="logo-box">
            <h2>Blue Tower</h2>
            <p>Apartment Management</p>
        </div>

        <div class="menu-title">Điều khiển</div>

        <ul class="menu">
            <li>
                <a href="home.jsp">
                    <span class="menu-icon">🏠</span>
                    <span>Trang chủ</span>
                </a>
            </li>

            <li>
                <a href="resident.jsp" class="active">
                    <span class="menu-icon">👥</span>
                    <span>Cư dân</span>
                </a>
            </li>

            <li>
                <a href="apartment.jsp">
                    <span class="menu-icon">🏢</span>
                    <span>Căn hộ</span>
                </a>
            </li>

            <li>
                <a href="vehicle.jsp">
                    <span class="menu-icon">🚘</span>
                    <span>Phương tiện</span>
                </a>
            </li>

            <li>
                <a href="invoice.jsp">
                    <span class="menu-icon">💳</span>
                    <span>Hóa đơn</span>
                </a>
            </li>

            <li>
                <a href="staff.jsp">
                    <span class="menu-icon">🧑‍💼</span>
                    <span>Nhân sự</span>
                </a>
            </li>
        </ul>

        <div class="menu-title">Dịch vụ</div>

        <ul class="menu">
            <li>
                <a href="notification.jsp">
                    <span class="menu-icon">🔔</span>
                    <span>Thông báo</span>
                </a>
            </li>

            <li>
                <a href="feedback.jsp">
                    <span class="menu-icon">💬</span>
                    <span>Phản ánh</span>
                </a>
            </li>

            <li>
                <a href="report.jsp">
                    <span class="menu-icon">📈</span>
                    <span>Báo cáo</span>
                </a>
            </li>

            <li>
                <a href="change-password.jsp">
                    <span class="menu-icon">🔐</span>
                    <span>Đổi mật khẩu</span>
                </a>
            </li>
        </ul>

        <ul class="menu logout">
            <li>
                <a href="login.jsp">
                    <span class="menu-icon">🚪</span>
                    <span>Đăng xuất</span>
                </a>
            </li>
        </ul>

    </aside>

    <!-- MAIN -->
    <main class="main">

        <div class="topbar">
            <div class="page-title">
                <h1>Quản lý cư dân</h1>
                <p>Thêm, sửa, xóa và theo dõi thông tin cư dân trong chung cư.</p>
            </div>

            <div class="admin-card">
                <div class="admin-avatar">AD</div>
                <div>
                    <strong>Admin</strong>
                    <span>Quản trị viên</span>
                </div>
            </div>
        </div>

        <section class="content-grid">

            <!-- FORM -->
            <div class="panel">
                <h2>Thêm cư dân</h2>

                <form action="#" method="post">

                    <div class="form-group">
                        <label>Họ và tên</label>
                        <input type="text" name="fullName" placeholder="Nhập họ tên cư dân">
                    </div>

                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <input type="text" name="phone" placeholder="Nhập số điện thoại">
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" placeholder="Nhập email">
                    </div>

                    <div class="form-group">
                        <label>Căn hộ</label>
                        <input type="text" name="apartment" placeholder="Ví dụ: A1201">
                    </div>

                    <div class="form-group">
                        <label>Giới tính</label>
                        <select name="gender">
                            <option value="">-- Chọn giới tính --</option>
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Trạng thái</label>
                        <select name="status">
                            <option value="Đang ở">Đang ở</option>
                            <option value="Tạm vắng">Tạm vắng</option>
                        </select>
                    </div>

                    <div class="btn-row">
                        <button type="submit" class="btn btn-add">Thêm cư dân</button>
                        <button type="reset" class="btn btn-reset">Làm mới</button>
                    </div>

                </form>
            </div>

            <!-- TABLE -->
            <div class="panel">
                <div class="table-header">
                    <h2>Danh sách cư dân</h2>
                    <input type="text" class="search-box" placeholder="Tìm kiếm cư dân...">
                </div>

                <table>
                    <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Họ tên</th>
                        <th>SĐT</th>
                        <th>Căn hộ</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>CD001</td>
                        <td>Nguyễn Văn An</td>
                        <td>0987654321</td>
                        <td>A1201</td>
                        <td><span class="status status-active">Đang ở</span></td>
                        <td>
                            <button class="action-btn edit">Sửa</button>
                            <button class="action-btn delete">Xóa</button>
                        </td>
                    </tr>

                    <tr>
                        <td>CD002</td>
                        <td>Trần Thị Mai</td>
                        <td>0912345678</td>
                        <td>B0802</td>
                        <td><span class="status status-active">Đang ở</span></td>
                        <td>
                            <button class="action-btn edit">Sửa</button>
                            <button class="action-btn delete">Xóa</button>
                        </td>
                    </tr>

                    <tr>
                        <td>CD003</td>
                        <td>Lê Hoàng Nam</td>
                        <td>0977111222</td>
                        <td>C0506</td>
                        <td><span class="status status-away">Tạm vắng</span></td>
                        <td>
                            <button class="action-btn edit">Sửa</button>
                            <button class="action-btn delete">Xóa</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </section>

    </main>

</div>

</body>
</html>