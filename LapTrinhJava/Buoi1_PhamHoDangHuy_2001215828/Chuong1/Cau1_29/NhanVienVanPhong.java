package c1.Cau1_29;

// Lớp con đại diện cho nhân viên văn phòng
public class NhanVienVanPhong extends NhanVien {
    private int soNgayLamViec;
    private double troCap;

    public NhanVienVanPhong(String hoTen, int namVaoLam, int soNgayLamViec, double troCap) {
        super(hoTen, namVaoLam);
        this.soNgayLamViec = soNgayLamViec;
        this.troCap = troCap;
    }

    @Override
    public double tinhLuong() {
        return 1490000 + soNgayLamViec * 100000 + troCap;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại nhân viên: Văn phòng, Lương: " + tinhLuong() + " VND";
    }
}
