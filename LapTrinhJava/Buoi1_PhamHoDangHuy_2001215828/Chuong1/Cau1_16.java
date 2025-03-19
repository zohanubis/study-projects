package c1;

import java.util.Scanner;

public class Cau1_16 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Nhập số n : ");
		int n = scanner.nextInt();

		int count = 0;
		while (n > 0) {
			int digit = n % 10;
			if (digit % 2 != 0) {
				count++;
			}
			n /= 10;
		}
		System.out.print("Số lượng số nguyên lẻ : " + count);
		scanner.close();
	}

}
