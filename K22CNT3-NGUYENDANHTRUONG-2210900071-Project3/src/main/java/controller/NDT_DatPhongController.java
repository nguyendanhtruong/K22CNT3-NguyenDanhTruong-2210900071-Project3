package controller;

import model.NDT_PhongTro;
import model.NDT_PhongTroDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class NDT_DatPhongController {

    @Autowired
    private NDT_PhongTroDAO phongTroDAO;

    // ✅ Xử lý đặt phòng
    @PostMapping("/datPhong")
    public String datPhong(@RequestParam("maPhong") String maPhong, RedirectAttributes redirectAttributes) {
        // 🔎 Kiểm tra phòng có tồn tại không
        NDT_PhongTro phong = phongTroDAO.getPhongTroById(maPhong);

        if (phong == null) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy phòng.");
            return "redirect:/phongtro/list";
        }

        if (!"Trong".equalsIgnoreCase(phong.getNDT_TinhTrang())) {
            redirectAttributes.addFlashAttribute("error", "Phòng đã có người thuê.");
            return "redirect:/phongtro/list";
        }

        // ✅ Cập nhật trạng thái phòng trọ thành "Đã thuê"
        phongTroDAO.updateTrangThaiPhong(maPhong, "Đã thuê");

        redirectAttributes.addFlashAttribute("message", "Đặt phòng thành công!");

        // 🔗 Chuyển hướng đến trang thông báo, kèm mã phòng
        return "redirect:/datPhongThanhCong?maPhong=" + maPhong;
    }

    // ✅ Hiển thị trang thông báo đặt phòng thành công
    @GetMapping("/datPhongThanhCong")
    public String datPhongThanhCong(@RequestParam("maPhong") String maPhong, Model model) {
        // 🔎 Lấy thông tin phòng đã đặt
        NDT_PhongTro phong = phongTroDAO.getPhongTroById(maPhong);

        if (phong == null) {
            model.addAttribute("error", "Không tìm thấy thông tin phòng.");
            return "redirect:/phongtro/list";
        }

        model.addAttribute("phong", phong);
        return "datPhongThanhCong"; // Trả về trang JSP datPhongThanhCong.jsp
    }

    // ✅ Xem chi tiết phòng trọ
    @GetMapping("/chiTietPhong")
    public String chiTietPhong(@RequestParam("maPhong") String maPhong, Model model) {
        // 🔎 Lấy thông tin phòng
        NDT_PhongTro phong = phongTroDAO.getPhongTroById(maPhong);

        if (phong == null) {
            model.addAttribute("error", "Không tìm thấy phòng.");
            return "redirect:/phongtro/list";
        }

        model.addAttribute("phong", phong);
        return "chiTietPhong"; // Trả về trang JSP chiTietPhong.jsp
    }
}
