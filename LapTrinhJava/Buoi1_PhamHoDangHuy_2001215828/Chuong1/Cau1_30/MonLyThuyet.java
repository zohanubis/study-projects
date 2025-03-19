package c1.Cau1_30;

// Lớp con đại diện cho môn lý thuyết
public class MonLyThuyet extends MonHoc {
    private double diemTieuLuan;
    private double diemGiuaKy;
    private double diemCuoiKy;

    public MonLyThuyet(String maMonHoc, String tenMonHoc, int soTinChi, double diemTieuLuan, double diemGiuaKy, double diemCuoiKy) {
        super(maMonHoc, tenMonHoc, soTinChi);
        this.diemTieuLuan = diemTieuLuan;
        this.diemGiuaKy = diemGiuaKy;
        this.diemCuoiKy = diemCuoiKy;
    }

    @Override
    public double tinhDiemTrungBinh() {
        return diemTieuLuan * 0.2 + diemGiuaKy * 0.3 + diemCuoiKy * 0.5;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại môn học: Lý thuyết, Điểm trung bình: " + tinhDiemTrungBinh();
    }
}
