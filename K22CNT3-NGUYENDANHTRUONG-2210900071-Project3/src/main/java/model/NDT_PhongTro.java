package model;

import java.math.BigDecimal;
import java.util.Date;

public class NDT_PhongTro {
    private String NDT_maPhong;
    private float NDT_dienTich;
    private int NDT_soNguoi;
    private BigDecimal NDT_giaThue;
    private String NDT_DoiTuongThue;
    private String NDT_TinhTrang;
    private int NDT_chiSoDienMoi;
    private int NDT_chiSoDienCu;
    private int NDT_chiSoNuocMoi;
    private int NDT_chiSoNuocCu;

    // Getters and Setters
    public String getNDT_maPhong() { return NDT_maPhong; }
    public void setNDT_maPhong(String NDT_maPhong) { this.NDT_maPhong = NDT_maPhong; }

    public float getNDT_dienTich() { return NDT_dienTich; }
    public void setNDT_dienTich(float NDT_dienTich) { this.NDT_dienTich = NDT_dienTich; }

    public int getNDT_soNguoi() { return NDT_soNguoi; }
    public void setNDT_soNguoi(int NDT_soNguoi) { this.NDT_soNguoi = NDT_soNguoi; }

    public BigDecimal getNDT_giaThue() { return NDT_giaThue; }
    public void setNDT_giaThue(BigDecimal NDT_giaThue) { this.NDT_giaThue = NDT_giaThue; }

    public String getNDT_DoiTuongThue() { return NDT_DoiTuongThue; }
    public void setNDT_DoiTuongThue(String NDT_DoiTuongThue) { this.NDT_DoiTuongThue = NDT_DoiTuongThue; }

    public String getNDT_TinhTrang() { return NDT_TinhTrang; }
    public void setNDT_TinhTrang(String NDT_TinhTrang) { this.NDT_TinhTrang = NDT_TinhTrang; }

    public int getNDT_chiSoDienMoi() { return NDT_chiSoDienMoi; }
    public void setNDT_chiSoDienMoi(int NDT_chiSoDienMoi) { this.NDT_chiSoDienMoi = NDT_chiSoDienMoi; }

    public int getNDT_chiSoDienCu() { return NDT_chiSoDienCu; }
    public void setNDT_chiSoDienCu(int NDT_chiSoDienCu) { this.NDT_chiSoDienCu = NDT_chiSoDienCu; }

    public int getNDT_chiSoNuocMoi() { return NDT_chiSoNuocMoi; }
    public void setNDT_chiSoNuocMoi(int NDT_chiSoNuocMoi) { this.NDT_chiSoNuocMoi = NDT_chiSoNuocMoi; }

    public int getNDT_chiSoNuocCu() { return NDT_chiSoNuocCu; }
    public void setNDT_chiSoNuocCu(int NDT_chiSoNuocCu) { this.NDT_chiSoNuocCu = NDT_chiSoNuocCu; }
}
