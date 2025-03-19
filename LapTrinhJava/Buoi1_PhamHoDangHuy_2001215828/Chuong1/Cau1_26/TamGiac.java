package c1.Cau1_26;

import java.util.Scanner;

public class TamGiac {
    private Diem diem1;
    private Diem diem2;
    private Diem diem3;

    public TamGiac() {
        this.diem1 = new Diem();
        this.diem2 = new Diem();
        this.diem3 = new Diem();
    }

    public TamGiac(Diem diem1, Diem diem2, Diem diem3) {
        this.diem1 = diem1;
        this.diem2 = diem2;
        this.diem3 = diem3;
    }

    public TamGiac(TamGiac tamGiac) {
        this.diem1 = tamGiac.diem1;
        this.diem2 = tamGiac.diem2;
        this.diem3 = tamGiac.diem3;
    }

    public Diem getDiem1() {
        return diem1;
    }

    public void setDiem1(Diem diem1) {
        this.diem1 = diem1;
    }

    public Diem getDiem2() {
        return diem2;
    }

    public void setDiem2(Diem diem2) {
        this.diem2 = diem2;
    }

    public Diem getDiem3() {
        return diem3;
    }

    public void setDiem3(Diem diem3) {
        this.diem3 = diem3;
    }

    public void nhap() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập thông tin tam giác:");
        
        System.out.print("Nhập tọa độ x của điểm 1: ");
        double x1 = scanner.nextDouble();
        System.out.print("Nhập tọa độ y của điểm 1: ");
        double y1 = scanner.nextDouble();
        diem1 = new Diem(x1, y1);
        
        System.out.print("Nhập tọa độ x của điểm 2: ");
        double x2 = scanner.nextDouble();
        System.out.print("Nhập tọa độ y của điểm 2: ");
        double y2 = scanner.nextDouble();
        diem2 = new Diem(x2, y2);
        
        System.out.print("Nhập tọa độ x của điểm 3: ");
        double x3 = scanner.nextDouble();
        System.out.print("Nhập tọa độ y của điểm 3: ");
        double y3 = scanner.nextDouble();
        diem3 = new Diem(x3, y3);
    }

    public void xuat() {
        System.out.println("Thông tin tam giác:");
        System.out.println("Điểm 1: (" + diem1.getX() + ", " + diem1.getY() + ")");
        System.out.println("Điểm 2: (" + diem2.getX() + ", " + diem2.getY() + ")");
        System.out.println("Điểm 3: (" + diem3.getX() + ", " + diem3.getY() + ")");
    }

    public double tinhDienTich() {

        double a = diem1.getX() - diem2.getX();
        double b = diem1.getY() - diem2.getY();
        double c = diem1.getX() - diem3.getX();
        double d = diem1.getY() - diem3.getY();

        return 0.5 * Math.abs(a * d - b * c);
    }

    public double tinhChuVi() {

        double a = khoangCach(diem1, diem2);
        double b = khoangCach(diem2, diem3);
        double c = khoangCach(diem1, diem3);

        return a + b + c;
    }

    private double khoangCach(Diem diemA, Diem diemB) {
        double dx = diemA.getX() - diemB.getX();
        double dy = diemA.getY() - diemB.getY();
        return Math.sqrt(dx * dx + dy * dy);
    }
}

