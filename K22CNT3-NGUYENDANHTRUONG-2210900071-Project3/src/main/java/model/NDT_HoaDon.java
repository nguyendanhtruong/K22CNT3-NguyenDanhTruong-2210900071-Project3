package model;

public class NDT_HoaDon {
    private String NDT_maHD;
    private String NDT_maKT;
    private String NDT_maPhong;
    private String NDT_tgian;

    public NDT_HoaDon() {}

    public NDT_HoaDon(String NDT_maHD, String NDT_maKT, String NDT_maPhong, String NDT_tgian) {
        this.NDT_maHD = NDT_maHD;
        this.NDT_maKT = NDT_maKT;
        this.NDT_maPhong = NDT_maPhong;
        this.NDT_tgian = NDT_tgian;
    }

    public String getNDT_maHD() {
        return NDT_maHD;
    }

    public void setNDT_maHD(String NDT_maHD) {
        this.NDT_maHD = NDT_maHD;
    }

    public String getNDT_maKT() {
        return NDT_maKT;
    }

    public void setNDT_maKT(String NDT_maKT) {
        this.NDT_maKT = NDT_maKT;
    }

    public String getNDT_maPhong() {
        return NDT_maPhong;
    }

    public void setNDT_maPhong(String NDT_maPhong) {
        this.NDT_maPhong = NDT_maPhong;
    }

    public String getNDT_tgian() {
        return NDT_tgian;
    }

    public void setNDT_tgian(String NDT_tgian) {
        this.NDT_tgian = NDT_tgian;
    }
}
