package model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class PhongTroDAO {
    private final JdbcTemplate jdbcTemplate;

    public PhongTroDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Lấy danh sách tất cả phòng trọ
    public List<PhongTro> getAllPhongTro() {
        String sql = "SELECT * FROM tblQlyPhongTro";
        return jdbcTemplate.query(sql, new PhongTroMapper());
    }

    // Thêm phòng trọ
    public void addPhongTro(PhongTro phongTro) {
        String sql = "INSERT INTO tblQlyPhongTro (maPhong, dienTich, soNguoi, giaThue, DoiTuongThue, TinhTrang, chiSoDienMoi, chiSoDienCu, chiSoNuocMoi, chiSoNuocCu) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, phongTro.getMaPhong(), phongTro.getDienTich(), phongTro.getSoNguoi(), phongTro.getGiaThue(),
                phongTro.getDoiTuongThue(), phongTro.getTinhTrang(), phongTro.getChiSoDienMoi(), phongTro.getChiSoDienCu(),
                phongTro.getChiSoNuocMoi(), phongTro.getChiSoNuocCu());
    }

    // Cập nhật thông tin phòng trọ
    public void updatePhongTro(PhongTro phongTro) {
        String sql = "UPDATE tblQlyPhongTro SET dienTich=?, soNguoi=?, giaThue=?, DoiTuongThue=?, TinhTrang=?, chiSoDienMoi=?, chiSoDienCu=?, chiSoNuocMoi=?, chiSoNuocCu=? " +
                "WHERE maPhong=?";
        jdbcTemplate.update(sql, phongTro.getDienTich(), phongTro.getSoNguoi(), phongTro.getGiaThue(), phongTro.getDoiTuongThue(),
                phongTro.getTinhTrang(), phongTro.getChiSoDienMoi(), phongTro.getChiSoDienCu(), phongTro.getChiSoNuocMoi(),
                phongTro.getChiSoNuocCu(), phongTro.getMaPhong());
    }

    // Xóa phòng trọ theo mã phòng
    public void deletePhongTro(String maPhong) {
        String sql = "DELETE FROM tblQlyPhongTro WHERE maPhong=?";
        jdbcTemplate.update(sql, maPhong);
    }

    // Tìm phòng trọ theo mã phòng
    public PhongTro getPhongTroById(String maPhong) {
        String sql = "SELECT * FROM tblQlyPhongTro WHERE maPhong=?";
        return jdbcTemplate.queryForObject(sql, new PhongTroMapper(), maPhong);
    }

    // Mapper để ánh xạ dữ liệu từ ResultSet sang PhongTro object
    private static class PhongTroMapper implements RowMapper<PhongTro> {
        @Override
        public PhongTro mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new PhongTro(
                    rs.getString("maPhong"),
                    rs.getFloat("dienTich"),
                    rs.getInt("soNguoi"),
                    rs.getDouble("giaThue"),
                    rs.getString("DoiTuongThue"),
                    rs.getString("TinhTrang"),
                    rs.getInt("chiSoDienMoi"),
                    rs.getInt("chiSoDienCu"),
                    rs.getInt("chiSoNuocMoi"),
                    rs.getInt("chiSoNuocCu")
            );
        }
    }
}
