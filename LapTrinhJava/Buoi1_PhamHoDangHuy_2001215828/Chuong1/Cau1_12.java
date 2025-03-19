package c1;

import java.util.Scanner;

public class Cau1_12 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập vào số nguyên dương n: ");
        int n = scanner.nextInt();

        int count = 0;

        for (int i = 1; i <= n; i++) {
            if (n % i == 0) {
                count++;
            }
        }

        System.out.println("Số lượng ước số của " + n + " là: " + count);

        scanner.close();

    }

}
