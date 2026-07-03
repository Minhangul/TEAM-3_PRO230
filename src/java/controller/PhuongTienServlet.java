package controller;

import dao.PhuongTienDAO;
import model.PhuongTien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "PhuongTienServlet", urlPatterns = {"/phuong-tien"})
public class PhuongTienServlet extends HttpServlet {

    private PhuongTienDAO dao = new PhuongTienDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        try {
            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "add":
                    showAddForm(request, response);
                    break;

                case "edit":
                    showEditForm(request, response);
                    break;

                case "stop":
                    stopPhuongTien(request, response);
                    break;

                default:
                    listPhuongTien(request, response);
                    break;
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        try {
            if ("insert".equals(action)) {
                insertPhuongTien(request, response);
            } else if ("update".equals(action)) {
                updatePhuongTien(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/phuong-tien");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listPhuongTien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setAttribute("list", dao.getAll());
        request.getRequestDispatcher("/views/phuongtien/list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setAttribute("mode", "add");
        request.getRequestDispatcher("/views/phuongtien/form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        PhuongTien pt = dao.getById(id);

        request.setAttribute("pt", pt);
        request.setAttribute("mode", "edit");
        request.getRequestDispatcher("/views/phuongtien/form.jsp").forward(request, response);
    }

    private void insertPhuongTien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String bienSo = request.getParameter("bienSo");
        String loaiXe = request.getParameter("loaiXe");
        int maCanHo = Integer.parseInt(request.getParameter("maCanHo"));
        String chuSoHuu = request.getParameter("chuSoHuu");

        if (dao.isBienSoTrung(bienSo, 0)) {
            request.setAttribute("error", "Biển số đã tồn tại!");
            request.setAttribute("mode", "add");
            request.getRequestDispatcher("/views/phuongtien/form.jsp").forward(request, response);
            return;
        }

        if (!dao.canHoCoHopDongHieuLuc(maCanHo)) {
            request.setAttribute("error", "Căn hộ chưa có cư dân hoặc chưa có hợp đồng hiệu lực!");
            request.setAttribute("mode", "add");
            request.getRequestDispatcher("/views/phuongtien/form.jsp").forward(request, response);
            return;
        }

        PhuongTien pt = new PhuongTien();
        pt.setBienSo(bienSo);
        pt.setLoaiXe(loaiXe);
        pt.setMaCanHo(maCanHo);
        pt.setChuSoHuu(chuSoHuu);

        dao.insert(pt);

        response.sendRedirect(request.getContextPath() + "/phuong-tien");
    }

    private void updatePhuongTien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int maPhuongTien = Integer.parseInt(request.getParameter("maPhuongTien"));
        String bienSo = request.getParameter("bienSo");
        String loaiXe = request.getParameter("loaiXe");
        int maCanHo = Integer.parseInt(request.getParameter("maCanHo"));
        String chuSoHuu = request.getParameter("chuSoHuu");

        PhuongTien pt = new PhuongTien();
        pt.setMaPhuongTien(maPhuongTien);
        pt.setBienSo(bienSo);
        pt.setLoaiXe(loaiXe);
        pt.setMaCanHo(maCanHo);
        pt.setChuSoHuu(chuSoHuu);

        if (dao.isBienSoTrung(bienSo, maPhuongTien)) {
            request.setAttribute("error", "Biển số đã tồn tại!");
            request.setAttribute("pt", pt);
            request.setAttribute("mode", "edit");
            request.getRequestDispatcher("/views/phuongtien/form.jsp").forward(request, response);
            return;
        }

        if (!dao.canHoCoHopDongHieuLuc(maCanHo)) {
            request.setAttribute("error", "Căn hộ chưa có cư dân hoặc chưa có hợp đồng hiệu lực!");
            request.setAttribute("pt", pt);
            request.setAttribute("mode", "edit");
            request.getRequestDispatcher("/views/phuongtien/form.jsp").forward(request, response);
            return;
        }

        dao.update(pt);

        response.sendRedirect(request.getContextPath() + "/phuong-tien");
    }

    private void stopPhuongTien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.softDelete(id);

        response.sendRedirect(request.getContextPath() + "/phuong-tien");
    }
}