package c1.Cau1_32;

import java.util.Scanner;

//Class LDNgoaiBienChe kế thừa từ NguoiLaoDong
abstract class LDNgoaiBienChe extends NguoiLaoDong {
 protected double mucLuong;

 @Override
 abstract double tinhLuong();

 @Override
 void nhap() {
     Scanner scanner = new Scanner(System.in);
     System.out.println("Nhập thông tin cho người lao động ngoài biên chế:");
     System.out.print("Nhập mã số: ");
     maSo = scanner.nextLine();
     System.out.print("Nhập họ tên: ");
     hoTen = scanner.nextLine();
     System.out.print("Nhập năm sinh: ");
     namSinh = scanner.nextInt();
     System.out.print("Nhập mức lương: ");
     mucLuong = scanner.nextDouble();
 }

 @Override
 void xuat() {
     System.out.println("Thông tin người lao động ngoài biên chế:");
     System.out.println("Mã số: " + maSo);
     System.out.println("Họ tên: " + hoTen);
     System.out.println("Năm sinh: " + namSinh);
     System.out.println("Mức lương: " + mucLuong);
 }
}

