package c1.Cau1_29;

// Lớp con đại diện cho nhân viên quản lý
public class NhanVienQuanLy extends NhanVien {
    private double heSoChucVu;
    private double thuong;

    public NhanVienQuanLy(String hoTen, int namVaoLam, double heSoChucVu, double thuong) {
        super(hoTen, namVaoLam);
        this.heSoChucVu = heSoChucVu;
        this.thuong = thuong;
    }

    @Override
    public double tinhLuong() {
        return 1490000 * heSoChucVu + thuong;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại nhân viên: Quản lý, Lương: " + tinhLuong() + " VND";
    }
}
