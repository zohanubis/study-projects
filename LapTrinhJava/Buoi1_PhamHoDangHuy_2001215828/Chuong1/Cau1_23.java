package c1;

import java.util.Scanner;

public class Cau1_23 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int[][] matrix = new int[50][100];
        int m = 0, n = 0;

        while (true) {
            System.out.println();
            System.out.println("======================================================================");
            System.out.println("======== MENU ========");
            System.out.println("1. Nhập giá trị cho mxn phần tử của mảng");
            System.out.println("2. Phát sinh giá trị ngẫu nhiên cho mxn phần tử của mảng");
            System.out.println("3. Xuất giá trị các phần tử ra màn hình");
            System.out.println("4. Tính tổng giá trị các số lẻ");
            System.out.println("5. Tính tổng các giá trị dương trên dòng k");
            System.out.println("6. Đếm số lượng số dương");
            System.out.println("7. Đếm số lượng số nguyên tố trên một dòng của ma trận");
            System.out.println("8. Kiểm tra ma trận có tồn tại số âm hay không");
            System.out.println("9. Kiểm tra các phần tử trên dòng k có tăng dần từ trái qua phải hay không");
            System.out.println("10. Liệt kê dòng có chứa số nguyên tố");
            System.out.println("11. Liệt kê dòng chứa toàn giá trị chẵn");
            System.out.println("0. Thoát chương trình");
            System.out.print("Chọn chức năng (0-11): ");

            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Nhập số hàng m (m <= 50): ");
                    m = scanner.nextInt();
                    System.out.print("Nhập số cột n (n <= 100): ");
                    n = scanner.nextInt();
                    inputMatrix(matrix, m, n, scanner);
                    break;
                case 2:
                    System.out.print("Nhập số hàng m (m <= 50): ");
                    m = scanner.nextInt();
                    System.out.print("Nhập số cột n (n <= 100): ");
                    n = scanner.nextInt();
                    generateRandomMatrix(matrix, m, n);
                    break;
                case 3:
                    printMatrix(matrix, m, n);
                    break;
                case 4:
                    sumOfOddNumbers(matrix, m, n);
                    break;
                case 5:
                    System.out.print("Nhập dòng k: ");
                    int k = scanner.nextInt();
                    sumOfPositiveNumbersInRow(matrix, m, n, k);
                    break;
                case 6:
                    countPositiveNumbers(matrix, m, n);
                    break;
                case 7:
                    System.out.print("Nhập dòng k: ");
                    int rowNum = scanner.nextInt();
                    countPrimeNumbersInRow(matrix, m, n, rowNum);
                    break;
                case 8:
                    checkIfNegativeExists(matrix, m, n);
                    break;
                case 9:
                    System.out.print("Nhập dòng k: ");
                    int rowNumber = scanner.nextInt();
                    checkIfRowIncreasing(matrix, m, n, rowNumber);
                    break;
                case 10:
                    listRowsWithPrimes(matrix, m, n);
                    break;
                case 11:
                    listRowsWithAllEvenNumbers(matrix, m, n);
                    break;
                case 0:
                    System.out.println("Thoát chương trình.");
                    System.exit(0);
                default:
                    System.out.println("Chức năng không hợp lệ.");
            }
        }
    }

    // Hàm nhập giá trị cho mxn phần tử của mảng
    public static void inputMatrix(int[][] matrix, int m, int n, Scanner scanner) {
        System.out.println("Nhập giá trị cho các phần tử của mảng:");
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("Mảng[" + i + "][" + j + "]: ");
                matrix[i][j] = scanner.nextInt();
            }
        }
    }

    // Hàm phát sinh giá trị ngẫu nhiên cho mxn phần tử của mảng
    public static void generateRandomMatrix(int[][] matrix, int m, int n) {
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = (int) (Math.random() * 199) - 99;
            }
        }
    }

    // Hàm xuất giá trị các phần tử ra màn hình
    public static void printMatrix(int[][] matrix, int m, int n) {
        System.out.println("Ma trận:");
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println();
        }
    }

    // Hàm tính tổng giá trị các số lẻ
    public static void sumOfOddNumbers(int[][] matrix, int m, int n) {
        int sum = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (matrix[i][j] % 2 != 0) {
                    sum += matrix[i][j];
                }
            }
        }
        System.out.println("Tổng giá trị các số lẻ trong ma trận: " + sum);
    }

    // Hàm tính tổng các giá trị dương trên dòng k
    public static void sumOfPositiveNumbersInRow(int[][] matrix, int m, int n, int k) {
        if (k < 0 || k >= m) {
            System.out.println("Dòng không hợp lệ.");
            return;
        }

        int sum = 0;
        for (int j = 0; j < n; j++) {
            if (matrix[k][j] > 0) {
                sum += matrix[k][j];
            }
        }
        System.out.println("Tổng các giá trị dương trên dòng " + k + ": " + sum);
    }

    // Hàm đếm số lượng số dương
    public static void countPositiveNumbers(int[][] matrix, int m, int n) {
        int count = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (matrix[i][j] > 0) {
                    count++;
                }
            }
        }
        System.out.println("Số lượng số dương trong ma trận: " + count);
    }

    // Hàm đếm số lượng số nguyên tố trên một dòng của ma trận
    public static void countPrimeNumbersInRow(int[][] matrix, int m, int n, int rowNum) {
        if (rowNum < 0 || rowNum >= m) {
            System.out.println("Dòng không hợp lệ.");
            return;
        }

        int count = 0;
        for (int j = 0; j < n; j++) {
            if (isPrime(matrix[rowNum][j])) {
                count++;
            }
        }
        System.out.println("Số lượng số nguyên tố trên dòng " + rowNum + ": " + count);
    }

    // Hàm kiểm tra ma trận có tồn tại số âm hay không
    public static void checkIfNegativeExists(int[][] matrix, int m, int n) {
        boolean negativeExists = false;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (matrix[i][j] < 0) {
                    negativeExists = true;
                    break;
                }
            }
            if (negativeExists) {
                break;
            }
        }
        if (negativeExists) {
            System.out.println("Ma trận có tồn tại số âm.");
        } else {
            System.out.println("Ma trận không tồn tại số âm.");
        }
    }

    // Hàm kiểm tra các phần tử trên dòng k có tăng dần từ trái qua phải hay không
    public static void checkIfRowIncreasing(int[][] matrix, int m, int n, int rowNum) {
        if (rowNum < 0 || rowNum >= m) {
            System.out.println("Dòng không hợp lệ.");
            return;
        }

        boolean increasing = true;
        for (int j = 1; j < n; j++) {
            if (matrix[rowNum][j] < matrix[rowNum][j - 1]) {
                increasing = false;
                break;
            }
        }
        if (increasing) {
            System.out.println("Các phần tử trên dòng " + rowNum + " tăng dần từ trái qua phải.");
        } else {
            System.out.println("Các phần tử trên dòng " + rowNum + " không tăng dần từ trái qua phải.");
        }
    }

    // Hàm liệt kê dòng có chứa số nguyên tố
    public static void listRowsWithPrimes(int[][] matrix, int m, int n) {
        System.out.println("Các dòng có chứa số nguyên tố:");
        for (int i = 0; i < m; i++) {
            if (hasPrime(matrix[i])) {
                System.out.println("Dòng " + i);
            }
        }
    }

    // Hàm kiểm tra xem dòng có chứa số nguyên tố hay không
    public static boolean hasPrime(int[] row) {
        for (int num : row) {
            if (isPrime(num)) {
                return true;
            }
        }
        return false;
    }

    // Hàm liệt kê dòng chứa toàn giá trị chẵn
    public static void listRowsWithAllEvenNumbers(int[][] matrix, int m, int n) {
        System.out.println("Các dòng chứa toàn giá trị chẵn:");
        for (int i = 0; i < m; i++) {
            if (hasAllEvenNumbers(matrix[i])) {
                System.out.println("Dòng " + i);
            }
        }
    }

    // Hàm kiểm tra xem dòng có chứa toàn giá trị chẵn hay không
    public static boolean hasAllEvenNumbers(int[] row) {
        for (int num : row) {
            if (num % 2 != 0) {
                return false;
            }
        }
        return true;
    }

    // Hàm kiểm tra số nguyên tố
    public static boolean isPrime(int num) {
        if (num < 2) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }
}
