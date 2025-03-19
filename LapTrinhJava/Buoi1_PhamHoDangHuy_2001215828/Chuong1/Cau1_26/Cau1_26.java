package c1.Cau1_26;
import java.util.Scanner;
public class Cau1_26 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);

        // Sử dụng các phương thức đã cài đặt của lớp TamGiac
        TamGiac tamGiac1 = new TamGiac();
        tamGiac1.nhap();
        tamGiac1.xuat();

        System.out.println();

        Diem diem1 = new Diem(1, 2);
        Diem diem2 = new Diem(3, 4);
        Diem diem3 = new Diem(5, 6);
        TamGiac tamGiac2 = new TamGiac(diem1, diem2, diem3);
        tamGiac2.xuat();

        double dienTich = tamGiac2.tinhDienTich();
        System.out.println("Diện tích tam giác: " + dienTich);

        double chuVi = tamGiac2.tinhChuVi();
        System.out.println("Chu vi tam giác: " + chuVi);

        scanner.close();
	}

}
