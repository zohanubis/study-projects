package c1.Cau1_31;

import java.util.Scanner;

// Lớp con đại diện cho khách sạn
public class KhachSan extends BatDongSan {
    private int soSao;

    public KhachSan(String maSo, double chieuDai, double chieuRong, int soSao) {
        super(maSo, chieuDai, chieuRong);
        this.soSao = soSao;
    }

    @Override
    public double tinhGiaBan() {
        return 100000 + soSao * 50000;
    }

    @Override
    public String toString() {
        return super.toString() + ", Loại bất động sản: Khách sạn, Giá bán: " + tinhGiaBan();
    }

    public static KhachSan nhapThongTin() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập thông tin cho khách sạn:");
        System.out.print("Nhập mã số: ");
        String maSo = scanner.nextLine();
        System.out.print("Nhập chiều dài: ");
        double chieuDai = scanner.nextDouble();
        System.out.print("Nhập chiều rộng: ");
        double chieuRong = scanner.nextDouble();
        System.out.print("Nhập số sao: ");
        int soSao = scanner.nextInt();
        return new KhachSan(maSo, chieuDai, chieuRong, soSao);
    }
}
