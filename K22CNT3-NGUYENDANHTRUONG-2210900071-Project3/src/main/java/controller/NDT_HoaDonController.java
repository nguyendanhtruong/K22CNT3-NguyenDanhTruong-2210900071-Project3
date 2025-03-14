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
        model.addAttribute("khachThueIds", hoaDonDAO.getAllKhachThueIds());
        return "hoadon/hoadon_form";
    }

    @PostMapping("/save")
    public String saveHoaDon(@ModelAttribute("hoaDon") NDT_HoaDon hoaDon, Model model) {
        if (hoaDon.getNDT_maHD() == null || hoaDon.getNDT_maHD().trim().isEmpty()) {
            model.addAttribute("error", "Mã Hóa Đơn (NDT_maHD) là bắt buộc.");
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("khachThueIds", hoaDonDAO.getAllKhachThueIds());
            return "hoadon/hoadon_form";
        }

        try {
            if (hoaDonDAO.getNDT_HoaDonById(hoaDon.getNDT_maHD()) == null) {
                hoaDonDAO.insertNDT_HoaDon(hoaDon);
            } else {
                hoaDonDAO.updateNDT_HoaDon(hoaDon);
            }
            return "redirect:/hoadon/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("khachThueIds", hoaDonDAO.getAllKhachThueIds());
            return "hoadon/hoadon_form";
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            model.addAttribute("error", "Không thể lưu hóa đơn: Mã hóa đơn đã tồn tại hoặc dữ liệu không hợp lệ.");
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("khachThueIds", hoaDonDAO.getAllKhachThueIds());
            return "hoadon/hoadon_form";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        NDT_HoaDon hoaDon = hoaDonDAO.getNDT_HoaDonById(id);
        if (hoaDon == null) {
            return "redirect:/hoadon/list?error=not_found";
        }
        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("khachThueIds", hoaDonDAO.getAllKhachThueIds());
        return "hoadon/hoadon_form";
    }

    @PostMapping("/update")
    public String updateHoaDon(@ModelAttribute("hoaDon") NDT_HoaDon hoaDon, Model model) {
        if (hoaDon.getNDT_maHD() == null || hoaDon.getNDT_maHD().trim().isEmpty()) {
            model.addAttribute("error", "Mã Hóa Đơn (NDT_maHD) là bắt buộc.");
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("khachThueIds", hoaDonDAO.getAllKhachThueIds());
            return "hoadon/hoadon_form";
        }
        try {
            hoaDonDAO.updateNDT_HoaDon(hoaDon);
            return "redirect:/hoadon/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("khachThueIds", hoaDonDAO.getAllKhachThueIds());
            return "hoadon/hoadon_form";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteHoaDon(@PathVariable("id") String id) {
        hoaDonDAO.deleteNDT_HoaDon(id);
        return "redirect:/hoadon/list";
    }
}