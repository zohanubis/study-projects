package c1.Cau1_32;

import java.util.Scanner;

//Class NVCoHuu kế thừa từ LDBienChe
class NVCoHuu extends LDBienChe implements I_XetKhenThuong {
 protected int soGioLamThem;

 @Override
 double tinhLuong() {
     return HSL * LCS + soGioLamThem * 50000;
 }

 @Override
 void nhap() {
     Scanner scanner = new Scanner(System.in);
     super.nhap(); 
     System.out.print("Nhập số giờ làm thêm: ");
     soGioLamThem = scanner.nextInt();
 }

 @Override
 void xuat() {
     super.xuat();
     System.out.println("Số giờ làm thêm: " + soGioLamThem);
     System.out.println("Số tiền khen thưởng: "+ tinhKhenThuong());
     System.out.println("Tổng tiền lương: " + (tinhLuong() + tinhKhenThuong()));
 }

 @Override
 public double tinhKhenThuong() {
     if (soGioLamThem >= 40) {
         return 1000000;
     }
     return 0;
 }
}

