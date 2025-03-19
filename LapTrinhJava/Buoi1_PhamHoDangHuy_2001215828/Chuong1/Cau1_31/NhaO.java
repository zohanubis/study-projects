package c1.Cau1_31;

import java.util.Scanner;

// Lớp con đại diện cho nhà ở
public class NhaO extends BatDongSan {
    private int soLau;

    public NhaO(String maSo, double chieuDai, double chieuRong, int soLau) {
        super(maSo, chieuDai, chieuRong);
        this.soLau = soLau;
    }

    @Override
    public double tinhGiaBan() {
        return chieuDai * chieuRong * 10000 + soLau * 100000;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại bất động sản: Nhà ở, Giá bán: " + tinhGiaBan();
    }

    public static NhaO nhapThongTin() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập thông tin cho nhà ở:");
        System.out.print("Nhập mã số: ");
        String maSo = scanner.nextLine();
        System.out.print("Nhập chiều dài: ");
        double chieuDai = scanner.nextDouble();
        System.out.print("Nhập chiều rộng: ");
        double chieuRong = scanner.nextDouble();
        System.out.print("Nhập số lầu: ");
        int soLau = scanner.nextInt();
        return new NhaO(maSo, chieuDai, chieuRong, soLau);
    }
}
