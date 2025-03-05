package controller;

import model.NDT_KhachThue;
import model.NDT_KhachThueDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/khachthue")
public class NDT_KhachThueController {

    @Autowired
    private NDT_KhachThueDAO khachThueDAO;

    @GetMapping("/list")
    public String listKhachThue(Model model) {
        List<NDT_KhachThue> list = khachThueDAO.getAllKhachThue();
        model.addAttribute("listKhachThue", list);
        return "khachthue/khachthue_list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("khachThue", new NDT_KhachThue());
        return "khachthue/khachthue_form";
    }

    @PostMapping("/save")
    public String saveKhachThue(@ModelAttribute("khachThue") NDT_KhachThue khachThue) {
        if (khachThue.getNDT_maKT() == null || khachThue.getNDT_maKT().isEmpty()) {
            return "redirect:/khachthue/add?error=missing_id";
        }

        if (khachThueDAO.getKhachThueById(khachThue.getNDT_maKT()) == null) {
            khachThueDAO.addKhachThue(khachThue);
        } else {
            khachThueDAO.updateKhachThue(khachThue);
        }
        return "redirect:/khachthue/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        model.addAttribute("khachThue", khachThueDAO.getKhachThueById(id));
        return "khachthue/khachthue_form";
    }

    @GetMapping("/delete/{id}")
    public String deleteKhachThue(@PathVariable("id") String id) {
        khachThueDAO.deleteKhachThue(id);
        return "redirect:/khachthue/list";
    }
}
