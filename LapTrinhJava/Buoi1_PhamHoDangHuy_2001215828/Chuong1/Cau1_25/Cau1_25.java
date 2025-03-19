package c1.Cau1_25;
import java.util.Scanner; 
public class Cau1_25 {

	public static void main(String[] args) {

		// Tạo phân số a = 3/7, b = 4/9
        PhanSo a = new PhanSo(3, 7);
        PhanSo b = new PhanSo(4, 9);

        // Hiển thị giá trị của chúng ra màn hình
        System.out.println("Giá trị của phân số a: " + a.giaTriThuc());
        System.out.println("Giá trị của phân số b: " + b.giaTriThuc());

        // Tạo 2 phân số x và y. Nhập giá trị cho x và y từ bàn phím
        PhanSo x = new PhanSo();
        PhanSo y = new PhanSo();
        System.out.println("Nhập giá trị cho phân số x:");
        x.nhapPhanSo();
        System.out.println("Nhập giá trị cho phân số y:");
        y.nhapPhanSo();

        // Hiển thị giá trị nghịch đảo của phân số x ra màn hình
        PhanSo xNghichDao = x.giaTriNghichDao();
        System.out.print("Giá trị nghịch đảo của phân số x: ");
        xNghichDao.hienThi();

        // Tính tổng của x + y và in kết quả ra màn hình
        PhanSo tongXY = x.cong(y);
        System.out.print("Tổng của x + y: ");
        tongXY.hienThi();

        // Nhập vào 1 danh sách gồm n phân số (n: nhập từ bàn phím)
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập số lượng phân số (n): ");
        int n = scanner.nextInt();
        PhanSo[] danhSachPhanSo = new PhanSo[n];
        for (int i = 0; i < n; i++) {
            danhSachPhanSo[i] = new PhanSo();
            System.out.println("Nhập giá trị cho phân số thứ " + (i + 1) + ":");
            danhSachPhanSo[i].nhapPhanSo();
        }

        // Tính tổng n phân số đó
        PhanSo tongDanhSach = new PhanSo();
        for (PhanSo ps : danhSachPhanSo) {
            tongDanhSach = tongDanhSach.cong(ps);
        }
        System.out.print("Tổng của danh sách phân số: ");
        tongDanhSach.hienThi();

        // Tìm phân số lớn nhất trong danh sách phân số trên
        PhanSo phanSoLonNhat = danhSachPhanSo[0];
        for (int i = 1; i < n; i++) {
            if (danhSachPhanSo[i].lonHon(phanSoLonNhat)) {
                phanSoLonNhat = danhSachPhanSo[i];
            }
        }
        System.out.print("Phân số lớn nhất trong danh sách: ");
        phanSoLonNhat.hienThi();

        // Sắp xếp danh sách phân số theo thứ tự tăng dần
        for (int i = 0; i < n - 1; i++) {
            for (int j = i + 1; j < n; j++) {
                if (danhSachPhanSo[i].lonHon(danhSachPhanSo[j])) {
                    PhanSo temp = danhSachPhanSo[i];
                    danhSachPhanSo[i] = danhSachPhanSo[j];
                    danhSachPhanSo[j] = temp;
                }
            }
        }

        // Hiển thị danh sách sau khi sắp xếp
        System.out.println("Danh sách sau khi sắp xếp tăng dần:");
        for (PhanSo ps : danhSachPhanSo) {
            ps.hienThi();
        }
	}

}
