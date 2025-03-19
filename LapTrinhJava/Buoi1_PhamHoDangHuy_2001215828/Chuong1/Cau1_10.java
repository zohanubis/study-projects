package c1;

import java.util.Scanner;

public class Cau1_10 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập vào ngày: ");
        int day = scanner.nextInt();

        System.out.print("Nhập vào tháng: ");
        int month = scanner.nextInt();

        System.out.print("Nhập vào năm: ");
        int year = scanner.nextInt();

        boolean isValid = false;

        if (year > 0 && month >= 1 && month <= 12) {
            int maxDays = 31;

            switch (month) {
                case 4:
                case 6:
                case 9:
                case 11:
                    maxDays = 30;
                    break;
                case 2:
                    if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))) {
                        maxDays = 29;
                    } else {
                        maxDays = 28;
                    }
                    break;
            }

            isValid = (day >= 1 && day <= maxDays);
        }

        if (isValid) {
            System.out.println("Ngày hợp lệ.");
        } else {
            System.out.println("Ngày không hợp lệ.");
        }

        scanner.close();

    }

}
