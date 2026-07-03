package dao;

import model.PhuongTien;
import connect.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PhuongTienDAO {

    public List<PhuongTien> getAll() throws Exception {
        List<PhuongTien> list = new ArrayList<>();

        String sql = "SELECT * FROM PhuongTien ORDER BY MaPhuongTien DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PhuongTien pt = new PhuongTien();
                pt.setMaPhuongTien(rs.getInt("MaPhuongTien"));
                pt.setBienSo(rs.getString("BienSo"));
                pt.setLoaiXe(rs.getString("LoaiXe"));
                pt.setMaCanHo(rs.getInt("MaCanHo"));
                pt.setChuSoHuu(rs.getString("ChuSoHuu"));
                pt.setTrangThai(rs.getString("TrangThai"));

                list.add(pt);
            }
        }

        return list;
    }

    public PhuongTien getById(int id) throws Exception {
        String sql = "SELECT * FROM PhuongTien WHERE MaPhuongTien = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    PhuongTien pt = new PhuongTien();
                    pt.setMaPhuongTien(rs.getInt("MaPhuongTien"));
                    pt.setBienSo(rs.getString("BienSo"));
                    pt.setLoaiXe(rs.getString("LoaiXe"));
                    pt.setMaCanHo(rs.getInt("MaCanHo"));
                    pt.setChuSoHuu(rs.getString("ChuSoHuu"));
                    pt.setTrangThai(rs.getString("TrangThai"));
                    return pt;
                }
            }
        }

        return null;
    }

    public boolean isBienSoTrung(String bienSo, int maPhuongTien) throws Exception {
        String sql = """
                SELECT COUNT(*) 
                FROM PhuongTien 
                WHERE BienSo = ? 
                  AND TrangThai = N'Đang hoạt động'
                  AND MaPhuongTien <> ?
                """;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, bienSo);
            ps.setInt(2, maPhuongTien);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }

        return false;
    }

    public boolean canHoCoHopDongHieuLuc(int maCanHo) throws Exception {
        String sql = """
                SELECT COUNT(*) 
                FROM HopDong 
                WHERE MaCanHo = ? 
                  AND (TrangThai = N'Đang thuê' OR TrangThai = N'Active')
                """;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maCanHo);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }

        return false;
    }

    public void insert(PhuongTien pt) throws Exception {
        String sql = """
                INSERT INTO PhuongTien (BienSo, LoaiXe, MaCanHo, ChuSoHuu, TrangThai)
                VALUES (?, ?, ?, ?, N'Đang hoạt động')
                """;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, pt.getBienSo());
            ps.setString(2, pt.getLoaiXe());
            ps.setInt(3, pt.getMaCanHo());
            ps.setString(4, pt.getChuSoHuu());

            ps.executeUpdate();
        }
    }

    public void update(PhuongTien pt) throws Exception {
        String sql = """
                UPDATE PhuongTien
                SET BienSo = ?, LoaiXe = ?, MaCanHo = ?, ChuSoHuu = ?
                WHERE MaPhuongTien = ?
                """;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, pt.getBienSo());
            ps.setString(2, pt.getLoaiXe());
            ps.setInt(3, pt.getMaCanHo());
            ps.setString(4, pt.getChuSoHuu());
            ps.setInt(5, pt.getMaPhuongTien());

            ps.executeUpdate();
        }
    }

    public void softDelete(int id) throws Exception {
        String sql = """
                UPDATE PhuongTien
                SET TrangThai = N'Ngừng hoạt động'
                WHERE MaPhuongTien = ?
                """;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}