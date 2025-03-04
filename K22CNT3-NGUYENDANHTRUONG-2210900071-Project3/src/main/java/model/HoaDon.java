package model;

import java.util.Date;

public class HoaDon {
    private String maHD;
    private String maKT;
    private String maPhong;
    private Date tgian;  // Đảm bảo kiểu dữ liệu là java.util.Date

    // Constructor
    public HoaDon() {}

    public HoaDon(String maHD, String maKT, String maPhong, Date tgian) {
        this.maHD = maHD;
        this.maKT = maKT;
        this.maPhong = maPhong;
        this.tgian = tgian;
    }

    // Getters and Setters
    public String getMaHD() {
        return maHD;
    }

    public void setMaHD(String maHD) {
        this.maHD = maHD;
    }

    public String getMaKT() {
        return maKT;
    }

    public void setMaKT(String maKT) {
        this.maKT = maKT;
    }

    public String getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(String maPhong) {
        this.maPhong = maPhong;
    }

    public Date getTgian() {  // 💡 Thêm phương thức này để tránh lỗi!
        return tgian;
    }

    public void setTgian(Date tgian) {
        this.tgian = tgian;
    }
}
