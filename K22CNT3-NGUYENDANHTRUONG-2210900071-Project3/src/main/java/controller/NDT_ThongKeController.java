package controller;

import model.NDT_ThongKe;
import model.NDT_ThongKeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/thongke")
public class NDT_ThongKeController {

    @Autowired
    private NDT_ThongKeDAO thongKeDAO;

    @GetMapping("/thongke")
    public String thongKe(Model model) {
        NDT_ThongKe thongKe = thongKeDAO.getThongKe();
        model.addAttribute("thongKe", thongKe);
        return "thongke/thongke";
    }
}
