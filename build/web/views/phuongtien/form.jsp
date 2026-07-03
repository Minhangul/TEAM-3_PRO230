<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.PhuongTien" %>

<%
    String mode = (String) request.getAttribute("mode");
    PhuongTien pt = (PhuongTien) request.getAttribute("pt");
    String error = (String) request.getAttribute("error");

    boolean isEdit = "edit".equals(mode);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Sửa phương tiện" : "con caca" %></title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            padding: 30px;
        }

        form {
            width: 450px;
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            margin-top: 18px;
            padding: 10px 15px;
            border: none;
            background: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .back {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<h2><%= isEdit ? "Sửa phương tiện" : "Thêm phương tiện" %></h2>

<form action="${pageContext.request.contextPath}/phuong-tien" method="post">

    <% if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>">

    <% if (isEdit) { %>
        <input type="hidden" name="maPhuongTien" value="<%= pt.getMaPhuongTien() %>">
    <% } %>

    <label>Biển số</label>
    <input type="text" name="bienSo"
           value="<%= isEdit && pt != null ? pt.getBienSo() : "" %>"
           required>

    <label>Loại xe</label>
    <select name="loaiXe" required>
        <option value="">-- Chọn loại xe --</option>

        <option value="Xe máy"
            <%= isEdit && "Xe máy".equals(pt.getLoaiXe()) ? "selected" : "" %>>
            Xe máy
        </option>

        <option value="Ô tô"
            <%= isEdit && "Ô tô".equals(pt.getLoaiXe()) ? "selected" : "" %>>
            Ô tô
        </option>

        <option value="Xe điện"
            <%= isEdit && "Xe điện".equals(pt.getLoaiXe()) ? "selected" : "" %>>
            Xe điện
        </option>
    </select>

    <label>Mã căn hộ</label>
    <input type="number" name="maCanHo"
           value="<%= isEdit && pt != null ? pt.getMaCanHo() : "" %>"
           required>

    <label>Chủ sở hữu</label>
    <input type="text" name="chuSoHuu"
           value="<%= isEdit && pt != null ? pt.getChuSoHuu() : "" %>"
           required>

    <button type="submit">
        <%= isEdit ? "Cập nhật" : "Thêm mới" %>
    </button>
</form>

<a class="back" href="${pageContext.request.contextPath}/phuong-tien">
    Quay lại danh sách
</a>

</body>
</html>