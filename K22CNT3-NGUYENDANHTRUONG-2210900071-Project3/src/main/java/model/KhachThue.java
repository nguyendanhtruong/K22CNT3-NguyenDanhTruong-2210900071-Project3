package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class KhachThue {
    private String maKT;
    private String hoTen;
    private String ngaySinh;  // Đổi thành String để tránh lỗi khi lấy dữ liệu từ DB
    private String ngheNghiep;
    private String gioiTinh;
    private String sdt;
    private String queQuan;
    private String maPhong;

    private static final SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

    public KhachThue() {}

    public KhachThue(String maKT, String hoTen, String ngaySinh, String ngheNghiep,
                     String gioiTinh, String sdt, String queQuan, String maPhong) {
        this.maKT = maKT;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.ngheNghiep = ngheNghiep;
        this.gioiTinh = gioiTinh;
        this.sdt = sdt;
        this.queQuan = queQuan;
        this.maPhong = maPhong;
    }

    public String getMaKT() { return maKT; }
    public void setMaKT(String maKT) { this.maKT = maKT; }

    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }

    public String getNgaySinh() { return ngaySinh; }
    public void setNgaySinh(String ngaySinh) { this.ngaySinh = ngaySinh; }

    // Lấy ngày sinh dưới dạng Date (nếu cần)
    public Date getNgaySinhAsDate() {
        try {
            return ngaySinh != null && !ngaySinh.isEmpty() ? sdf.parse(ngaySinh) : null;
        } catch (ParseException e) {
            return null;
        }
    }

    public String getNgheNghiep() { return ngheNghiep; }
    public void setNgheNghiep(String ngheNghiep) { this.ngheNghiep = ngheNghiep; }

    public String getGioiTinh() { return gioiTinh; }
    public void setGioiTinh(String gioiTinh) { this.gioiTinh = gioiTinh; }

    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }

    public String getQueQuan() { return queQuan; }
    public void setQueQuan(String queQuan) { this.queQuan = queQuan; }

    public String getMaPhong() { return maPhong; }
    public void setMaPhong(String maPhong) { this.maPhong = maPhong; }
}
