package c1;

import java.util.Scanner;

public class Cau1_9 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập vào chỉ số điện cũ: ");
        int oldReading = scanner.nextInt();

        System.out.print("Nhập vào chỉ số điện mới: ");
        int newReading = scanner.nextInt();

        if (oldReading <= newReading) {
            int consumption = newReading - oldReading;

            double bill = 0;

            if (consumption <= 50) {
                bill = consumption * 1480;
            } else if (consumption <= 100) {
                bill = 50 * 1480 + (consumption - 50) * 1533;
            } else if (consumption <= 200) {
                bill = 50 * 1480 + 50 * 1533 + (consumption - 100) * 1786;
            } else if (consumption <= 300) {
                bill = 50 * 1480 + 50 * 1533 + 100 * 1786 + (consumption - 200) * 2242;
            } else {
                bill = 50 * 1480 + 50 * 1533 + 100 * 1786 + 100 * 2242 + (consumption - 300) * 2503;
            }

            System.out.println("Tiền điện phải trả trong tháng là: " + bill + " VNĐ");
        } else {
            System.out.println("Dữ liệu không hợp lệ. Chỉ số điện mới phải lớn hơn hoặc bằng chỉ số điện cũ.");
        }
        scanner.close();
    }

}
