package c1.Cau1_31;

import java.util.Scanner;

// Lớp con đại diện cho đất trống
public class DatTrong extends BatDongSan {
    public DatTrong(String maSo, double chieuDai, double chieuRong) {
        super(maSo, chieuDai, chieuRong);
    }

    @Override
    public double tinhGiaBan() {
        return chieuDai * chieuRong * 10000;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại bất động sản: Đất trống, Giá bán: " + tinhGiaBan();
    }

    public static DatTrong nhapThongTin() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập thông tin cho đất trống:");
        System.out.print("Nhập mã số: ");
        String maSo = scanner.nextLine();
        System.out.print("Nhập chiều dài: ");
        double chieuDai = scanner.nextDouble();
        System.out.print("Nhập chiều rộng: ");
        double chieuRong = scanner.nextDouble();
        return new DatTrong(maSo, chieuDai, chieuRong);
    }
}
