package controller;

import model.NDT_TaiKhoan;
import model.NDT_PhongTro;
import model.NDT_PhongTroDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/home")
public class NDT_HomeController {
    @Autowired
    private NDT_PhongTroDAO phongTroDAO;

    @GetMapping
    public String home(HttpSession session, Model model, @RequestParam(value = "message", required = false) String message) {
        NDT_TaiKhoan user = (NDT_TaiKhoan) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        List<NDT_PhongTro> listPhongTro = phongTroDAO.getAllPhongTro(1, 100, null, null);
        model.addAttribute("listPhongTro", listPhongTro);
        model.addAttribute("user", user);

        if (message != null) {
            model.addAttribute("message", message);
        }

        return "home";
    }

    @PostMapping("/dat-phong")
    public String datPhong(@RequestParam String maPhong, HttpSession session) {
        NDT_TaiKhoan user = (NDT_TaiKhoan) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // Lấy thông tin phòng trọ theo mã
        NDT_PhongTro phong = phongTroDAO.getPhongTroById(maPhong);

        if (phong == null) {
            System.out.println("Lỗi: Không tìm thấy phòng " + maPhong);
            return "redirect:/home?message=Phòng không tồn tại!";
        }

        // Kiểm tra nếu phòng đã thuê thì không cho đặt
        if (phong.getNDT_TinhTrang().trim().equalsIgnoreCase("Đã thuê")) {
            return "redirect:/home?message=Phòng này đã được thuê!";
        }

        // Cập nhật trạng thái phòng thành "Đã thuê"
        phongTroDAO.updateTrangThaiPhong(maPhong, "Đã thuê");

        // Kiểm tra lại trạng thái sau khi cập nhật
        NDT_PhongTro updatedPhong = phongTroDAO.getPhongTroById(maPhong);
        System.out.println("Trạng thái mới của phòng " + maPhong + ": " + updatedPhong.getNDT_TinhTrang());

        return "redirect:/home?message=Đặt phòng thành công!";
    }
}
