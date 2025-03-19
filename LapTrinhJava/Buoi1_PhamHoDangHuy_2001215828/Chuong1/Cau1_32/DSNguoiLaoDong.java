package c1.Cau1_32;

import java.util.ArrayList;
import java.util.Scanner;

//Class DSNguoiLaoDong
class DSNguoiLaoDong {
 private ArrayList<NguoiLaoDong> dsNLD;

 double tinhTongLuong() {
     double tongLuong = 0;
     for (NguoiLaoDong nld : dsNLD) {
         tongLuong += nld.tinhLuong();
     }
     return tongLuong;
 }

 void nhap() {
     Scanner scanner = new Scanner(System.in);
     System.out.print("Nhập số lượng người lao động: ");
     int n = scanner.nextInt();
     dsNLD = new ArrayList<>();
     for (int i = 0; i < n; i++) {
         System.out.println("Nhập thông tin cho người lao động thứ " + (i + 1) + ":");
         System.out.print("Loại người lao động (1 - GV cơ hữu, 2 - NV cơ hữu, 3 - NV hợp đồng, 4 - GV thỉnh giảng): ");
         int loai = scanner.nextInt();
         NguoiLaoDong nld;
         switch (loai) {
             case 1:
                 nld = new GVCoHuu();
                 break;
             case 2:
                 nld = new NVCoHuu();
                 break;
             case 3:
                 nld = new NVHopDong();
                 break;
             case 4:
                 nld = new GVThinhGiang();
                 break;
             default:
                 System.out.println("Loại không hợp lệ.");
                 return;
         }
         nld.nhap();
         dsNLD.add(nld);
     }
 }

 void xuat() {
     System.out.println("Danh sách người lao động:");
     for (int i = 0; i < dsNLD.size(); i++) {
         System.out.println("Thông tin người lao động thứ " + (i + 1) + ":");
         dsNLD.get(i).xuat();
     }
 }
}
