package c1;

import java.util.Scanner;

public class Cau1_22 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int[] array = new int[500];
        int n = 0;

        while (true) {
            System.out.println();
            System.out.println("--------------------------------");
            System.out.println("======== MENU ========");
            System.out.println("1. Nhập giá trị cho n phần tử mảng");
            System.out.println("2. Phát sinh giá trị ngẫu nhiên cho n phần tử mảng");
            System.out.println("3. Xuất mảng ra màn hình");
            System.out.println("4. Liệt kê giá trị âm trong mảng");
            System.out.println("5. Liệt kê số nguyên tố trong mảng");
            System.out.println("6. Liệt kê phần tử trong đoạn [a, b]");
            System.out.println("7. Tính tổng số nguyên tố trong mảng");
            System.out.println("8. Tính trung bình cộng của phần tử dương");
            System.out.println("9. Đếm số phần tử lớn hơn x");
            System.out.println("10. Đếm số phần tử là số nguyên tố");
            System.out.println("11. Kiểm tra mảng chứa toàn số nguyên tố");
            System.out.println("12. Kiểm tra mảng tăng dần");
            System.out.println("13. Tìm giá trị lớn nhất");
            System.out.println("14. Tìm giá trị nhỏ nhất");
            System.out.println("15. Tìm số âm lớn nhất");
            System.out.println("16. Đảo ngược mảng");
            System.out.println("0. Thoát chương trình");

            System.out.print("Chọn chức năng (0-16): ");

            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    n = inputArray(array, scanner);
                    break;
                case 2:
                    n = generateRandomArray(array, scanner);
                    break;
                case 3:
                    printArray(array, n);
                    break;
                case 4:
                    printNegativeNumbers(array, n);
                    break;
                case 5:
                    printPrimeNumbers(array, n);
                    break;
                case 6:
                    printInRange(array, n, scanner);
                    break;
                case 7:
                    sumOfPrimes(array, n);
                    break;
                case 8:
                    averageOfPositives(array, n);
                    break;
                case 9:
                    countGreaterThanX(array, n, scanner);
                    break;
                case 10:
                    countPrimeNumbers(array, n);
                    break;
                case 11:
                    checkIfAllPrimes(array, n);
                    break;
                case 12:
                    checkIfIncreasing(array, n);
                    break;
                case 13:
                    findMaxValue(array, n);
                    break;
                case 14:
                    findMinValue(array, n);
                    break;
                case 15:
                    findMaxNegativeValue(array, n);
                    break;
                case 16:
                    reverseArray(array, n);
                    break;
                case 0:
                    System.out.println("Thoát chương trình.");
                    System.exit(0);
                default:
                    System.out.println("Chức năng không hợp lệ.");
            }
        }
    }

    // Hàm nhập giá trị cho n phần tử mảng
    public static int inputArray(int[] array, Scanner scanner) {
        System.out.print("Nhập vào số lượng phần tử n (n <= 500): ");
        int n = scanner.nextInt();

        System.out.println("Nhập giá trị cho các phần tử:");
        for (int i = 0; i < n; i++) {
            System.out.print("Phần tử thứ " + (i + 1) + ": ");
            array[i] = scanner.nextInt();
        }

        return n;
    }

    // Hàm phát sinh giá trị ngẫu nhiên cho n phần tử mảng
    public static int generateRandomArray(int[] array, Scanner scanner) {
        System.out.print("Nhập vào số lượng phần tử n (n <= 500): ");
        int n = scanner.nextInt();

        for (int i = 0; i < n; i++) {
            array[i] = (int) (Math.random() * 399) - 199;
        }

        return n;
    }

    // Hàm xuất mảng ra màn hình
    public static void printArray(int[] array, int n) {
        System.out.print("Mảng: ");
        for (int i = 0; i < n; i++) {
            System.out.print(array[i] + " ");
        }
        System.out.println();
    }

    // Hàm liệt kê giá trị âm trong mảng
    public static void printNegativeNumbers(int[] array, int n) {
        System.out.print("Các giá trị âm trong mảng: ");
        for (int i = 0; i < n; i++) {
            if (array[i] < 0) {
                System.out.print(array[i] + " ");
            }
        }
        System.out.println();
    }

    // Hàm kiểm tra số nguyên tố
    public static boolean isPrime(int number) {
        if (number < 2) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }

    // Hàm liệt kê số nguyên tố trong mảng
    public static void printPrimeNumbers(int[] array, int n) {
        System.out.print("Các số nguyên tố trong mảng: ");
        for (int i = 0; i < n; i++) {
            if (isPrime(array[i])) {
                System.out.print(array[i] + " ");
            }
        }
        System.out.println();
    }

    // Hàm liệt kê phần tử trong đoạn [a, b]
    public static void printInRange(int[] array, int n, Scanner scanner) {
        System.out.print("Nhập giá trị a: ");
        int a = scanner.nextInt();

        System.out.print("Nhập giá trị b: ");
        int b = scanner.nextInt();

        System.out.print("Các phần tử trong đoạn [" + a + ", " + b + "]: ");
        for (int i = 0; i < n; i++) {
            if (array[i] >= a && array[i] <= b) {
                System.out.print(array[i] + " ");
            }
        }
        System.out.println();
    }

    // Hàm tính tổng số nguyên tố trong mảng
    public static void sumOfPrimes(int[] array, int n) {
        int sum = 0;
        for (int i = 0; i < n; i++) {
            if (isPrime(array[i])) {
                sum += array[i];
            }
        }
        System.out.println("Tổng số nguyên tố trong mảng: " + sum);
    }

    // Hàm tính trung bình cộng của phần tử dương
    public static void averageOfPositives(int[] array, int n) {
        int count = 0;
        int sum = 0;
        for (int i = 0; i < n; i++) {
            if (array[i] > 0) {
                sum += array[i];
                count++;
            }
        }
        if (count > 0) {
            double average = (double) sum / count;
            System.out.println("Trung bình cộng của phần tử dương trong mảng: " + average);
        } else {
            System.out.println("Không có phần tử dương trong mảng.");
        }
    }

    // Hàm đếm số phần tử lớn hơn x
    public static void countGreaterThanX(int[] array, int n, Scanner scanner) {
        System.out.print("Nhập giá trị x: ");
        int x = scanner.nextInt();

        int count = 0;
        for (int i = 0; i < n; i++) {
            if (array[i] > x) {
                count++;
            }
        }
        System.out.println("Số phần tử lớn hơn " + x + " trong mảng: " + count);
    }

    // Hàm đếm số phần tử là số nguyên tố
    public static void countPrimeNumbers(int[] array, int n) {
        int count = 0;
        for (int i = 0; i < n; i++) {
            if (isPrime(array[i])) {
                count++;
            }
        }
        System.out.println("Số phần tử là số nguyên tố trong mảng: " + count);
    }

    // Hàm kiểm tra mảng chứa toàn số nguyên tố
    public static void checkIfAllPrimes(int[] array, int n) {
        boolean allPrimes = true;
        for (int i = 0; i < n; i++) {
            if (!isPrime(array[i])) {
                allPrimes = false;
                break;
            }
        }
        if (allPrimes) {
            System.out.println("Mảng chứa toàn số nguyên tố.");
        } else {
            System.out.println("Mảng không chứa toàn số nguyên tố.");
        }
    }

    // Hàm kiểm tra mảng tăng dần
    public static void checkIfIncreasing(int[] array, int n) {
        boolean increasing = true;
        for (int i = 1; i < n; i++) {
            if (array[i] < array[i - 1]) {
                increasing = false;
                break;
            }
        }
        if (increasing) {
            System.out.println("Mảng tăng dần.");
        } else {
            System.out.println("Mảng không tăng dần.");
        }
    }

    // Hàm tìm giá trị lớn nhất
    public static void findMaxValue(int[] array, int n) {
        int max = Integer.MIN_VALUE;
        for (int i = 0; i < n; i++) {
            if (array[i] > max) {
                max = array[i];
            }
        }
        System.out.println("Giá trị lớn nhất trong mảng: " + max);
    }

    // Hàm tìm giá trị nhỏ nhất
    public static void findMinValue(int[] array, int n) {
        int min = Integer.MAX_VALUE;
        for (int i = 0; i < n; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        System.out.println("Giá trị nhỏ nhất trong mảng: " + min);
    }

    // Hàm tìm số âm lớn nhất
    public static void findMaxNegativeValue(int[] array, int n) {
        int maxNegative = Integer.MIN_VALUE;
        for (int i = 0; i < n; i++) {
            if (array[i] < 0 && array[i] > maxNegative) {
                maxNegative = array[i];
            }
        }
        if (maxNegative != Integer.MIN_VALUE) {
            System.out.println("Số âm lớn nhất trong mảng: " + maxNegative);
        } else {
            System.out.println("Không có số âm trong mảng.");
        }
    }

    // Hàm đảo ngược mảng
    public static void reverseArray(int[] array, int n) {
        System.out.print("Mảng sau khi đảo ngược: ");
        for (int i = n - 1; i >= 0; i--) {
            System.out.print(array[i] + " ");
        }
        System.out.println();
    }
}
