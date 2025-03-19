
abstract class NhanVien {
    protected String hoTen;
    protected int namVaoLam;
    protected double luongCoBan;

    public NhanVien(String hoTen, int namVaoLam) {
        this.hoTen = hoTen;
        this.namVaoLam = namVaoLam;
        this.luongCoBan = 1490000;
    }

    public abstract double tinhLuong();
}
