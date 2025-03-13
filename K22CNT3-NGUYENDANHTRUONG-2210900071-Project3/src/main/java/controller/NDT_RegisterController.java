package controller;

import model.NDT_TaiKhoan;
import model.NDT_TaiKhoanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/register")
public class NDT_RegisterController {
    private final NDT_TaiKhoanDao taiKhoanDao;

    @Autowired
    public NDT_RegisterController(NDT_TaiKhoanDao taiKhoanDao) {
        this.taiKhoanDao = taiKhoanDao;
    }

    @GetMapping
    public String showRegisterPage() {
        return "NDT_Register"; // Trả về trang JSP đăng ký
    }

    @PostMapping
    public String register(@RequestParam String NDT_UserName,
                           @RequestParam String NDT_Pass,
                           Model model) {
        // Kiểm tra nếu tên đăng nhập đã tồn tại
        if (taiKhoanDao.getAccountByUsername(NDT_UserName) != null) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
            return "NDT_Register";
        }

        // Tạo tài khoản mới với quyền mặc định là "user"
        NDT_TaiKhoan newAccount = new NDT_TaiKhoan(NDT_UserName, NDT_Pass, "user");
        taiKhoanDao.addAccount(newAccount);

        return "redirect:/login"; // Chuyển hướng về trang đăng nhập sau khi đăng ký thành công
    }
}
