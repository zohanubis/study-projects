
class NhanVienSanXuat extends NhanVien {
    private int soSanPham;

    public NhanVienSanXuat(String hoTen, int namVaoLam, int soSanPham) {
        super(hoTen, namVaoLam);
        this.soSanPham = soSanPham;
    }

    @Override
    public double tinhLuong() {
        return luongCoBan + soSanPham * 2000;
    }
}
