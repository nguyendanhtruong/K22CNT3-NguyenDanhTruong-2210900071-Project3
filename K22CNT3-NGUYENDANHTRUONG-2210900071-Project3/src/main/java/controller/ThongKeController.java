package controller;

import model.ThongKe;
import model.ThongKeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ThongKeController {

    @Autowired
    private ThongKeDAO thongKeDAO;

    @GetMapping("/admin/thongke")
    public String thongKe(Model model) {
        ThongKe thongKe = thongKeDAO.getThongKe();

        model.addAttribute("tongSoPhong", thongKe.getTongSoPhong());
        model.addAttribute("soPhongTrong", thongKe.getSoPhongTrong());
        model.addAttribute("soPhongDaThue", thongKe.getSoPhongDaThue());
        model.addAttribute("tongKhachThue", thongKe.getTongKhachThue());
        model.addAttribute("doanhThu", thongKe.getDoanhThu());

        return "thongke"; // Trả về trang thongke.jsp
    }
}
