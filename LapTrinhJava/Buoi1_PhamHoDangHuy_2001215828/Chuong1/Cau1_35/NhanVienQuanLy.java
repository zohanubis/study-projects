
class NhanVienQuanLy extends NhanVien {
    private double heSoChucVu;
    private double thuong;

    public NhanVienQuanLy(String hoTen, int namVaoLam, double heSoChucVu, double thuong) {
        super(hoTen, namVaoLam);
        this.heSoChucVu = heSoChucVu;
        this.thuong = thuong;
    }

    @Override
    public double tinhLuong() {
        return luongCoBan * heSoChucVu + thuong;
    }
}