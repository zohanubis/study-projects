
class NhanVienVanPhong extends NhanVien {
    private int soNgayLamViec;
    private double troCap;

    public NhanVienVanPhong(String hoTen, int namVaoLam, int soNgayLamViec, double troCap) {
        super(hoTen, namVaoLam);
        this.soNgayLamViec = soNgayLamViec;
        this.troCap = troCap;
    }

    @Override
    public double tinhLuong() {
        return luongCoBan + soNgayLamViec * 100000 + troCap;
    }
}