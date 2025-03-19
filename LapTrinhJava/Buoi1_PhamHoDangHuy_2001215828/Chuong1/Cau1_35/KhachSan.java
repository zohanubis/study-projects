
class KhachSan extends BatDongSan {
    private int soSao;

    public KhachSan(String maSo, double chieuDai, double chieuRong, int soSao) {
        super(maSo, chieuDai, chieuRong);
        this.soSao = soSao;
    }

    @Override
    public double tinhGiaBan() {
        return 100000 + soSao * 50000 + chieuRong * 5000;
    }
}
