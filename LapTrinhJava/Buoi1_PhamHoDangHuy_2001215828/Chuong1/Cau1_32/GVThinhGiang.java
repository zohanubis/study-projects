package c1.Cau1_32;

import java.util.Scanner;

//Class GVThinhGiang kế thừa từ LDNgoaiBienChe
class GVThinhGiang extends LDNgoaiBienChe {
 protected int soTietGD;
 protected String trinhDo;

 @Override
 double tinhLuong() {
     double heso = 1.0;
     if (trinhDo.equals("ThS")) {
         heso = 1.2;
     } else if (trinhDo.equals("TS")) {
         heso = 1.5;
     } else if (trinhDo.equals("PGS")) {
         heso = 1.8;
     } else if (trinhDo.equals("GS")) {
         heso = 2.0;
     }
     return mucLuong * soTietGD * + heso;
 }

 @Override
 void nhap() {
     Scanner scanner = new Scanner(System.in);
     super.nhap();
     System.out.print("Nhập số tiết giảng dạy: ");
     soTietGD = scanner.nextInt();
     System.out.print("Nhập trình độ (ĐH/ThS/TS/PGS/GS): ");
     trinhDo = scanner.next();
 }

 @Override
 void xuat() {
     super.xuat();
     System.out.println("Số tiết giảng dạy: " + soTietGD);
     System.out.println("Trình độ: " + trinhDo);
     System.out.println("Tổng lương: " + tinhLuong());
 }
}

