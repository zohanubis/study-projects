package c1;

import java.util.Scanner;

public class Cau1_6 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập vào một số nguyên là năm: ");
        int year = scanner.nextInt();

        if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))) {
            System.out.println(year + " là năm nhuần.");
        } else {
            System.out.println(year + " không là năm nhuần.");
        }

        scanner.close();
    }

}
