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

    public int insertNDT_HoaDon(NDT_HoaDon hoaDon) {
        String sql = "INSERT INTO NDT_tblHoaDon (NDT_maHD, NDT_maKT, NDT_maPhong, NDT_tgian) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, hoaDon.getNDT_maHD(), hoaDon.getNDT_maKT(), hoaDon.getNDT_maPhong(), hoaDon.getNDT_tgian());
    }

    public int updateNDT_HoaDon(NDT_HoaDon hoaDon) {
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
}
