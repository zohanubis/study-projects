package c1.Cau1_33;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

// Class quản lý danh sách khách hàng
public class QuanLyKhachHang {
    private ArrayList<KhachHang> danhSachKhachHang = new ArrayList<>();

    // Nhập danh sách khách hàng từ bàn phím
    public void nhapKhachHang() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập số lượng khách hàng: ");
        int n = scanner.nextInt();
        scanner.nextLine(); // Đọc bỏ dòng trống

        for (int i = 0; i < n; i++) {
            System.out.println("Nhập thông tin cho khách hàng thứ " + (i + 1) + ":");
            System.out.print("Nhập mã số: ");
            String maSo = scanner.nextLine();
            System.out.print("Nhập họ tên: ");
            String hoTen = scanner.nextLine();
            System.out.print("Nhập năm sinh: ");
            int namSinh = scanner.nextInt();
            scanner.nextLine(); // Đọc bỏ dòng trống

            KhachHang khachHang = new KhachHang(maSo, hoTen, namSinh);
            danhSachKhachHang.add(khachHang);
        }
    }

    // Xuất danh sách khách hàng ra màn hình
    public void xuatKhachHang() {
        System.out.println("Danh sách khách hàng:");
        for (KhachHang khachHang : danhSachKhachHang) {
            System.out.println(khachHang);
        }
    }

    // Ghi danh sách khách hàng ra file
    public void ghiDanhSachVaoFile(String tenFile) {
        try (ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(tenFile))) {
            outputStream.writeObject(danhSachKhachHang);
            System.out.println("Ghi danh sách khách hàng vào file thành công.");
        } catch (IOException e) {
            System.out.println("Lỗi: " + e.getMessage());
        }
    }

    // Đọc danh sách khách hàng từ file
    public void docDanhSachTuFile(String tenFile) {
        try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(tenFile))) {
            danhSachKhachHang = (ArrayList<KhachHang>) inputStream.readObject();
            System.out.println("Đọc danh sách khách hàng từ file thành công.");
        } catch (IOException | ClassNotFoundException e) {
            System.out.println("Lỗi: " + e.getMessage());
        }
    }
}

