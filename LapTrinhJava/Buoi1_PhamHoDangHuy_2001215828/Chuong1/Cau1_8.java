package c1;

import java.util.Scanner;

public class Cau1_8 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập vào một số thực là điểm (trong thang điểm 10): ");
        double score = scanner.nextDouble();

        char grade;

        if (score >= 8.5) {
            grade = 'A';
        } else if (score >= 7.0) {
            grade = 'B';
        } else if (score >= 5.5) {
            grade = 'C';
        } else if (score >= 4.0) {
            grade = 'D';
        } else {
            grade = 'F';
        }

        System.out.println("Điểm chữ tương ứng là: " + grade);

        scanner.close();

    }

}
