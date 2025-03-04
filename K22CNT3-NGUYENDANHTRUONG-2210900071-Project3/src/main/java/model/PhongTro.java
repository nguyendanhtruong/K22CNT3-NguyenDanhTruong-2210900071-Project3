package model;

public class PhongTro {
    private String maPhong;
    private float dienTich;
    private int soNguoi;
    private double giaThue;
    private String doiTuongThue;
    private String tinhTrang;
    private int chiSoDienMoi;
    private int chiSoDienCu;
    private int chiSoNuocMoi;
    private int chiSoNuocCu;

    // Constructor không tham số
    public PhongTro() {}

    // Constructor đầy đủ tham số
    public PhongTro(String maPhong, float dienTich, int soNguoi, double giaThue, String doiTuongThue, String tinhTrang,
                    int chiSoDienMoi, int chiSoDienCu, int chiSoNuocMoi, int chiSoNuocCu) {
        this.maPhong = maPhong;
        this.dienTich = dienTich;
        this.soNguoi = soNguoi;
        this.giaThue = giaThue;
        this.doiTuongThue = doiTuongThue;
        this.tinhTrang = tinhTrang;
        this.chiSoDienMoi = chiSoDienMoi;
        this.chiSoDienCu = chiSoDienCu;
        this.chiSoNuocMoi = chiSoNuocMoi;
        this.chiSoNuocCu = chiSoNuocCu;
    }

    // Getter & Setter
    public String getMaPhong() { return maPhong; }
    public void setMaPhong(String maPhong) { this.maPhong = maPhong; }

    public float getDienTich() { return dienTich; }
    public void setDienTich(float dienTich) { this.dienTich = dienTich; }

    public int getSoNguoi() { return soNguoi; }
    public void setSoNguoi(int soNguoi) { this.soNguoi = soNguoi; }

    public double getGiaThue() { return giaThue; }
    public void setGiaThue(double giaThue) { this.giaThue = giaThue; }

    public String getDoiTuongThue() { return doiTuongThue; }
    public void setDoiTuongThue(String doiTuongThue) { this.doiTuongThue = doiTuongThue; }

    public String getTinhTrang() { return tinhTrang; }
    public void setTinhTrang(String tinhTrang) { this.tinhTrang = tinhTrang; }

    public int getChiSoDienMoi() { return chiSoDienMoi; }
    public void setChiSoDienMoi(int chiSoDienMoi) { this.chiSoDienMoi = chiSoDienMoi; }

    public int getChiSoDienCu() { return chiSoDienCu; }
    public void setChiSoDienCu(int chiSoDienCu) { this.chiSoDienCu = chiSoDienCu; }

    public int getChiSoNuocMoi() { return chiSoNuocMoi; }
    public void setChiSoNuocMoi(int chiSoNuocMoi) { this.chiSoNuocMoi = chiSoNuocMoi; }

    public int getChiSoNuocCu() { return chiSoNuocCu; }
    public void setChiSoNuocCu(int chiSoNuocCu) { this.chiSoNuocCu = chiSoNuocCu; }
}
