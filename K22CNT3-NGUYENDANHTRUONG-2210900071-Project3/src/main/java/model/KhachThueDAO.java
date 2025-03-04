package model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Repository
public class KhachThueDAO {
    private JdbcTemplate template;

    // Setter injection để Spring có thể thiết lập template qua XML
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Lấy danh sách khách thuê
    public List<KhachThue> getAllKhachThue() {
        String sql = "SELECT * FROM tblKhachThue";
        return template.query(sql, new RowMapper<KhachThue>() {
            @Override
            public KhachThue mapRow(ResultSet rs, int rowNum) throws SQLException {
                KhachThue khachThue = new KhachThue();
                khachThue.setMaKT(rs.getString("maKT"));
                khachThue.setHoTen(rs.getString("HoTen"));

                // Chuyển đổi ngày sinh từ DATE sang String
                Date ngaySinh = rs.getDate("NgaySinh");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                khachThue.setNgaySinh(ngaySinh != null ? sdf.format(ngaySinh) : "");

                khachThue.setNgheNghiep(rs.getString("NgheNghiep"));
                khachThue.setGioiTinh(rs.getString("GioiTinh"));
                khachThue.setSdt(rs.getString("Sdt"));
                khachThue.setQueQuan(rs.getString("QueQuan"));
                khachThue.setMaPhong(rs.getString("maPhong"));

                return khachThue;
            }
        });
    }

    // Thêm khách thuê
    public int addKhachThue(KhachThue khachThue) {
        String sql = "INSERT INTO tblKhachThue(maKT, HoTen, NgaySinh, NgheNghiep, GioiTinh, Sdt, QueQuan, maPhong) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        return template.update(sql, khachThue.getMaKT(), khachThue.getHoTen(), khachThue.getNgaySinh(),
                khachThue.getNgheNghiep(), khachThue.getGioiTinh(), khachThue.getSdt(),
                khachThue.getQueQuan(), khachThue.getMaPhong());
    }

    // Xóa khách thuê
    public int deleteKhachThue(String maKT) {
        String sql = "DELETE FROM tblKhachThue WHERE maKT = ?";
        return template.update(sql, maKT);
    }

    // Lấy khách thuê theo mã ID
    public KhachThue getKhachThueById(String maKT) {
        String sql = "SELECT * FROM tblKhachThue WHERE maKT = ?";
        return template.queryForObject(sql, new Object[]{maKT}, (rs, rowNum) -> {
            KhachThue khachThue = new KhachThue();
            khachThue.setMaKT(rs.getString("maKT"));
            khachThue.setHoTen(rs.getString("HoTen"));

            // Chuyển đổi ngày sinh từ DATE sang String
            Date ngaySinh = rs.getDate("NgaySinh");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            khachThue.setNgaySinh(ngaySinh != null ? sdf.format(ngaySinh) : "");

            khachThue.setNgheNghiep(rs.getString("NgheNghiep"));
            khachThue.setGioiTinh(rs.getString("GioiTinh"));
            khachThue.setSdt(rs.getString("Sdt"));
            khachThue.setQueQuan(rs.getString("QueQuan"));
            khachThue.setMaPhong(rs.getString("maPhong"));

            return khachThue;
        });
    }

    // Cập nhật khách thuê
    public int updateKhachThue(KhachThue khachThue) {
        String sql = "UPDATE tblKhachThue SET HoTen=?, NgaySinh=?, NgheNghiep=?, GioiTinh=?, Sdt=?, QueQuan=?, maPhong=? WHERE maKT=?";
        return template.update(sql, khachThue.getHoTen(), khachThue.getNgaySinh(), khachThue.getNgheNghiep(),
                khachThue.getGioiTinh(), khachThue.getSdt(), khachThue.getQueQuan(),
                khachThue.getMaPhong(), khachThue.getMaKT());
    }
}
