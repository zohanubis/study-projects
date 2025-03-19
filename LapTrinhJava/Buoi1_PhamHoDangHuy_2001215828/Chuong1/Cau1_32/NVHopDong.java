package c1.Cau1_32;

import java.util.Scanner;

//Class NVHopDong kế thừa từ LDNgoaiBienChe
class NVHopDong extends LDNgoaiBienChe implements I_XetKhenThuong {
 protected int ngayCong;

 @Override
 double tinhLuong() {
     return mucLuong * ngayCong;
 }

 @Override
 void nhap() {
     Scanner scanner = new Scanner(System.in);
     super.nhap(); // Gọi phương thức nhap() của lớp cha
     System.out.print("Nhập số ngày công: ");
     ngayCong = scanner.nextInt();
 }

 @Override
 void xuat() {
     super.xuat(); // Gọi phương thức xuat() của lớp cha
     System.out.println("Số ngày công: " + ngayCong);
     System.out.println("Lương cơ bản: "+ tinhLuong());
     System.out.println("Tổng lương (cả Khen Thưởng): "+(tinhLuong() + tinhKhenThuong()));
 }

 @Override
 public double tinhKhenThuong() {
     if (ngayCong >= 25) {
         return 1500000;
     }
     return 0;
 }
}

