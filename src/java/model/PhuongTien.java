package model;

public class PhuongTien {
    private int maPhuongTien;
    private String bienSo;
    private String loaiXe;
    private int maCanHo;
    private String chuSoHuu;
    private String trangThai;

    public PhuongTien() {
    }

    public PhuongTien(int maPhuongTien, String bienSo, String loaiXe, int maCanHo, String chuSoHuu, String trangThai) {
        this.maPhuongTien = maPhuongTien;
        this.bienSo = bienSo;
        this.loaiXe = loaiXe;
        this.maCanHo = maCanHo;
        this.chuSoHuu = chuSoHuu;
        this.trangThai = trangThai;
    }

    public int getMaPhuongTien() {
        return maPhuongTien;
    }

    public void setMaPhuongTien(int maPhuongTien) {
        this.maPhuongTien = maPhuongTien;
    }

    public String getBienSo() {
        return bienSo;
    }

    public void setBienSo(String bienSo) {
        this.bienSo = bienSo;
    }

    public String getLoaiXe() {
        return loaiXe;
    }

    public void setLoaiXe(String loaiXe) {
        this.loaiXe = loaiXe;
    }

    public int getMaCanHo() {
        return maCanHo;
    }

    public void setMaCanHo(int maCanHo) {
        this.maCanHo = maCanHo;
    }

    public String getChuSoHuu() {
        return chuSoHuu;
    }

    public void setChuSoHuu(String chuSoHuu) {
        this.chuSoHuu = chuSoHuu;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}