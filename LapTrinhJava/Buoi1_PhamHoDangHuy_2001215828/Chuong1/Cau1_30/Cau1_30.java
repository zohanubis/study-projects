package c1.Cau1_30;

import java.util.ArrayList;
import java.util.Scanner;

public class Cau1_30 {
    public static void main(String[] args) {
        // Tạo danh sách môn học
        ArrayList<MonHoc> danhSachMonHoc = new ArrayList<>();

        // Nhập thông tin các môn học
        nhapThongTinMonHoc(danhSachMonHoc);

        // Xuất thông tin các môn học
        xuatThongTinMonHoc(danhSachMonHoc);
    }

    // Phương thức để nhập thông tin của các môn học
    public static void nhapThongTinMonHoc(ArrayList<MonHoc> danhSachMonHoc) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập số lượng môn học: ");
        int soLuongMonHoc = scanner.nextInt();
        scanner.nextLine(); // Đọc bỏ dòng new line

        for (int i = 0; i < soLuongMonHoc; i++) {
            System.out.println("Nhập thông tin môn học thứ " + (i + 1) + ":");
            System.out.print("Mã môn học: ");
            String maMonHoc = scanner.nextLine();
            System.out.print("Tên môn học: ");
            String tenMonHoc = scanner.nextLine();
            System.out.print("Số tín chỉ: ");
            int soTinChi = scanner.nextInt();
            scanner.nextLine(); // Đọc bỏ dòng new line

            System.out.println("Chọn loại môn học (1 - Lý thuyết, 2 - Thực hành, 3 - Đồ án):");
            int loaiMonHoc = scanner.nextInt();
            scanner.nextLine(); // Đọc bỏ dòng new line

            switch (loaiMonHoc) {
                case 1:
                    System.out.print("Điểm tiểu luận: ");
                    double diemTieuLuan = scanner.nextDouble();
                    System.out.print("Điểm giữa kỳ: ");
                    double diemGiuaKy = scanner.nextDouble();
                    System.out.print("Điểm cuối kỳ: ");
                    double diemCuoiKy = scanner.nextDouble();
                    scanner.nextLine(); // Đọc bỏ dòng new line
                    danhSachMonHoc.add(new MonLyThuyet(maMonHoc, tenMonHoc, soTinChi, diemTieuLuan, diemGiuaKy, diemCuoiKy));
                    break;
                case 2:
                    ArrayList<Double> diemKiemTra = new ArrayList<>();
                    System.out.print("Nhập số lượng bài kiểm tra: ");
                    int soLuongBaiKiemTra = scanner.nextInt();
                    scanner.nextLine(); // Đọc bỏ dòng new line
                    for (int j = 0; j < soLuongBaiKiemTra; j++) {
                        System.out.print("Điểm bài kiểm tra " + (j + 1) + ": ");
                        double diem = scanner.nextDouble();
                        diemKiemTra.add(diem);
                    }
                    scanner.nextLine(); // Đọc bỏ dòng new line
                    danhSachMonHoc.add(new MonThucHanh(maMonHoc, tenMonHoc, soTinChi, diemKiemTra));
                    break;
                case 3:
                    System.out.print("Điểm của giáo viên hướng dẫn: ");
                    double diemGVHD = scanner.nextDouble();
                    System.out.print("Điểm của giáo viên phản biện đồ án: ");
                    double diemGVPB = scanner.nextDouble();
                    scanner.nextLine(); // Đọc bỏ dòng new line
                    danhSachMonHoc.add(new MonDoAn(maMonHoc, tenMonHoc, soTinChi, diemGVHD, diemGVPB));
                    break;
                default:
                    System.out.println("Loại môn học không hợp lệ!");
                    break;
            }
        }
    }

    // Phương thức để xuất thông tin của các môn học
    public static void xuatThongTinMonHoc(ArrayList<MonHoc> danhSachMonHoc) {
        System.out.println("Thông tin các môn học:");
        for (MonHoc monHoc : danhSachMonHoc) {
            System.out.println(monHoc);
        }
    }
}
