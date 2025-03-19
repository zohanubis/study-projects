
abstract class MonHoc {
    protected String maMonHoc;
    protected String tenMonHoc;
    protected int soTinChi;

    public MonHoc(String maMonHoc, String tenMonHoc, int soTinChi) {
        this.maMonHoc = maMonHoc;
        this.tenMonHoc = tenMonHoc;
        this.soTinChi = soTinChi;
    }

    public abstract double tinhDiemTrungBinh();
}