import java.util.ArrayList;

class MonThucHanh extends MonHoc {
    private ArrayList<Double> diemKiemTra;

    public MonThucHanh(String maMonHoc, String tenMonHoc, int soTinChi, ArrayList<Double> diemKiemTra) {
        super(maMonHoc, tenMonHoc, soTinChi);
        this.diemKiemTra = diemKiemTra;
    }

    @Override
    public double tinhDiemTrungBinh() {
        double tongDiem = 0;
        for (double diem : diemKiemTra) {
            tongDiem += diem;
        }
        return tongDiem / diemKiemTra.size();
    }
}
