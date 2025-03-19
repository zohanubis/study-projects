package c1.Cau1_31;

// Lớp cha để đại diện cho mỗi đối tượng bất động sản
public abstract class BatDongSan {
    protected String maSo;
    protected double chieuDai;
    protected double chieuRong;

    public BatDongSan(String maSo, double chieuDai, double chieuRong) {
        this.maSo = maSo;
        this.chieuDai = chieuDai;
        this.chieuRong = chieuRong;
    }

    // Phương thức trừu tượng để tính giá bán
    public abstract double tinhGiaBan();

    @Override
    public String toString() {
        return "Mã số: " + maSo + ", Chiều dài: " + chieuDai + ", Chiều rộng: " + chieuRong;
    }
}
