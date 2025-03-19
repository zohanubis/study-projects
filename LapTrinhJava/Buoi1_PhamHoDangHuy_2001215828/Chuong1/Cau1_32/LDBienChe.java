package c1.Cau1_32;

import java.util.Scanner;

//Class LDBienChe kế thừa từ NguoiLaoDong
abstract class LDBienChe extends NguoiLaoDong {
 protected double HSL;
 protected static final double LCS = 1490000; // LCB giống nhau cho tất cả GV cơ hữu và NV cơ hữu

 @Override
 abstract double tinhLuong();

 @Override
 void nhap() {
     Scanner scanner = new Scanner(System.in);
     System.out.println("Nhập thông tin cho người lao động biên chế:");
     System.out.print("Nhập mã số: ");
     maSo = scanner.nextLine();
     System.out.print("Nhập họ tên: ");
     hoTen = scanner.nextLine();
     System.out.print("Nhập năm sinh: ");
     namSinh = scanner.nextInt();
     System.out.print("Nhập hệ số lương: ");
     HSL = scanner.nextDouble();
 }

 @Override
 void xuat() {
     System.out.println("Thông tin người lao động biên chế:");
     System.out.println("Mã số: " + maSo);
     System.out.println("Họ tên: " + hoTen);
     System.out.println("Năm sinh: " + namSinh);
     System.out.println("Hệ số lương: " + HSL);
 }
}
