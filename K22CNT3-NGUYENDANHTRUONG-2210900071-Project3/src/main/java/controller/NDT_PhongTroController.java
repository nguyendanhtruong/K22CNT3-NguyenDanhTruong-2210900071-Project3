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

    @GetMapping("/list")
    public String listPhongTro(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false, defaultValue = "") String search,
            @RequestParam(required = false, defaultValue = "") String status,
            Model model) {

        search = search.trim();
        status = status.trim();

        if (status.equals("Tất cả")) {
            status = "";
        }

        List<NDT_PhongTro> list = phongTroDAO.getAllPhongTro(page, size, search, status);
        int total = phongTroDAO.countPhongTro(search, status);
        int totalPages = (int) Math.ceil((double) total / size);

        model.addAttribute("listPhongTro", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", search);
        model.addAttribute("status", status);

        return "phongtro/phongtro_list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("phongTro", new NDT_PhongTro());
        return "phongtro/phongtro_form";
    }

    @PostMapping("/save")
    public String savePhongTro(@ModelAttribute("phongTro") NDT_PhongTro phongTro) {
        if (phongTro.getNDT_maPhong() == null || phongTro.getNDT_maPhong().trim().isEmpty()) {
            return "redirect:/phongtro/list?error=invalid_id";
        }

        if (phongTroDAO.getPhongTroById(phongTro.getNDT_maPhong()) == null) {
            phongTroDAO.addPhongTro(phongTro);
        } else {
            phongTroDAO.updatePhongTro(phongTro);
        }
        return "redirect:/phongtro/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        NDT_PhongTro phongTro = phongTroDAO.getPhongTroById(id);
        if (phongTro == null) {
            return "redirect:/phongtro/list?error=not_found";
        }
        model.addAttribute("phongTro", phongTro);
        return "phongtro/phongtro_form";
    }

    @GetMapping("/delete/{id}")
    public String deletePhongTro(@PathVariable("id") String id) {
        phongTroDAO.deletePhongTro(id);
        return "redirect:/phongtro/list";
    }

    @GetMapping("/detail/{id}")
    public String viewPhongTroDetail(@PathVariable("id") String id, Model model) {
        NDT_PhongTro phongTro = phongTroDAO.getPhongTroById(id);
        if (phongTro == null) {
            return "redirect:/phongtro/list?error=not_found";
        }
        model.addAttribute("phongTro", phongTro);
        return "phongtro/phongtro_detail";
    }
}