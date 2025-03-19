package c1.Cau1_30;

import java.util.ArrayList;

// Lớp con đại diện cho môn thực hành
public class MonThucHanh extends MonHoc {
    private ArrayList<Double> diemKiemTra;

    public MonThucHanh(String maMonHoc, String tenMonHoc, int soTinChi, ArrayList<Double> diemKiemTra) {
        super(maMonHoc, tenMonHoc, soTinChi);
        this.diemKiemTra = diemKiemTra;
    }

    @Override
    public double tinhDiemTrungBinh() {
        double tongDiem = 0;
        for (Double diem : diemKiemTra) {
            tongDiem += diem;
        }
        return tongDiem / diemKiemTra.size();
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại môn học: Thực hành, Điểm trung bình: " + tinhDiemTrungBinh();
    }
}
