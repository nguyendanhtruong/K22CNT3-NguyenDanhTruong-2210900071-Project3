package controller;

import model.NDT_TaiKhoan;
import model.NDT_TaiKhoanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller


public class NDT_LoginController {
    private final NDT_TaiKhoanDao taiKhoanDao;

    @Autowired
    public NDT_LoginController(NDT_TaiKhoanDao taiKhoanDao) {
        this.taiKhoanDao = taiKhoanDao;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "NDT_login"; // Hiển thị trang đăng nhập
    }

    @PostMapping("/login")
    public String login(@RequestParam("NDT_UserName") String username,
                        @RequestParam("NDT_Pass") String password,
                        HttpServletRequest request,
                        Model model) {
        NDT_TaiKhoan user = taiKhoanDao.checkLogin(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("admin".equals(user.getNDT_Role())) {
                return "redirect:/admin/AdminDashboard"; // Admin vào trang quản lý tài khoản
            } else {
                return "redirect:/home"; // User vào trang chủ
            }
        } else {
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu sai!");
            return "NDT_login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
