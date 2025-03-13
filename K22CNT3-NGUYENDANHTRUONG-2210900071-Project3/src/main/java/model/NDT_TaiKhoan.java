package model;

public class NDT_TaiKhoan {
    private String NDT_UserName;
    private String NDT_Pass;
    private String NDT_Role;

    public NDT_TaiKhoan() {
    }

    public NDT_TaiKhoan(String NDT_UserName, String NDT_Pass, String NDT_Role) {
        this.NDT_UserName = NDT_UserName;
        this.NDT_Pass = NDT_Pass;
        this.NDT_Role = NDT_Role;
    }

    public String getNDT_UserName() {
        return NDT_UserName;
    }

    public void setNDT_UserName(String NDT_UserName) {
        this.NDT_UserName = NDT_UserName;
    }

    public String getNDT_Pass() {
        return NDT_Pass;
    }

    public void setNDT_Pass(String NDT_Pass) {
        this.NDT_Pass = NDT_Pass;
    }

    public String getNDT_Role() {
        return NDT_Role;
    }

    public void setNDT_Role(String NDT_Role) {
        this.NDT_Role = NDT_Role;
    }
}
