
class MonDoAn extends MonHoc {
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
}