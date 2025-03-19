package c1;

import java.util.Scanner;

public class Cau1_2 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhập số thứ nhất : ");
		int s1 = scanner.nextInt();

		System.out.print("Nhập số thứ hai: ");
		int s2 = scanner.nextInt();

		if (s1 < s2) {
			System.out.println("Số nhỏ hơn là : " + s1);
			System.out.println("Số lớn hơn là :  " + s2);
		} else {
			System.out.println("Số nhỏ hơn là : " + s2);
			System.out.println("Số lớn hơn là :  " + s1);
		}
		scanner.close();
	}

}
