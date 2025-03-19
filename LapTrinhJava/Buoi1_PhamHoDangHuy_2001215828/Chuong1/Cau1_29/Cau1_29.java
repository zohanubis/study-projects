package c1.Cau1_29;

import java.util.ArrayList;
import java.util.Scanner;

public class Cau1_29 {
    // Phương thức để nhập thông tin của các nhân viên
    public static NhanVien nhapThongTinNhanVien() {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Nhập thông tin nhân viên:");
        System.out.print("Họ và tên: ");
        String hoTen = scanner.nextLine();
        System.out.print("Năm vào làm: ");
        int namVaoLam = scanner.nextInt();

        System.out.println("Chọn loại nhân viên (1 - Văn phòng, 2 - Sản xuất, 3 - Quản lý):");
        int loaiNhanVien = scanner.nextInt();

        switch (loaiNhanVien) {
            case 1:
                System.out.print("Số ngày làm việc: ");
                int soNgayLamViec = scanner.nextInt();
                System.out.print("Trợ cấp: ");
                double troCap = scanner.nextDouble();
                return new NhanVienVanPhong(hoTen, namVaoLam, soNgayLamViec, troCap);

            case 2:
                System.out.print("Số sản phẩm: ");
                int soSanPham = scanner.nextInt();
                return new NhanVienSanXuat(hoTen, namVaoLam, soSanPham);

            case 3:
                System.out.print("Hệ số chức vụ: ");
                double heSoChucVu = scanner.nextDouble();
                System.out.print("Thưởng: ");
                double thuong = scanner.nextDouble();
                return new NhanVienQuanLy(hoTen, namVaoLam, heSoChucVu, thuong);

            default:
                System.out.println("Loại nhân viên không hợp lệ!");
                return null;
        }
    }

    // Phương thức để xuất thông tin của các nhân viên
    public static void xuatThongTinNhanVien(ArrayList<NhanVien> danhSachNhanVien) {
        System.out.println("Thông tin các nhân viên:");
        for (NhanVien nv : danhSachNhanVien) {
            System.out.println(nv);
        }
    }

    public static void main(String[] args) {

        ArrayList<NhanVien> danhSachNhanVien = new ArrayList<>();

        // Nhập thông tin của các nhân viên
        danhSachNhanVien.add(nhapThongTinNhanVien());
        danhSachNhanVien.add(nhapThongTinNhanVien());
        danhSachNhanVien.add(nhapThongTinNhanVien());

        // Xuất thông tin của các nhân viên
        xuatThongTinNhanVien(danhSachNhanVien);
    }
}
