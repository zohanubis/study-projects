package c1.Cau1_31;

import java.util.Scanner;

// Lớp con đại diện cho biệt thự
public class BietThu extends BatDongSan {

    public BietThu(String maSo, double chieuDai, double chieuRong) {
        super(maSo, chieuDai, chieuRong);
    }

    @Override
    public double tinhGiaBan() {
        return chieuDai * chieuRong * 400000;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại bất động sản: Biệt thự, Giá bán: " + tinhGiaBan();
    }

    public static BietThu nhapThongTin() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập thông tin cho biệt thự:");
        System.out.print("Nhập mã số: ");
        String maSo = scanner.nextLine();
        System.out.print("Nhập chiều dài: ");
        double chieuDai = scanner.nextDouble();
        System.out.print("Nhập chiều rộng: ");
        double chieuRong = scanner.nextDouble();
        return new BietThu(maSo, chieuDai, chieuRong);
    }
}
