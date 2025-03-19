package c1.Cau1_32;

import java.util.Scanner;

//Class GVCoHuu kế thừa từ LDBienChe
class GVCoHuu extends LDBienChe {
 protected double hsThamNien;

 @Override
 double tinhLuong() {
     return HSL * LCS * (1 + hsThamNien);
 }

 @Override
 void nhap() {
     Scanner scanner = new Scanner(System.in);
     super.nhap(); // Gọi phương thức nhap() của lớp cha
     System.out.print("Nhập hệ số thâm niên: ");
     hsThamNien = scanner.nextDouble();
 }

 @Override
 void xuat() {
     super.xuat(); // Gọi phương thức xuat() của lớp cha
     System.out.println("Hệ số thâm niên: " + hsThamNien);
     System.out.println("Tổng lương: " +tinhLuong());
 }
}

