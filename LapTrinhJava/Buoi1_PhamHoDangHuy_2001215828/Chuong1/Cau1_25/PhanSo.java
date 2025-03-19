package c1.Cau1_25;

import java.util.Scanner;

public class PhanSo {
    private int tuSo;
    private int mauSo;

    // Hàm khởi tạo mặc định
    public PhanSo() {
        this.tuSo = 0;
        this.mauSo = 1;
    }

    // Hàm khởi tạo có 2 tham số
    public PhanSo(int tuSo, int mauSo) {
        this.tuSo = tuSo;
        if (mauSo != 0) {
            this.mauSo = mauSo;
        } else {
            System.out.println("Mẫu số không hợp lệ. Mẫu số được thiết lập là 1.");
            this.mauSo = 1;
        }
    }

    // Hàm nhập giá trị cho 1 phân số
    public void nhapPhanSo() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập tử số: ");
        this.tuSo = scanner.nextInt();
        do {
            System.out.print("Nhập mẫu số (khác 0): ");
            this.mauSo = scanner.nextInt();
            if (mauSo == 0) {
                System.out.println("Mẫu số không được bằng 0. Vui lòng nhập lại.");
            }
        } while (mauSo == 0);
    }

    // Hàm hiển thị phân số
    public void hienThi() {
        if (tuSo == 0) {
            System.out.println("0");
        } else if (mauSo == 1) {
            System.out.println(tuSo);
        } else {
            System.out.println(tuSo + "/" + mauSo);
        }
    }

    // Hàm nghịch đảo phân số (làm thay đổi giá trị phân số)
    public void nghichDao() {
        if (tuSo != 0) {
            int temp = tuSo;
            tuSo = mauSo;
            mauSo = temp;
        } else {
            System.out.println("Không thể nghịch đảo phân số khi tử số bằng 0.");
        }
    }

    // Hàm tính ra phân số nghịch đảo của 1 phân số
    public PhanSo giaTriNghichDao() {
        if (tuSo != 0) {
            return new PhanSo(mauSo, tuSo);
        } else {
            System.out.println("Không thể tính giá trị nghịch đảo khi tử số bằng 0.");
            return new PhanSo();
        }
    }

    // Hàm tính giá trị thực của phân số
    public float giaTriThuc() {
        return (float) tuSo / mauSo;
    }

    // Hàm so sánh lớn hơn với phân số a
    public boolean lonHon(PhanSo a) {
        return (tuSo * a.mauSo) > (a.tuSo * mauSo);
    }

    // Hàm cộng phân số với 1 phân số
    public PhanSo cong(PhanSo a) {
        int tuSoMoi = tuSo * a.mauSo + a.tuSo * mauSo;
        int mauSoMoi = mauSo * a.mauSo;
        return new PhanSo(tuSoMoi, mauSoMoi);
    }

    // Hàm trừ phân số với 1 phân số
    public PhanSo tru(PhanSo a) {
        int tuSoMoi = tuSo * a.mauSo - a.tuSo * mauSo;
        int mauSoMoi = mauSo * a.mauSo;
        return new PhanSo(tuSoMoi, mauSoMoi);
    }

    // Hàm nhân phân số với 1 phân số
    public PhanSo nhan(PhanSo a) {
        int tuSoMoi = tuSo * a.tuSo;
        int mauSoMoi = mauSo * a.mauSo;
        return new PhanSo(tuSoMoi, mauSoMoi);
    }

    // Hàm chia phân số cho 1 phân số
    public PhanSo chia(PhanSo a) {
        if (a.tuSo != 0) {
            int tuSoMoi = tuSo * a.mauSo;
            int mauSoMoi = mauSo * a.tuSo;
            return new PhanSo(tuSoMoi, mauSoMoi);
        } else {
            System.out.println("Không thể chia cho phân số có tử số bằng 0.");
            return new PhanSo();
        }
    }

    // Hàm cộng phân số với 1 số nguyên
    public PhanSo cong(int a) {
        return new PhanSo(tuSo + a * mauSo, mauSo);
    }

    // Hàm trừ phân số với 1 số nguyên
    public PhanSo tru(int a) {
        return new PhanSo(tuSo - a * mauSo, mauSo);
    }

    // Hàm nhân phân số với 1 số nguyên
    public PhanSo nhan(int a) {
        return new PhanSo(tuSo * a, mauSo);
    }

    // Hàm chia phân số cho 1 số nguyên
    public PhanSo chia(int a) {
        if (a != 0) {
            return new PhanSo(tuSo, mauSo * a);
        } else {
            System.out.println("Không thể chia cho số nguyên bằng 0.");
            return new PhanSo();
        }
    }
}
