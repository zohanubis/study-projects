package c1.Cau1_24;

import java.util.Scanner;

public class Diem2D {
    private int x;
    private int y;

    // Hàm khởi tạo mặc định
    public Diem2D() {
        this.x = 0;
        this.y = 0;
    }

    // Hàm khởi tạo có 2 tham số
    public Diem2D(int x, int y) {
        this.x = x;
        this.y = y;
    }

    // Nhập tọa độ cho điểm từ bàn phím
    public void nhapDiem() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập hoành độ x: ");
        this.x = scanner.nextInt();
        System.out.print("Nhập tung độ y: ");
        this.y = scanner.nextInt();
    }

    // Hiển thị tọa độ điểm theo dạng (x, y)
    public void hienThi() {
        System.out.println("(" + this.x + ", " + this.y + ")");
    }

    // Dời điểm đi 1 độ dời (dx, dy)
    public void doiDiem(int dx, int dy) {
        this.x += dx;
        this.y += dy;
    }

    // Lấy ra giá trị hoành độ của điểm
    public int giaTriX() {
        return this.x;
    }

    // Lấy ra giá trị tung độ của điểm
    public int giaTriY() {
        return this.y;
    }

    // Tính khoảng cách từ điểm đó đến gốc tọa độ
    public float khoangCach() {
        return (float) Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
    }

    // Tính khoảng cách từ điểm đó đến 1 điểm khác
    public float khoangCach(Diem2D d) {
        return (float) Math.sqrt(Math.pow(this.x - d.x, 2) + Math.pow(this.y - d.y, 2));
    }
}
