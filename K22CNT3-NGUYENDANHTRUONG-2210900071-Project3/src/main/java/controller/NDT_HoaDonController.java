package controller;

import model.NDT_HoaDon;
import model.NDT_HoaDonDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/hoadon")
public class NDT_HoaDonController {

    @Autowired
    private NDT_HoaDonDAO hoaDonDAO;

    @GetMapping("/list")
    public String listHoaDon(Model model) {
        List<NDT_HoaDon> list = hoaDonDAO.getAllNDT_HoaDon();
        model.addAttribute("listHoaDon", list);
        return "hoadon/hoadon_list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("hoaDon", new NDT_HoaDon());
        return "hoadon/hoadon_form";
    }

    @PostMapping("/save")
    public String saveHoaDon(@ModelAttribute("hoaDon") NDT_HoaDon hoaDon) {
        if (hoaDon.getNDT_maHD() == null || hoaDon.getNDT_maHD().isEmpty()) {
            return "redirect:/hoadon/add?error=missing_id";
        }

        if (hoaDonDAO.getNDT_HoaDonById(hoaDon.getNDT_maHD()) == null) {
            hoaDonDAO.insertNDT_HoaDon(hoaDon);
        } else {
            hoaDonDAO.updateNDT_HoaDon(hoaDon);
        }
        return "redirect:/hoadon/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        NDT_HoaDon hoaDon = hoaDonDAO.getNDT_HoaDonById(id);
        if (hoaDon == null) {
            return "redirect:/hoadon/list?error=not_found";
        }
        model.addAttribute("hoaDon", hoaDon);
        return "hoadon/hoadon_form";
    }

    @PostMapping("/update")
    public String updateHoaDon(@ModelAttribute("hoaDon") NDT_HoaDon hoaDon) {
        if (hoaDon.getNDT_maHD() == null || hoaDon.getNDT_maHD().isEmpty()) {
            return "redirect:/hoadon/list?error=missing_id";
        }
        hoaDonDAO.updateNDT_HoaDon(hoaDon);
        return "redirect:/hoadon/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteHoaDon(@PathVariable("id") String id) {
        hoaDonDAO.deleteNDT_HoaDon(id);
        return "redirect:/hoadon/list";
    }
}