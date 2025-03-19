package c1;

import java.util.Scanner;

public class Cau1_11 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Nhập vào ngày: ");
		int day = scanner.nextInt();

		System.out.print("Nhập vào tháng: ");
		int month = scanner.nextInt();

		System.out.print("Nhập vào năm: ");
		int year = scanner.nextInt();

		int maxDays = 0;

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
			default:
				maxDays = 31;
				break;
		}

		if (day >= 1 && day <= maxDays) {
			// Ngày kế tiếp
			int nextDay = (day == maxDays) ? 1 : day + 1;
			int nextMonth = (day == maxDays) ? (month == 12 ? 1 : month + 1) : month;
			int nextYear = (day == maxDays && month == 12) ? year + 1 : year;

			// Ngày kế trước
			int prevDay = (day == 1) ? maxDays : day - 1;
			int prevMonth = (day == 1) ? (month == 1 ? 12 : month - 1) : month;
			int prevYear = (day == 1 && month == 1) ? year - 1 : year;

			System.out.println("Ngày kế tiếp là: " + nextDay + "/" + nextMonth + "/" + nextYear);
			System.out.println("Ngày kế trước là: " + prevDay + "/" + prevMonth + "/" + prevYear);
		} else {
			System.out.println("Ngày không hợp lệ.");
		}

		scanner.close();

	}

}
