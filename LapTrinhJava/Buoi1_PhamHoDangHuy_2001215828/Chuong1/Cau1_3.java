package c1;

import java.util.Scanner;

public class Cau1_3 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập số thứ nhất: ");
        int num1 = scanner.nextInt();

        System.out.print("Nhập số thứ hai: ");
        int num2 = scanner.nextInt();

        System.out.print("Nhập số thứ ba: ");
        int num3 = scanner.nextInt();

        int min = Math.min(Math.min(num1, num2), num3);
        int max = Math.max(Math.max(num1, num2), num3);

        System.out.println("Số nhỏ nhất: " + min);
        System.out.println("Số lớn nhất: " + max);

        scanner.close();
    }
}
