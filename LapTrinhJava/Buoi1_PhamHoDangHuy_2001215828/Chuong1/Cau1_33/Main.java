package c1.Cau1_33;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        QuanLyKhachHang quanLyKhachHang = new QuanLyKhachHang();
        Scanner scanner = new Scanner(System.in);

        System.out.println("1. Nhập danh sách khách hàng từ bàn phím");
        System.out.println("2. Xuất danh sách khách hàng ra màn hình");
        System.out.println("3. Ghi danh sách khách hàng vào file");
        System.out.println("4. Đọc danh sách khách hàng từ file");
        System.out.println("5. Thoát");
        int luaChon;
        do {
            System.out.print("Nhập lựa chọn của bạn: ");
            luaChon = scanner.nextInt();
            scanner.nextLine(); // Đọc bỏ dòng trống
            switch (luaChon) {
                case 1:
                    quanLyKhachHang.nhapKhachHang();
                    break;
                case 2:
                    quanLyKhachHang.xuatKhachHang();
                    break;
                case 3:
                    System.out.print("Nhập tên file để ghi: ");
                    String tenFileGhi = scanner.nextLine();
                    quanLyKhachHang.ghiDanhSachVaoFile(tenFileGhi);
                    break;
                case 4:
                    System.out.print("Nhập tên file để đọc: ");
                    String tenFileDoc = scanner.nextLine();
                    quanLyKhachHang.docDanhSachTuFile(tenFileDoc);
                    break;
                case 5:
                    System.out.println("Kết thúc chương trình.");
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ. Vui lòng chọn lại.");
            }
        } while (luaChon != 5);
    }
}

