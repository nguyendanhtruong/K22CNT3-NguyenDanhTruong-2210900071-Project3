package model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ThongKeDAO {

    private final JdbcTemplate jdbcTemplate;

    public ThongKeDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public ThongKe getThongKe() {
        ThongKe thongKe = new ThongKe();

        // Lấy tổng số phòng
        String sqlTongSoPhong = "SELECT COUNT(*) FROM tblQlyPhongTro";
        thongKe.setTongSoPhong(jdbcTemplate.queryForObject(sqlTongSoPhong, Integer.class));

        // Lấy số phòng trống
        String sqlSoPhongTrong = "SELECT COUNT(*) FROM tblQlyPhongTro WHERE TinhTrang = 'Trong'";
        thongKe.setSoPhongTrong(jdbcTemplate.queryForObject(sqlSoPhongTrong, Integer.class));

        // Lấy số phòng đã thuê
        String sqlSoPhongDaThue = "SELECT COUNT(*) FROM tblQlyPhongTro WHERE TinhTrang = 'Da Thue'";
        thongKe.setSoPhongDaThue(jdbcTemplate.queryForObject(sqlSoPhongDaThue, Integer.class));

        // Lấy tổng số khách thuê
        String sqlTongKhachThue = "SELECT COUNT(*) FROM tblKhachThue";
        thongKe.setTongKhachThue(jdbcTemplate.queryForObject(sqlTongKhachThue, Integer.class));

        // Lấy tổng doanh thu từ tiền thuê phòng
        String sqlDoanhThu = "SELECT SUM(giaThue) FROM tblQlyPhongTro WHERE maPhong IN (SELECT maPhong FROM tblHoaDon)";
        Double doanhThu = jdbcTemplate.queryForObject(sqlDoanhThu, Double.class);
        thongKe.setDoanhThu((doanhThu != null) ? doanhThu : 0.0);

        return thongKe;
    }
}
