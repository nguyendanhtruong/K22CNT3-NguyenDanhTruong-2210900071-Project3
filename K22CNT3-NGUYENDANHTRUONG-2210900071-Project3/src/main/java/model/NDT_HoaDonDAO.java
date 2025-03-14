package model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class NDT_HoaDonDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<NDT_HoaDon> getAllNDT_HoaDon() {
        String sql = "SELECT * FROM NDT_tblHoaDon";
        return jdbcTemplate.query(sql, new HoaDonMapper());
    }

    public NDT_HoaDon getNDT_HoaDonById(String id) {
        String sql = "SELECT * FROM NDT_tblHoaDon WHERE NDT_maHD = ?";
        List<NDT_HoaDon> list = jdbcTemplate.query(sql, new HoaDonMapper(), id);
        return list.isEmpty() ? null : list.get(0);
    }

    public boolean isKhachThueExists(String maKT) {
        String sql = "SELECT COUNT(*) FROM ndt_tblkhachthue WHERE NDT_maKT = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, maKT);
        return count != null && count > 0;
    }

    public List<String> getAllKhachThueIds() {
        String sql = "SELECT NDT_maKT FROM ndt_tblkhachthue";
        return jdbcTemplate.queryForList(sql, String.class);
    }

    public int insertNDT_HoaDon(NDT_HoaDon hoaDon) {
        if (!isKhachThueExists(hoaDon.getNDT_maKT())) {
            throw new IllegalArgumentException("Tenant ID (NDT_maKT) '" + hoaDon.getNDT_maKT() + "' does not exist in ndt_tblkhachthue");
        }
        String sql = "INSERT INTO NDT_tblHoaDon (NDT_maHD, NDT_maKT, NDT_maPhong, NDT_tgian) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, hoaDon.getNDT_maHD(), hoaDon.getNDT_maKT(), hoaDon.getNDT_maPhong(), hoaDon.getNDT_tgian());
    }

    public int updateNDT_HoaDon(NDT_HoaDon hoaDon) {
        if (!isKhachThueExists(hoaDon.getNDT_maKT())) {
            throw new IllegalArgumentException("Tenant ID (NDT_maKT) '" + hoaDon.getNDT_maKT() + "' does not exist in ndt_tblkhachthue");
        }
        String sql = "UPDATE NDT_tblHoaDon SET NDT_maKT = ?, NDT_maPhong = ?, NDT_tgian = ? WHERE NDT_maHD = ?";
        return jdbcTemplate.update(sql, hoaDon.getNDT_maKT(), hoaDon.getNDT_maPhong(), hoaDon.getNDT_tgian(), hoaDon.getNDT_maHD());
    }

    public int deleteNDT_HoaDon(String id) {
        String sql = "DELETE FROM NDT_tblHoaDon WHERE NDT_maHD = ?";
        return jdbcTemplate.update(sql, id);
    }

    private static class HoaDonMapper implements RowMapper<NDT_HoaDon> {
        @Override
        public NDT_HoaDon mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new NDT_HoaDon(
                    rs.getString("NDT_maHD"),
                    rs.getString("NDT_maKT"),
                    rs.getString("NDT_maPhong"),
                    rs.getString("NDT_tgian")
            );
        }
    }

    public double calculateMonthlyRevenue() {
        String sql = "SELECT SUM(NDT_tien) FROM NDT_tblHoaDon WHERE MONTH(NDT_tgian) = MONTH(CURRENT_DATE()) AND YEAR(NDT_tgian) = YEAR(CURRENT_DATE())";
        Double revenue = jdbcTemplate.queryForObject(sql, Double.class);
        return revenue != null ? revenue : 0.0;
    }
}