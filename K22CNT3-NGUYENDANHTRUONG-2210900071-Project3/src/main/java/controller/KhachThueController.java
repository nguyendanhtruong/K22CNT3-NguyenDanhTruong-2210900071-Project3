package controller;

import model.KhachThue;
import model.KhachThueDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/khachThue")
public class KhachThueController {
    private final KhachThueDAO khachThueDAO;

    @Autowired
    public KhachThueController(KhachThueDAO khachThueDAO) {
        this.khachThueDAO = khachThueDAO;
    }

    // Hiển thị danh sách khách thuê
    @GetMapping
    public String showKhachThue(Model model) {
        List<KhachThue> danhSachKhachThue = khachThueDAO.getAllKhachThue();
        model.addAttribute("danhSachKhach", danhSachKhachThue);
        return "khachThueList"; // Chuyển đến JSP hiển thị danh sách
    }

    // Hiển thị form thêm khách thuê
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("khachThue", new KhachThue());
        return "addKhachThue"; // Trang JSP chứa form thêm mới
    }

    // Xử lý thêm khách thuê
    @PostMapping("/add")
    public String addKhachThue(@ModelAttribute KhachThue khachThue) {
        khachThueDAO.addKhachThue(khachThue);
        return "redirect:/khachThue"; // Quay lại danh sách
    }

    // Xóa khách thuê theo ID
    @GetMapping("/delete/{id}")
    public String deleteKhachThue(@PathVariable("id") String maKT) {
        khachThueDAO.deleteKhachThue(maKT);
        return "redirect:/khachThue";
    }

    // Hiển thị form chỉnh sửa
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String maKT, Model model) {
        KhachThue khachThue = khachThueDAO.getKhachThueById(maKT);
        model.addAttribute("khachThue", khachThue);
        return "editKhachThue"; // Chuyển đến trang JSP chỉnh sửa
    }

    // Cập nhật khách thuê
    @PostMapping("/update")
    public String updateKhachThue(@ModelAttribute KhachThue khachThue) {
        khachThueDAO.updateKhachThue(khachThue);
        return "redirect:/khachThue";
    }
}
