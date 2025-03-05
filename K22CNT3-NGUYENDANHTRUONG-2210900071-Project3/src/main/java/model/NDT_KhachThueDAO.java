package model;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NDT_KhachThueDAO {
    private final JdbcTemplate jdbcTemplate;

    public NDT_KhachThueDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Lấy tất cả khách thuê
    public List<NDT_KhachThue> getAllKhachThue() {
        String sql = "SELECT * FROM NDT_tblKhachThue";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(NDT_KhachThue.class));
    }

    // Lấy khách thuê theo ID
    public NDT_KhachThue getKhachThueById(String NDT_maKT) {
        String sql = "SELECT * FROM NDT_tblKhachThue WHERE NDT_maKT = ?";
        List<NDT_KhachThue> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(NDT_KhachThue.class), NDT_maKT);
        return list.isEmpty() ? null : list.get(0);
    }

    // Thêm khách thuê
    public int addKhachThue(NDT_KhachThue khachThue) {
        String sql = "INSERT INTO NDT_tblKhachThue (NDT_maKT, NDT_HoTen, NDT_NgaySinh, NDT_NgheNghiep, NDT_GioiTinh, NDT_Sdt, NDT_QueQuan, NDT_maPhong) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, khachThue.getNDT_maKT(), khachThue.getNDT_HoTen(), khachThue.getNDT_NgaySinh(),
                khachThue.getNDT_NgheNghiep(), khachThue.getNDT_GioiTinh(), khachThue.getNDT_Sdt(),
                khachThue.getNDT_QueQuan(), khachThue.getNDT_maPhong());
    }

    // Cập nhật khách thuê
    public int updateKhachThue(NDT_KhachThue khachThue) {
        String sql = "UPDATE NDT_tblKhachThue SET NDT_HoTen=?, NDT_NgaySinh=?, NDT_NgheNghiep=?, NDT_GioiTinh=?, NDT_Sdt=?, NDT_QueQuan=?, NDT_maPhong=? WHERE NDT_maKT=?";
        return jdbcTemplate.update(sql, khachThue.getNDT_HoTen(), khachThue.getNDT_NgaySinh(),
                khachThue.getNDT_NgheNghiep(), khachThue.getNDT_GioiTinh(), khachThue.getNDT_Sdt(),
                khachThue.getNDT_QueQuan(), khachThue.getNDT_maPhong(), khachThue.getNDT_maKT());
    }

    // Xóa khách thuê
    public int deleteKhachThue(String NDT_maKT) {
        String sql = "DELETE FROM NDT_tblKhachThue WHERE NDT_maKT = ?";
        return jdbcTemplate.update(sql, NDT_maKT);
    }
}
