package c1;

import java.util.Scanner;

public class Cau1_20 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập vào chiều cao h: ");
        int h = scanner.nextInt();

        for (int i = 0; i < h; i++) {
            for (int j = 0; j <= i; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }

        scanner.close();

    }

}
