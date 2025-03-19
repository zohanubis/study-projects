package c1;

import java.util.Scanner;

public class Cau1_15 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		double sum = 0;
		double n = 0;
		do {
			System.out.print("Nhập vào số n : ");
			n = scanner.nextDouble();
			sum += n;
		}

		while (n != 0);
		System.out.print("Tổng số đã nhập : " + sum);
	}
}
