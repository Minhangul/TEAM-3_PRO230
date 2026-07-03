<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Quản lý chung cư</title>

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
                    radial-gradient(circle at top left, rgba(56, 189, 248, 0.22), transparent 35%),
                    radial-gradient(circle at bottom right, rgba(99, 102, 241, 0.25), transparent 35%),
                    #020617;
            color: white;
        }

        .layout {
            display: flex;
            min-height: 100vh;
            padding: 22px;
            gap: 22px;
        }

        /* SIDEBAR */
        .sidebar {
            width: 300px;
            border-radius: 32px;
            padding: 22px;
            background: rgba(15, 23, 42, 0.78);
            border: 1px solid rgba(148, 163, 184, 0.25);
            backdrop-filter: blur(22px);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.45);
        }

        /* LOGO FRAME */
        .logo-frame {
            position: relative;
            padding: 22px;
            border-radius: 30px;
            background:
                    linear-gradient(135deg, rgba(14, 165, 233, 0.28), rgba(99, 102, 241, 0.16)),
                    rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(125, 211, 252, 0.35);
            overflow: hidden;
            margin-bottom: 28px;
        }

        .logo-frame::before {
            content: "";
            position: absolute;
            width: 150px;
            height: 150px;
            background: rgba(56, 189, 248, 0.22);
            border-radius: 50%;
            top: -65px;
            right: -55px;
            filter: blur(10px);
        }

        .logo-frame::after {
            content: "";
            position: absolute;
            width: 90px;
            height: 90px;
            background: rgba(129, 140, 248, 0.16);
            border-radius: 50%;
            bottom: -35px;
            left: -30px;
            filter: blur(8px);
        }

        .logo-main {
            position: relative;
            display: flex;
            align-items: center;
            gap: 15px;
            z-index: 2;
        }

        /* LOGO TÒA NHÀ THẬT HƠN */
        .real-logo {
            width: 74px;
            height: 74px;
            border-radius: 24px;
            background:
                    linear-gradient(145deg, rgba(255,255,255,0.25), rgba(255,255,255,0.04)),
                    linear-gradient(135deg, #0ea5e9, #1d4ed8 55%, #312e81);
            display: flex;
            align-items: flex-end;
            justify-content: center;
            padding: 9px 10px;
            box-shadow:
                    0 18px 35px rgba(14, 165, 233, 0.45),
                    inset 0 1px 1px rgba(255,255,255,0.35);
            border: 1px solid rgba(186, 230, 253, 0.55);
        }

        .logo-building {
            position: relative;
            width: 40px;
            height: 54px;
            border-radius: 10px 10px 4px 4px;
            background: linear-gradient(180deg, #e0f2fe 0%, #60a5fa 45%, #1e40af 100%);
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 4px;
            padding: 9px 6px 7px;
            box-shadow:
                    0 10px 18px rgba(15, 23, 42, 0.35),
                    inset 0 1px 2px rgba(255,255,255,0.6);
        }

        .logo-building::before {
            content: "";
            position: absolute;
            top: -8px;
            left: 8px;
            width: 24px;
            height: 8px;
            border-radius: 7px 7px 0 0;
            background: linear-gradient(180deg, #f8fafc, #93c5fd);
        }

        .logo-building::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 14px;
            width: 12px;
            height: 14px;
            border-radius: 5px 5px 1px 1px;
            background: #0f172a;
            box-shadow: inset 0 1px 2px rgba(255,255,255,0.25);
        }

        .logo-building span {
            height: 7px;
            border-radius: 3px;
            background: rgba(255, 255, 255, 0.82);
            box-shadow: 0 0 7px rgba(255,255,255,0.45);
        }

        .logo-text h2 {
            font-size: 20px;
            margin-bottom: 6px;
            letter-spacing: 0.5px;
        }

        .logo-text p {
            font-size: 12px;
            color: #bae6fd;
        }

        .logo-status {
            position: relative;
            z-index: 2;
            margin-top: 18px;
            padding: 10px 13px;
            border-radius: 16px;
            background: rgba(15, 23, 42, 0.55);
            border: 1px solid rgba(186, 230, 253, 0.22);
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #dbeafe;
        }

        .status-dot {
            color: #22c55e;
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
            position: relative;
            display: flex;
            align-items: center;
            gap: 13px;
            text-decoration: none;
            color: #cbd5e1;
            padding: 14px 15px;
            border-radius: 18px;
            transition: 0.25s;
            overflow: hidden;
        }

        .menu a::before {
            content: "";
            position: absolute;
            left: 0;
            top: 12px;
            width: 4px;
            height: 24px;
            border-radius: 10px;
            background: transparent;
        }

        .menu a:hover,
        .menu a.active {
            background: rgba(56, 189, 248, 0.15);
            color: white;
            box-shadow: inset 0 0 0 1px rgba(125, 211, 252, 0.28);
        }

        .menu a:hover::before,
        .menu a.active::before {
            background: #38bdf8;
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

        .logout a:hover {
            background: rgba(220, 38, 38, 0.18);
            box-shadow: inset 0 0 0 1px rgba(248, 113, 113, 0.4);
        }

        /* MAIN */
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 22px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-box {
            width: 370px;
            padding: 15px 18px;
            border-radius: 18px;
            border: 1px solid rgba(148, 163, 184, 0.25);
            background: rgba(15, 23, 42, 0.68);
            color: white;
            outline: none;
        }

        .search-box::placeholder {
            color: #94a3b8;
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
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.35);
        }

        .admin-card strong {
            display: block;
            font-size: 14px;
        }

        .admin-card span {
            color: #94a3b8;
            font-size: 12px;
        }

        /* HERO */
        .hero {
            min-height: 250px;
            border-radius: 36px;
            padding: 34px;
            background:
                    linear-gradient(135deg, rgba(14, 165, 233, 0.26), rgba(79, 70, 229, 0.22)),
                    rgba(15, 23, 42, 0.75);
            border: 1px solid rgba(125, 211, 252, 0.28);
            backdrop-filter: blur(24px);
            box-shadow: 0 25px 65px rgba(0, 0, 0, 0.42);
            display: flex;
            justify-content: space-between;
            align-items: center;
            overflow: hidden;
            position: relative;
        }

        .hero::after {
            content: "";
            position: absolute;
            width: 280px;
            height: 280px;
            right: -80px;
            top: -80px;
            border-radius: 50%;
            background: rgba(56, 189, 248, 0.18);
            filter: blur(4px);
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 640px;
        }

        .hero-tag {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 999px;
            background: rgba(255, 255, 255, 0.1);
            color: #bae6fd;
            font-size: 13px;
            margin-bottom: 16px;
            border: 1px solid rgba(186, 230, 253, 0.25);
        }

        .hero h1 {
            font-size: 42px;
            line-height: 1.15;
            margin-bottom: 14px;
        }

        .hero p {
            color: #cbd5e1;
            font-size: 15px;
            line-height: 1.7;
        }

        /* TÒA NHÀ LỚN TRONG HERO */
        .hero-building-box {
            position: relative;
            z-index: 2;
            width: 230px;
            height: 180px;
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(186, 230, 253, 0.22);
            display: flex;
            align-items: flex-end;
            justify-content: center;
            padding: 20px;
        }

        .big-building {
            position: relative;
            width: 105px;
            height: 140px;
            border-radius: 18px 18px 8px 8px;
            background: linear-gradient(180deg, #e0f2fe, #38bdf8 35%, #1d4ed8 100%);
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 8px;
            padding: 18px 14px 16px;
            box-shadow: 0 22px 45px rgba(37, 99, 235, 0.45);
        }

        .big-building::before {
            content: "";
            position: absolute;
            top: -14px;
            left: 25px;
            width: 55px;
            height: 14px;
            border-radius: 12px 12px 0 0;
            background: linear-gradient(180deg, #f8fafc, #93c5fd);
        }

        .big-building::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 40px;
            width: 25px;
            height: 28px;
            border-radius: 10px 10px 2px 2px;
            background: #0f172a;
            box-shadow: inset 0 2px 3px rgba(255,255,255,0.25);
        }

        .big-building span {
            height: 14px;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.75);
            box-shadow: 0 0 8px rgba(255,255,255,0.4);
        }

        /* STATS */
        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
        }

        .stat-card {
            position: relative;
            padding: 22px;
            border-radius: 26px;
            background: rgba(15, 23, 42, 0.72);
            border: 1px solid rgba(148, 163, 184, 0.24);
            backdrop-filter: blur(20px);
            overflow: hidden;
            transition: 0.25s;
        }

        .stat-card:hover {
            transform: translateY(-6px);
            border-color: rgba(56, 189, 248, 0.5);
        }

        .stat-card::after {
            content: "";
            position: absolute;
            right: -25px;
            top: -25px;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: rgba(56, 189, 248, 0.12);
        }

        .stat-icon {
            width: 52px;
            height: 52px;
            border-radius: 18px;
            background: rgba(56, 189, 248, 0.16);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 18px;
        }

        .stat-card h3 {
            font-size: 34px;
            margin-bottom: 6px;
        }

        .stat-card p {
            color: #94a3b8;
            font-size: 14px;
        }

        .stat-card small {
            display: block;
            margin-top: 12px;
            color: #67e8f9;
        }

        /* BOTTOM */
        .bottom-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 22px;
        }

        .panel {
            border-radius: 28px;
            padding: 24px;
            background: rgba(15, 23, 42, 0.72);
            border: 1px solid rgba(148, 163, 184, 0.24);
            backdrop-filter: blur(20px);
        }

        .panel h2 {
            font-size: 21px;
            margin-bottom: 18px;
        }

        .quick-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 14px;
        }

        .quick-card {
            text-decoration: none;
            color: white;
            padding: 18px;
            border-radius: 22px;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(148, 163, 184, 0.22);
            transition: 0.25s;
        }

        .quick-card:hover {
            background: rgba(56, 189, 248, 0.15);
            border-color: rgba(56, 189, 248, 0.45);
            transform: translateY(-4px);
        }

        .quick-card .quick-icon {
            width: 42px;
            height: 42px;
            border-radius: 16px;
            background: rgba(56, 189, 248, 0.15);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 13px;
            font-size: 20px;
        }

        .quick-card strong {
            display: block;
            margin-bottom: 7px;
        }

        .quick-card span {
            color: #94a3b8;
            font-size: 13px;
            line-height: 1.5;
        }

        .notice {
            padding: 15px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(148, 163, 184, 0.18);
            margin-bottom: 12px;
        }

        .notice strong {
            display: block;
            margin-bottom: 6px;
        }

        .notice span {
            color: #94a3b8;
            font-size: 13px;
        }

        @media (max-width: 1150px) {
            .layout {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
            }

            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .bottom-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 700px) {
            .layout {
                padding: 12px;
            }

            .hero,
            .topbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 18px;
            }

            .hero h1 {
                font-size: 30px;
            }

            .hero-building-box {
                width: 100%;
            }

            .search-box {
                width: 100%;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .quick-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <aside class="sidebar">

        <!-- LOGO -->
        <div class="logo-frame">
            <div class="logo-main">

                <div class="real-logo">
                    <div class="logo-building">
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                    </div>
                </div>

                <div class="logo-text">
                    <h2>Blue Tower</h2>
                    <p>Apartment Management</p>
                </div>
            </div>

            <div class="logo-status">
                <span>System online</span>
                <span><b class="status-dot">●</b> Active</span>
            </div>
        </div>

        <div class="menu-title">Điều khiển</div>

        <ul class="menu">
            <li>
                <a href="home.jsp" class="active">
                    <span class="menu-icon">🏠</span>
                    <span>Trang chủ</span>
                </a>
            </li>

            <li>
                <a href="resident.jsp">
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
            <input class="search-box" type="text" placeholder="Tìm cư dân, căn hộ, hóa đơn...">

            <div class="admin-card">
                <div class="admin-avatar">AD</div>
                <div>
                    <strong>Admin</strong>
                    <span>Quản trị viên</span>
                </div>
            </div>
        </div>

        <section class="hero">
            <div class="hero-content">
                <span class="hero-tag">Luxury Apartment Dashboard</span>
                <h1>Quản lý chung cư thông minh</h1>
                <p>
                    Theo dõi cư dân, căn hộ, phương tiện, hóa đơn và phản ánh
                    trên một giao diện hiện đại dành cho ban quản lý tòa nhà.
                </p>
            </div>

            <div class="hero-building-box">
                <div class="big-building">
                    <span></span><span></span><span></span>
                    <span></span><span></span><span></span>
                    <span></span><span></span><span></span>
                    <span></span><span></span><span></span>
                    <span></span><span></span><span></span>
                </div>
            </div>
        </section>

        <section class="stats">

            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <h3>120</h3>
                <p>Tổng cư dân</p>
                <small>+5 cư dân mới trong tháng</small>
            </div>

            <div class="stat-card">
                <div class="stat-icon">🏢</div>
                <h3>48</h3>
                <p>Tổng căn hộ</p>
                <small>36 căn đang sử dụng</small>
            </div>

            <div class="stat-card">
                <div class="stat-icon">💳</div>
                <h3>32</h3>
                <p>Hóa đơn chưa thanh toán</p>
                <small>Cần nhắc thanh toán</small>
            </div>

            <div class="stat-card">
                <div class="stat-icon">💬</div>
                <h3>8</h3>
                <p>Phản ánh mới</p>
                <small>Đang chờ xử lý</small>
            </div>

        </section>

        <section class="bottom-grid">

            <div class="panel">
                <h2>Truy cập nhanh</h2>

                <div class="quick-grid">
                    <a href="resident.jsp" class="quick-card">
                        <div class="quick-icon">👥</div>
                        <strong>Quản lý cư dân</strong>
                        <span>Thêm, sửa, xóa và tìm kiếm thông tin cư dân.</span>
                    </a>

                    <a href="apartment.jsp" class="quick-card">
                        <div class="quick-icon">🏢</div>
                        <strong>Quản lý căn hộ</strong>
                        <span>Quản lý số phòng, diện tích và trạng thái căn hộ.</span>
                    </a>

                    <a href="invoice.jsp" class="quick-card">
                        <div class="quick-icon">💳</div>
                        <strong>Quản lý hóa đơn</strong>
                        <span>Theo dõi phí dịch vụ và tình trạng thanh toán.</span>
                    </a>

                    <a href="feedback.jsp" class="quick-card">
                        <div class="quick-icon">💬</div>
                        <strong>Phản ánh cư dân</strong>
                        <span>Tiếp nhận và xử lý phản ánh từ cư dân.</span>
                    </a>
                </div>
            </div>

            <div class="panel">
                <h2>Hoạt động gần đây</h2>

                <div class="notice">
                    <strong>Bảo trì thang máy khu A</strong>
                    <span>08:00 - 11:00 ngày mai</span>
                </div>

                <div class="notice">
                    <strong>Nhắc thanh toán phí dịch vụ</strong>
                    <span>32 hóa đơn đang chờ xử lý</span>
                </div>

                <div class="notice">
                    <strong>Kiểm tra hệ thống PCCC</strong>
                    <span>Dự kiến thực hiện trong tuần này</span>
                </div>

                <div class="notice">
                    <strong>Phản ánh mới từ cư dân</strong>
                    <span>8 phản ánh chưa được xử lý</span>
                </div>
            </div>

        </section>

    </main>

</div>

</body>
</html>