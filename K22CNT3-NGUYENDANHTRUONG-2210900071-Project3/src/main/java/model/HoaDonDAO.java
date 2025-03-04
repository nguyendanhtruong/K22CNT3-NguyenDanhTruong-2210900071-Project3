package model;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class HoaDonDAO {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // 1️⃣ Lấy danh sách tất cả hóa đơn
    public List<HoaDon> getAllHoaDon() {
        String sql = "SELECT * FROM tblHoaDon";
        return template.query(sql, (rs, rowNum) -> mapHoaDon(rs));
    }

    // 2️⃣ Lấy hóa đơn theo mã (dùng cho chức năng cập nhật)
    public HoaDon getHoaDonById(String maHD) {
        String sql = "SELECT * FROM tblHoaDon WHERE maHD=?";
        try {
            return template.queryForObject(sql, new Object[]{maHD}, (rs, rowNum) -> mapHoaDon(rs));
        } catch (DataAccessException e) {
            return null; // Trả về null nếu không tìm thấy hóa đơn
        }
    }

    // 3️⃣ Thêm hóa đơn mới vào CSDL
    public int addHoaDon(HoaDon hoaDon) {
        String sql = "INSERT INTO tblHoaDon (maHD, maKT, maPhong, tgian) VALUES (?, ?, ?, ?)";
        return template.update(sql, hoaDon.getMaHD(), hoaDon.getMaKT(), hoaDon.getMaPhong(), hoaDon.getTgian());
    }

    // 4️⃣ Cập nhật thông tin hóa đơn
    public int updateHoaDon(HoaDon hoaDon) {
        String sql = "UPDATE tblHoaDon SET maKT=?, maPhong=?, tgian=? WHERE maHD=?";
        return template.update(sql, hoaDon.getMaKT(), hoaDon.getMaPhong(), hoaDon.getTgian(), hoaDon.getMaHD());
    }

    // 5️⃣ Xóa hóa đơn theo mã
    public int deleteHoaDon(String maHD) {
        String sql = "DELETE FROM tblHoaDon WHERE maHD=?";
        return template.update(sql, maHD);
    }

    // 🔹 Phương thức hỗ trợ ánh xạ dữ liệu từ ResultSet sang HoaDon
    private HoaDon mapHoaDon(ResultSet rs) throws SQLException {
        HoaDon hoaDon = new HoaDon();
        hoaDon.setMaHD(rs.getString("maHD"));
        hoaDon.setMaKT(rs.getString("maKT"));
        hoaDon.setMaPhong(rs.getString("maPhong"));
        hoaDon.setTgian(rs.getDate("tgian"));
        return hoaDon;
    }
}
