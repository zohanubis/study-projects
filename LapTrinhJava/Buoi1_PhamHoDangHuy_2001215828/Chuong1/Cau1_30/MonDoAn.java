package c1.Cau1_30;

// Lớp con đại diện cho môn đồ án
public class MonDoAn extends MonHoc {
    private double diemGVHD;
    private double diemGVPB;

    public MonDoAn(String maMonHoc, String tenMonHoc, int soTinChi, double diemGVHD, double diemGVPB) {
        super(maMonHoc, tenMonHoc, soTinChi);
        this.diemGVHD = diemGVHD;
        this.diemGVPB = diemGVPB;
    }

    @Override
    public double tinhDiemTrungBinh() {
        return (diemGVHD + diemGVPB) / 2;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại môn học: Đồ án, Điểm trung bình: " + tinhDiemTrungBinh();
    }
}
