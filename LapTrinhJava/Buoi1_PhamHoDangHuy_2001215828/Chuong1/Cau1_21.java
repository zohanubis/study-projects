package c1;

import java.util.Scanner;

public class Cau1_21 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập vào chiều cao h: ");
        int h = scanner.nextInt();

        for (int i = 0; i < h; i++) {
            for (int j = 0; j <= i; j++) {
                if (i == h - 1 || j == 0 || j == i) {
                    System.out.print("* ");
                } else {
                    System.out.print("  "); // Khoảng trắng để tạo hình tam giác cân rỗng
                }
            }
            System.out.println();
        }

        scanner.close();

    }

}
