package c1.Cau1_32;

import java.util.Scanner;

//Abstract class NguoiLaoDong
abstract class NguoiLaoDong {
	 protected String maSo;
	 protected String hoTen;
	 protected int namSinh;
	
	 abstract double tinhLuong();
	
	 abstract void nhap();
	
	 abstract void xuat();
}

