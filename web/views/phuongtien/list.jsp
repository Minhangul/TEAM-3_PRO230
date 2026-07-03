<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.PhuongTien" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý phương tiện</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            padding: 30px;
        }

        h2 {
            color: #333;
        }

        .btn {
            display: inline-block;
            padding: 8px 14px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .btn-edit {
            background: #ffc107;
            color: black;
        }

        .btn-stop {
            background: #dc3545;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #343a40;
            color: white;
        }

        .active {
            color: green;
            font-weight: bold;
        }

        .inactive {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Quản lý phương tiện</h2>

<a class="btn" href="${pageContext.request.contextPath}/phuong-tien?action=add">
    + Thêm phương tiện
</a>

<table>
    <tr>
        <th>Mã</th>
        <th>Biển số</th>
        <th>Loại xe</th>
        <th>Mã căn hộ</th>
        <th>Chủ sở hữu</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
    </tr>

    <%
        List<PhuongTien> list = (List<PhuongTien>) request.getAttribute("list");

        if (list != null && !list.isEmpty()) {
            for (PhuongTien pt : list) {
    %>
    <tr>
        <td><%= pt.getMaPhuongTien() %></td>
        <td><%= pt.getBienSo() %></td>
        <td><%= pt.getLoaiXe() %></td>
        <td><%= pt.getMaCanHo() %></td>
        <td><%= pt.getChuSoHuu() %></td>

        <td>
            <% if ("Đang hoạt động".equals(pt.getTrangThai())) { %>
                <span class="active"><%= pt.getTrangThai() %></span>
            <% } else { %>
                <span class="inactive"><%= pt.getTrangThai() %></span>
            <% } %>
        </td>

        <td>
            <a class="btn btn-edit"
               href="${pageContext.request.contextPath}/phuong-tien?action=edit&id=<%= pt.getMaPhuongTien() %>">
                Sửa
            </a>

            <% if ("Đang hoạt động".equals(pt.getTrangThai())) { %>
                <a class="btn btn-stop"
                   onclick="return confirm('Bạn có chắc muốn ngừng hoạt động phương tiện này không?')"
                   href="${pageContext.request.contextPath}/phuong-tien?action=stop&id=<%= pt.getMaPhuongTien() %>">
                    Ngừng
                </a>
            <% } %>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="7">Chưa có phương tiện nào.</td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>