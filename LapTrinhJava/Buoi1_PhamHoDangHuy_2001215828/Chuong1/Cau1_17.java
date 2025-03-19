package c1;

import java.util.Scanner;

public class Cau1_17 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Nhập vào số n : ");
		int n = scanner.nextInt();

		int sum = 0;
		do {
			int digit = n % 10;
			if (digit % 2 == 0) {
				sum += digit;
			}
			n /= 10;
		} while (n != 0);
		System.out.print("Tổng số nguyên chẵn : " + sum);
		scanner.close();

	}

}
