package controller;

import model.HoaDon;
import model.HoaDonDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/hoaDon")
public class HoaDonController {

    private final HoaDonDAO hoaDonDAO;

    @Autowired
    public HoaDonController(HoaDonDAO hoaDonDAO) {
        this.hoaDonDAO = hoaDonDAO;
    }

    // 1️⃣ Hiển thị danh sách hóa đơn
    @GetMapping
    public String showHoaDonList(Model model) {
        List<HoaDon> danhSachHoaDon = hoaDonDAO.getAllHoaDon();
        model.addAttribute("hoaDonList", danhSachHoaDon);
        return "hoaDonList"; // Trả về trang hoaDonList.jsp
    }

    // 2️⃣ Hiển thị form thêm hóa đơn
    @GetMapping("/addHoaDon")
    public String showAddHoaDonForm() {
        return "addHoaDon"; // Trả về trang addHoaDon.jsp
    }

    // 3️⃣ Xử lý thêm hóa đơn vào CSDL
    @PostMapping("/save")
    public String saveHoaDon(@ModelAttribute HoaDon hoaDon) {
        hoaDonDAO.addHoaDon(hoaDon);
        return "redirect:/hoaDon"; // Quay lại danh sách hóa đơn
    }

    // 4️⃣ Hiển thị form chỉnh sửa hóa đơn
    @GetMapping("/edit")
    public String showEditHoaDonForm(@RequestParam("maHD") String maHD, Model model) {
        HoaDon hoaDon = hoaDonDAO.getHoaDonById(maHD);
        model.addAttribute("hoaDon", hoaDon);
        return "editHoaDon"; // Trả về trang editHoaDon.jsp
    }

    // 5️⃣ Xử lý cập nhật hóa đơn
    @PostMapping("/update")
    public String updateHoaDon(@ModelAttribute HoaDon hoaDon) {
        hoaDonDAO.updateHoaDon(hoaDon);
        return "redirect:/hoaDon"; // Quay lại danh sách hóa đơn
    }

    // 6️⃣ Xử lý xóa hóa đơn
    @GetMapping("/delete")
    public String deleteHoaDon(@RequestParam("maHD") String maHD) {
        hoaDonDAO.deleteHoaDon(maHD);
        return "redirect:/hoaDon"; // Quay lại danh sách hóa đơn
    }
}
