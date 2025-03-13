package model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class NDT_PhongTroDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public NDT_PhongTroDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // ✅ Lấy danh sách phòng trọ có tìm kiếm và lọc trạng thái
    public List<NDT_PhongTro> getAllPhongTro(int page, int size, String search, String status) {
        StringBuilder sql = new StringBuilder("SELECT * FROM NDT_tblQlyPhongTro WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (search != null && !search.trim().isEmpty()) {
            sql.append(" AND (NDT_maPhong LIKE ? OR NDT_DoiTuongThue LIKE ? OR NDT_moTa LIKE ?)");
            params.add("%" + search.trim() + "%");
            params.add("%" + search.trim() + "%");
            params.add("%" + search.trim() + "%");
        }

        if (status != null && !status.trim().isEmpty()) {
            sql.append(" AND NDT_TinhTrang = ?");
            params.add(status.trim());
        }

        sql.append(" LIMIT ? OFFSET ?");
        params.add(size);
        params.add((page - 1) * size);

        return jdbcTemplate.query(sql.toString(), new BeanPropertyRowMapper<>(NDT_PhongTro.class), params.toArray());
    }

    // ✅ Đếm số lượng phòng trọ có tìm kiếm và lọc trạng thái
    public int countPhongTro(String search, String status) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM NDT_tblQlyPhongTro WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (search != null && !search.trim().isEmpty()) {
            sql.append(" AND (NDT_maPhong LIKE ? OR NDT_DoiTuongThue LIKE ? OR NDT_moTa LIKE ?)");
            params.add("%" + search.trim() + "%");
            params.add("%" + search.trim() + "%");
            params.add("%" + search.trim() + "%");
        }

        if (status != null && !status.trim().isEmpty()) {
            sql.append(" AND NDT_TinhTrang = ?");
            params.add(status.trim());
        }

        return jdbcTemplate.queryForObject(sql.toString(), Integer.class, params.toArray());
    }

    // ✅ Lấy thông tin phòng trọ theo ID
    public NDT_PhongTro getPhongTroById(String id) {
        try {
            String sql = "SELECT * FROM NDT_tblQlyPhongTro WHERE NDT_maPhong = ?";
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(NDT_PhongTro.class), id);
        } catch (Exception e) {
            return null;
        }
    }

    // ✅ Thêm phòng trọ (có mô tả)
    public void addPhongTro(NDT_PhongTro phongTro) {
        String sql = "INSERT INTO NDT_tblQlyPhongTro VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, phongTro.getNDT_maPhong(), phongTro.getNDT_dienTich(), phongTro.getNDT_soNguoi(),
                phongTro.getNDT_giaThue(), phongTro.getNDT_DoiTuongThue(), phongTro.getNDT_TinhTrang(),
                phongTro.getNDT_chiSoDienMoi(), phongTro.getNDT_chiSoDienCu(), phongTro.getNDT_chiSoNuocMoi(),
                phongTro.getNDT_chiSoNuocCu(), phongTro.getNDT_moTa());
    }

    // ✅ Cập nhật phòng trọ (có mô tả)
    public void updatePhongTro(NDT_PhongTro phongTro) {
        String sql = "UPDATE NDT_tblQlyPhongTro SET NDT_dienTich = ?, NDT_soNguoi = ?, NDT_giaThue = ?, NDT_DoiTuongThue = ?, NDT_TinhTrang = ?, NDT_chiSoDienMoi = ?, NDT_chiSoDienCu = ?, NDT_chiSoNuocMoi = ?, NDT_chiSoNuocCu = ?, NDT_moTa = ? WHERE NDT_maPhong = ?";
        jdbcTemplate.update(sql, phongTro.getNDT_dienTich(), phongTro.getNDT_soNguoi(), phongTro.getNDT_giaThue(),
                phongTro.getNDT_DoiTuongThue(), phongTro.getNDT_TinhTrang(), phongTro.getNDT_chiSoDienMoi(),
                phongTro.getNDT_chiSoDienCu(), phongTro.getNDT_chiSoNuocMoi(), phongTro.getNDT_chiSoNuocCu(),
                phongTro.getNDT_moTa(), phongTro.getNDT_maPhong());
    }

    // ✅ Xóa phòng trọ
    public void deletePhongTro(String id) {
        try {
            String sql = "DELETE FROM NDT_tblQlyPhongTro WHERE NDT_maPhong = ?";
            jdbcTemplate.update(sql, id);
        } catch (Exception e) {
            System.out.println("⚠️ Không thể xóa phòng trọ (có thể có dữ liệu liên quan): " + e.getMessage());
        }
    }

    // ✅ Cập nhật trạng thái phòng trọ
    public void updateTrangThaiPhong(String maPhong, String tinhTrang) {
        String sql = "UPDATE NDT_tblQlyPhongTro SET NDT_TinhTrang = ? WHERE NDT_maPhong = ?";
        jdbcTemplate.update(sql, tinhTrang, maPhong);
    }
}
