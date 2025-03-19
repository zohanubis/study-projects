
abstract class BatDongSan {
    protected String maSo;
    protected double chieuDai;
    protected double chieuRong;

    public BatDongSan(String maSo, double chieuDai, double chieuRong) {
        this.maSo = maSo;
        this.chieuDai = chieuDai;
        this.chieuRong = chieuRong;
    }

    public abstract double tinhGiaBan();
}