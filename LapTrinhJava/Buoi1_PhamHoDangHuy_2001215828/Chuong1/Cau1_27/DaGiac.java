package c1.Cau1_27;
import java.util.Scanner;
import java.util.ArrayList;
public class DaGiac {
	    private ArrayList<double[]> danhSachDinh;

	    public DaGiac() {
	        danhSachDinh = new ArrayList<>();
	    }

	    public DaGiac(ArrayList<double[]> danhSachDinh) {
	        this.danhSachDinh = new ArrayList<>(danhSachDinh);
	    }

	    public DaGiac(DaGiac other) {
	        this.danhSachDinh = new ArrayList<>(other.danhSachDinh);
	    }

	    public ArrayList<double[]> getDanhSachDinh() {
	        return danhSachDinh;
	    }

	    public void setDanhSachDinh(ArrayList<double[]> danhSachDinh) {
	        this.danhSachDinh = danhSachDinh;
	    }

	    public void nhap() {
	        Scanner scanner = new Scanner(System.in);
	        System.out.print("Nhập số đỉnh của đa giác: ");
	        int soDinh = scanner.nextInt();

	        danhSachDinh.clear();
	        for (int i = 0; i < soDinh; i++) {
	            System.out.println("Nhập đỉnh thứ " + (i + 1) + ": ");
	            System.out.print("  X = ");
	            double x = scanner.nextDouble();
	            System.out.print("  Y = ");
	            double y = scanner.nextDouble();
	            danhSachDinh.add(new double[]{x, y});
	        }
	    }

	    public void xuat() {
	        System.out.println("Đỉnh của đa giác: ");
	        for (int i = 0; i < danhSachDinh.size(); i++) {
	            System.out.println("Đỉnh " + (i + 1) + ": (" + danhSachDinh.get(i)[0] + ", " + danhSachDinh.get(i)[1] + ")");
	        }
	    }

	    public double tinhChuVi() {
	        double chuVi = 0;
	        int soDinh = danhSachDinh.size();

	        for (int i = 0; i < soDinh; i++) {
	            double[] dinhHienTai = danhSachDinh.get(i);
	            double[] dinhKeTiep = (i == soDinh - 1) ? danhSachDinh.get(0) : danhSachDinh.get(i + 1);

	            double khoangCach = Math.sqrt(Math.pow(dinhKeTiep[0] - dinhHienTai[0], 2)
	                    + Math.pow(dinhKeTiep[1] - dinhHienTai[1], 2));

	            chuVi += khoangCach;
	        }

	        return chuVi;
	    }

	    public double[] timDinhXaGocToaDoNhat() {
	        double[] dinhXaGoc = danhSachDinh.get(0);
	        double khoangCachXaNhat = Math.sqrt(Math.pow(dinhXaGoc[0], 2) + Math.pow(dinhXaGoc[1], 2));

	        for (int i = 1; i < danhSachDinh.size(); i++) {
	            double[] dinhHienTai = danhSachDinh.get(i);
	            double khoangCach = Math.sqrt(Math.pow(dinhHienTai[0], 2) + Math.pow(dinhHienTai[1], 2));

	            if (khoangCach > khoangCachXaNhat) {
	                dinhXaGoc = dinhHienTai;
	                khoangCachXaNhat = khoangCach;
	            }
	        }

	        return dinhXaGoc;
	    }
}
