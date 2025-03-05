package controller;

import model.NDT_PhongTro;
import model.NDT_PhongTroDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/phongtro")
public class NDT_PhongTroController {

    @Autowired
    private NDT_PhongTroDAO phongTroDAO;

    // ✅ Hiển thị danh sách phòng trọ
    @GetMapping("/list")
    public String listPhongTro(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String status,
            Model model) {

        List<NDT_PhongTro> list = phongTroDAO.getAllPhongTro(page, size, search, status);
        int total = phongTroDAO.countPhongTro(search, status);
        int totalPages = (int) Math.ceil((double) total / size);

        model.addAttribute("listPhongTro", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", search);
        model.addAttribute("status", status);

        return "phongtro/phongtro_list"; // ✅ Đúng đường dẫn thư mục
    }

    // ✅ Hiển thị form thêm phòng trọ
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("phongTro", new NDT_PhongTro());
        return "phongtro/phongtro_form"; // ✅ Đúng đường dẫn thư mục
    }

    // ✅ Xử lý thêm hoặc cập nhật phòng trọ
    @PostMapping("/save")
    public String savePhongTro(@ModelAttribute("phongTro") NDT_PhongTro phongTro) {
        if (phongTroDAO.getPhongTroById(phongTro.getNDT_maPhong()) == null) {
            phongTroDAO.addPhongTro(phongTro);
        } else {
            phongTroDAO.updatePhongTro(phongTro);
        }
        return "redirect:/phongtro/list";
    }


    // ✅ Hiển thị form sửa phòng trọ
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        NDT_PhongTro phongTro = phongTroDAO.getPhongTroById(id);
        model.addAttribute("phongTro", phongTro);
        return "phongtro/phongtro_form"; // ✅ Đúng đường dẫn thư mục
    }

    // ✅ Xóa phòng trọ
    @GetMapping("/delete/{id}")
    public String deletePhongTro(@PathVariable("id") String id) {
        phongTroDAO.deletePhongTro(id);
        return "redirect:/phongtro/list";
    }
}
