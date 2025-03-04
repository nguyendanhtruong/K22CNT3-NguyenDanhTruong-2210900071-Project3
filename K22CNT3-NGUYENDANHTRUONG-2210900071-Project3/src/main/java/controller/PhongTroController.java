package controller;

import model.PhongTro;
import model.PhongTroDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/phongtro")
public class PhongTroController {

    @Autowired
    private PhongTroDAO phongTroDAO;

    // Hiển thị danh sách phòng trọ
    @GetMapping("/list")
    public String showPhongTroList(Model model) {
        List<PhongTro> phongTroList = phongTroDAO.getAllPhongTro();
        model.addAttribute("phongTroList", phongTroList);
        return "phongtro/list";
    }

    // Hiển thị form thêm phòng trọ
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("phongTro", new PhongTro());
        return "phongtro/add";
    }

    // Xử lý thêm phòng trọ
    @PostMapping("/add")
    public String addPhongTro(@ModelAttribute("phongTro") PhongTro phongTro) {
        phongTroDAO.addPhongTro(phongTro);
        return "redirect:/phongtro/list";
    }

    // Hiển thị form chỉnh sửa phòng trọ
    @GetMapping("/edit/{maPhong}")
    public String showEditForm(@PathVariable("maPhong") String maPhong, Model model) {
        PhongTro phongTro = phongTroDAO.getPhongTroById(maPhong);
        if (phongTro == null) {
            return "redirect:/phongtro/list"; // Nếu không tìm thấy, quay lại danh sách
        }
        model.addAttribute("phongTro", phongTro);
        return "phongtro/edit";
    }

    // Xử lý chỉnh sửa phòng trọ
    @PostMapping("/edit")
    public String editPhongTro(@ModelAttribute("phongTro") PhongTro phongTro) {
        phongTroDAO.updatePhongTro(phongTro);
        return "redirect:/phongtro/list";
    }

    // Xóa phòng trọ
    @GetMapping("/delete/{maPhong}")
    public String deletePhongTro(@PathVariable("maPhong") String maPhong) {
        phongTroDAO.deletePhongTro(maPhong);
        return "redirect:/phongtro/list";
    }
}
