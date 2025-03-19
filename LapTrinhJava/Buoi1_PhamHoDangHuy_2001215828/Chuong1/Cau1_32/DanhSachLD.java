package c1.Cau1_32;

import java.util.Scanner;
public class DanhSachLD {
	public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        DSNguoiLaoDong dsNLD = new DSNguoiLaoDong();

        System.out.println("Nhập thông tin cho danh sách người lao động:");
        dsNLD.nhap();

        System.out.println("\nThông tin danh sách người lao động:");
        dsNLD.xuat();

        System.out.println("\nTổng lương của danh sách người lao động: " + dsNLD.tinhTongLuong());
    }
}
