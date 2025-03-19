package c1;

import java.util.Scanner;

public class Cau1_19 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhập vào chiều dài m: ");
		int m = scanner.nextInt();
		System.out.print("Nhập vào chiều rộng n: ");
		int n = scanner.nextInt();

		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
				if (i == 0 || i == m - 1 || j == 0 || j == n - 1) {
					System.out.print("* ");
				} else {
					System.out.print("  "); // Khoảng trắng để tạo hình chữ nhật rỗng
				}
			}
			System.out.println();
		}
		scanner.close();

	}

}
