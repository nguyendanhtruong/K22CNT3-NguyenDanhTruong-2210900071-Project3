package model;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class    NDT_TaiKhoanDao {
    private final JdbcTemplate jdbcTemplate;

    public NDT_TaiKhoanDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<NDT_TaiKhoan> getAllAccounts() {
        String sql = "SELECT * FROM NDT_taiKhoan";
        return jdbcTemplate.query(sql, new TaiKhoanMapper());
    }

    public void addAccount(NDT_TaiKhoan account) {
        String sql = "INSERT INTO NDT_taiKhoan (NDT_UserName, NDT_Pass, NDT_Role) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, account.getNDT_UserName(), account.getNDT_Pass(), account.getNDT_Role());
    }

    public boolean deleteAccount(String NDT_UserName) {
        String sql = "DELETE FROM NDT_taiKhoan WHERE NDT_UserName = ?";
        return jdbcTemplate.update(sql, NDT_UserName) > 0;
    }

    public NDT_TaiKhoan getAccountByUsername(String NDT_UserName) {
        String sql = "SELECT * FROM NDT_taiKhoan WHERE NDT_UserName = ?";
        List<NDT_TaiKhoan> accounts = jdbcTemplate.query(sql, new TaiKhoanMapper(), NDT_UserName);
        return accounts.isEmpty() ? null : accounts.get(0);
    }

    public NDT_TaiKhoan checkLogin(String username, String password) {
        String sql = "SELECT * FROM NDT_taiKhoan WHERE NDT_UserName = ? AND NDT_Pass = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new TaiKhoanMapper(), username, password);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public void updateAccount(NDT_TaiKhoan account) {
        String sql = "UPDATE NDT_taiKhoan SET NDT_Pass = ?, NDT_Role = ? WHERE NDT_UserName = ?";
        jdbcTemplate.update(sql, account.getNDT_Pass(), account.getNDT_Role(), account.getNDT_UserName());
    }

    public int countTaiKhoan() {
        String sql = "SELECT COUNT(*) FROM NDT_taiKhoan";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count != null ? count : 0;
    }

    private static class TaiKhoanMapper implements RowMapper<NDT_TaiKhoan> {
        @Override
        public NDT_TaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new NDT_TaiKhoan(
                    rs.getString("NDT_UserName"),
                    rs.getString("NDT_Pass"),
                    rs.getString("NDT_Role")
            );
        }
    }
}
