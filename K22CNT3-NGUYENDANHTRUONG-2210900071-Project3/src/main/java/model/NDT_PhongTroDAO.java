package model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class NDT_PhongTroDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public NDT_PhongTroDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        System.out.println("✅ jdbcTemplate đã được inject: " + (jdbcTemplate != null));
    }

    // ✅ Lấy danh sách phòng trọ với tìm kiếm và phân trang
    public List<NDT_PhongTro> getAllPhongTro(int page, int size, String search, String status) {
        String sql = "SELECT * FROM NDT_tblQlyPhongTro WHERE 1=1";
        Object[] params = new Object[0];

        // Xây dựng truy vấn động
        if (search != null && !search.trim().isEmpty()) {
            sql += " AND (NDT_maPhong LIKE ? OR NDT_DoiTuongThue LIKE ?)";
            params = appendToParams(params, "%" + search + "%", "%" + search + "%");
        }
        if (status != null && !status.trim().isEmpty()) {
            sql += " AND NDT_TinhTrang = ?";
            params = appendToParams(params, status);
        }

        // Thêm phân trang
        sql += " LIMIT ? OFFSET ?";
        params = appendToParams(params, size, (page - 1) * size);

        List<NDT_PhongTro> list = jdbcTemplate.query(sql, params, new BeanPropertyRowMapper<>(NDT_PhongTro.class));

        System.out.println("✅ Số phòng trọ lấy được: " + list.size());
        return list;
    }

    // ✅ Đếm tổng số phòng trọ
    public int countPhongTro(String search, String status) {
        String sql = "SELECT COUNT(*) FROM NDT_tblQlyPhongTro WHERE 1=1";
        Object[] params = new Object[0];

        if (search != null && !search.trim().isEmpty()) {
            sql += " AND (NDT_maPhong LIKE ? OR NDT_DoiTuongThue LIKE ?)";
            params = appendToParams(params, "%" + search + "%", "%" + search + "%");
        }
        if (status != null && !status.trim().isEmpty()) {
            sql += " AND NDT_TinhTrang = ?";
            params = appendToParams(params, status);
        }

        Integer count = jdbcTemplate.queryForObject(sql, params, Integer.class);
        return count != null ? count : 0;
    }

    // ✅ Lấy thông tin phòng trọ theo ID
    public NDT_PhongTro getPhongTroById(String id) {
        try {
            String sql = "SELECT * FROM NDT_tblQlyPhongTro WHERE NDT_maPhong = ?";
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(NDT_PhongTro.class), id);
        } catch (Exception e) {
            System.out.println("⚠️ Lỗi khi lấy phòng trọ: " + e.getMessage());
            return null;
        }
    }

    // ✅ Thêm phòng trọ
    public void addPhongTro(NDT_PhongTro phongTro) {
        String sql = "INSERT INTO NDT_tblQlyPhongTro (NDT_maPhong, NDT_dienTich, NDT_soNguoi, NDT_giaThue, NDT_DoiTuongThue, NDT_TinhTrang, NDT_chiSoDienMoi, NDT_chiSoDienCu, NDT_chiSoNuocMoi, NDT_chiSoNuocCu) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, phongTro.getNDT_maPhong(), phongTro.getNDT_dienTich(), phongTro.getNDT_soNguoi(),
                phongTro.getNDT_giaThue(), phongTro.getNDT_DoiTuongThue(), phongTro.getNDT_TinhTrang(),
                phongTro.getNDT_chiSoDienMoi(), phongTro.getNDT_chiSoDienCu(), phongTro.getNDT_chiSoNuocMoi(), phongTro.getNDT_chiSoNuocCu());
    }

    // ✅ Cập nhật phòng trọ
    public void updatePhongTro(NDT_PhongTro phongTro) {
        String sql = "UPDATE NDT_tblQlyPhongTro SET NDT_dienTich = ?, NDT_soNguoi = ?, NDT_giaThue = ?, NDT_DoiTuongThue = ?, NDT_TinhTrang = ?, NDT_chiSoDienMoi = ?, NDT_chiSoDienCu = ?, NDT_chiSoNuocMoi = ?, NDT_chiSoNuocCu = ? WHERE NDT_maPhong = ?";
        jdbcTemplate.update(sql, phongTro.getNDT_dienTich(), phongTro.getNDT_soNguoi(), phongTro.getNDT_giaThue(),
                phongTro.getNDT_DoiTuongThue(), phongTro.getNDT_TinhTrang(), phongTro.getNDT_chiSoDienMoi(),
                phongTro.getNDT_chiSoDienCu(), phongTro.getNDT_chiSoNuocMoi(), phongTro.getNDT_chiSoNuocCu(),
                phongTro.getNDT_maPhong());
    }

    // ✅ Xóa phòng trọ
    public void deletePhongTro(String id) {
        String sql = "DELETE FROM NDT_tblQlyPhongTro WHERE NDT_maPhong = ?";
        jdbcTemplate.update(sql, id);
    }

    // 🔹 Hàm tiện ích để thêm tham số động vào mảng Object[]
    private Object[] appendToParams(Object[] original, Object... newParams) {
        Object[] combined = new Object[original.length + newParams.length];
        System.arraycopy(original, 0, combined, 0, original.length);
        System.arraycopy(newParams, 0, combined, original.length, newParams.length);
        return combined;
    }
}
