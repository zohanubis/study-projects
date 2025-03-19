package c1.Cau1_29;

// Lớp con đại diện cho nhân viên sản xuất
public class NhanVienSanXuat extends NhanVien {
    private int soSanPham;

    public NhanVienSanXuat(String hoTen, int namVaoLam, int soSanPham) {
        super(hoTen, namVaoLam);
        this.soSanPham = soSanPham;
    }

    @Override
    public double tinhLuong() {
        return 1490000 + soSanPham * 2000;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại nhân viên: Sản xuất, Lương: " + tinhLuong() + " VND";
    }
}
