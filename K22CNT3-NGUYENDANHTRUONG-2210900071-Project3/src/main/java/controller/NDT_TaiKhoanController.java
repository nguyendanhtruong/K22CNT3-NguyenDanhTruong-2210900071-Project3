package controller;

import model.NDT_TaiKhoan;
import model.NDT_TaiKhoanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class NDT_TaiKhoanController {
    private final NDT_TaiKhoanDao taiKhoanDao;

    @Autowired
    public NDT_TaiKhoanController(NDT_TaiKhoanDao taiKhoanDao) {
        this.taiKhoanDao = taiKhoanDao;
    }

    // ✅ Hiển thị danh sách tài khoản trên AdminDashboard
    @GetMapping("/AdminDashboard")
    public String listAccountsAdminDashboard(Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        List<NDT_TaiKhoan> list = taiKhoanDao.getAllAccounts();
        model.addAttribute("taikhoan", list); // Đồng bộ với JSP

        return "admin/AdminDashboard";
    }

    // ✅ Hiển thị danh sách tài khoản trên taikhoan.jsp
    @GetMapping("/taikhoan")
    public String listAccountsTaikhoan(Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        List<NDT_TaiKhoan> list = taiKhoanDao.getAllAccounts();
        model.addAttribute("taikhoan", list);
        return "admin/taikhoan";
    }

    // ✅ Thêm tài khoản
    @PostMapping("/add")
    public String addAccount(@RequestParam String NDT_UserName,
                             @RequestParam String NDT_Pass,
                             @RequestParam String NDT_Role,
                             HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        NDT_TaiKhoan newAccount = new NDT_TaiKhoan(NDT_UserName, NDT_Pass, NDT_Role);
        taiKhoanDao.addAccount(newAccount);

        return "redirect:/admin/AdminDashboard";
    }

    // ✅ Xóa tài khoản
    @PostMapping("/delete")
    public String deleteAccount(@RequestParam String NDT_UserName, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        taiKhoanDao.deleteAccount(NDT_UserName);
        return "redirect:/admin/AdminDashboard";
    }

    // ✅ Cập nhật tài khoản
    @PostMapping("/edit")
    public String editAccount(@RequestParam String NDT_UserName,
                              @RequestParam String NDT_Pass,
                              @RequestParam String NDT_Role,
                              HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        NDT_TaiKhoan updatedAccount = new NDT_TaiKhoan(NDT_UserName, NDT_Pass, NDT_Role);
        taiKhoanDao.updateAccount(updatedAccount);

        return "redirect:/admin/AdminDashboard";
    }

    // ✅ Kiểm tra quyền admin
    private boolean isAdmin(HttpSession session) {
        NDT_TaiKhoan user = (NDT_TaiKhoan) session.getAttribute("user");
        return user != null && "admin".equals(user.getNDT_Role());
    }
}
