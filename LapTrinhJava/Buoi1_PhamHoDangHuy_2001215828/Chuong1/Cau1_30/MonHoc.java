package c1.Cau1_30;

public class MonHoc {
	protected String maMonHoc;
	protected String tenMonHoc;
	protected int soTinChi;
	
	public MonHoc(String maMonHoc, String tenMonHoc, int soTinChi) {
		this.maMonHoc = maMonHoc;
		this.tenMonHoc = tenMonHoc;
		this.soTinChi = soTinChi;
	}
	public double tinhDiemTrungBinh() {
		return 0;
	}
	@Override
    public String toString() {
        return "Mã môn học: " + maMonHoc + ", Tên môn học: " + tenMonHoc + ", Số tín chỉ: " + soTinChi;
    }
}
