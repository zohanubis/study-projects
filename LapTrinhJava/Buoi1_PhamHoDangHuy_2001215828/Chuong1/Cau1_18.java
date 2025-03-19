package c1;

import java.util.Scanner;

// In kích thước hình chữ nhật m x n
public class Cau1_18 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhập vào chiều dài m: ");
		int m = scanner.nextInt();
		System.out.print("Nhập vào chiều rộng n: ");
		int n = scanner.nextInt();

		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
				System.out.print("* ");
			}
			System.out.println();
		}
		scanner.close();

	}

}
