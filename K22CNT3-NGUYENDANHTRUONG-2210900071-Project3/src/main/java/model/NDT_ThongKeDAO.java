package model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NDT_ThongKeDAO {
    private final JdbcTemplate jdbcTemplate;

    public NDT_ThongKeDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public NDT_ThongKe getThongKe() {
        NDT_ThongKe thongKe = new NDT_ThongKe();

        // Tổng số phòng
        String sqlTongSoPhong = "SELECT COUNT(*) FROM NDT_tblQlyPhongTro";
        thongKe.setTongSoPhong(jdbcTemplate.queryForObject(sqlTongSoPhong, Integer.class));

        // Số phòng trống
        String sqlSoPhongTrong = "SELECT COUNT(*) FROM NDT_tblQlyPhongTro WHERE NDT_TinhTrang = 'Trong'";
        thongKe.setSoPhongTrong(jdbcTemplate.queryForObject(sqlSoPhongTrong, Integer.class));

        // Số phòng đã thuê
        String sqlSoPhongDaThue = "SELECT COUNT(*) FROM NDT_tblQlyPhongTro WHERE NDT_TinhTrang = 'Da Thue'";
        thongKe.setSoPhongDaThue(jdbcTemplate.queryForObject(sqlSoPhongDaThue, Integer.class));

        // Tổng số khách thuê
        String sqlTongKhachThue = "SELECT COUNT(*) FROM NDT_tblKhachThue";
        thongKe.setTongKhachThue(jdbcTemplate.queryForObject(sqlTongKhachThue, Integer.class));

        // Tổng doanh thu
        String sqlDoanhThu = "SELECT SUM(NDT_giaThue) FROM NDT_tblQlyPhongTro WHERE NDT_maPhong IN (SELECT NDT_maPhong FROM NDT_tblHoaDon)";
        Double doanhThu = jdbcTemplate.queryForObject(sqlDoanhThu, Double.class);
        thongKe.setDoanhThu((doanhThu != null) ? doanhThu : 0.0);

        return thongKe;
    }
    public int countStatistics() {
        String sql = "SELECT COUNT(*) FROM NDT_tblThongKe";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count != null ? count : 0;
    }

}
