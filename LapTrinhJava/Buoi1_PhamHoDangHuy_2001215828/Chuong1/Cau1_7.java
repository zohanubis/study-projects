package c1;

import java.util.Scanner;

public class Cau1_7 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập vào một số nguyên là tháng: ");
        int month = scanner.nextInt();

        int days = 0;

        if (month >= 1 && month <= 12) {
            if (month == 2) {
                System.out.print("Nhập vào một số nguyên là năm: ");
                int year = scanner.nextInt();

                days = ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))) ? 29 : 28;
            } else if (month == 4 || month == 6 || month == 9 || month == 11) {
                days = 30;
            } else {
                days = 31;
            }

            System.out.println("Tháng " + month + " có " + days + " ngày.");
        } else {
            System.out.println("Tháng không hợp lệ.");
        }

        scanner.close();
    }

}
