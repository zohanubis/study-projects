package c1.Cau1_28;
import java.util.Scanner;
class Diem{
	int x, y;

    Diem(int x, int y) {
        this.x = x;
        this.y = y;
    }

    void hienThiThongTin() {
        System.out.println("Tọa độ: (" + x + ", " + y + ")");
    }
}
class DiemMau extends Diem {
    String mau;

    DiemMau(int x, int y, String mau) {
        super(x, y);
        this.mau = mau;
    }

    void ganMau(String mau) {
        this.mau = mau;
    }

    void nhapThongTin() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập tọa độ x: ");
        this.x = scanner.nextInt();
        System.out.print("Nhập tọa độ y: ");
        this.y = scanner.nextInt();
        System.out.print("Nhập màu: ");
        this.mau = scanner.next();
    }

    void hienThiThongTin() {
        super.hienThiThongTin();
        System.out.println("Màu: " + mau);
    }
}
