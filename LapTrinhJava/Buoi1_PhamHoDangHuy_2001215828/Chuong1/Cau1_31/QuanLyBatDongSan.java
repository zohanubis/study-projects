package c1.Cau1_31;

import java.util.ArrayList;
import java.util.Scanner;

public class QuanLyBatDongSan {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<BatDongSan> danhSachBatDongSan = new ArrayList<>();

        int luaChon;
        do {
            System.out.println("1. Nhập thông tin cho đất trống");
            System.out.println("2. Nhập thông tin cho nhà ở");
            System.out.println("3. Nhập thông tin cho khách sạn");
            System.out.println("4. Nhập thông tin cho biệt thự");
            System.out.println("0. Thoát chương trình");
            System.out.print("Nhập lựa chọn của bạn: ");
            luaChon = scanner.nextInt();
            scanner.nextLine(); // Đọc bỏ dòng new line

            switch (luaChon) {
                case 1:
                    danhSachBatDongSan.add(DatTrong.nhapThongTin());
                    break;
                case 2:
                    danhSachBatDongSan.add(NhaO.nhapThongTin());
                    break;
                case 3:
                    danhSachBatDongSan.add(KhachSan.nhapThongTin());
                    break;
                case 4:
                    danhSachBatDongSan.add(BietThu.nhapThongTin());
                    break;
                case 0:
                    System.out.println("Kết thúc chương trình.");
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ.");
            }
        } while (luaChon != 0);

        // Xuất thông tin của các bất động sản
        System.out.println("Danh sách bất động sản:");
        for (BatDongSan bds : danhSachBatDongSan) {
            System.out.println(bds);
        }

        // Tính tổng giá trị của tất cả bất động sản
        double tongGiaTri = 0;
        for (BatDongSan bds : danhSachBatDongSan) {
            tongGiaTri += bds.tinhGiaBan();
        }
        System.out.println("Tổng giá trị của tất cả bất động sản: " + tongGiaTri);
    }
}
