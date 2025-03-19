package c1.Cau1_29;

// Lớp cha để đại diện cho mỗi nhân viên
public class NhanVien {
    protected String hoTen;
    protected int namVaoLam;

    public NhanVien(String hoTen, int namVaoLam) {
        this.hoTen = hoTen;
        this.namVaoLam = namVaoLam;
    }

    // Phương thức trừu tượng để tính lương
    public double tinhLuong() {
        return 0;
    }

    // Phương thức toString để xuất thông tin của nhân viên
    @Override
    public String toString() {
        return "Họ và tên: " + hoTen + ", Năm vào làm: " + namVaoLam;
    }
}
