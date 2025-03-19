package c1.Cau1_27;

public class Cau1_27 {

	public static void main(String[] args) {
		DaGiac daGiac = new DaGiac();

        // Nhập đa giác từ bàn phím
        daGiac.nhap();

        // Xuất thông tin đa giác
        System.out.println("Thông tin đa giác vừa nhập:");
        daGiac.xuat();

        // Tính và in chu vi đa giác
        double chuVi = daGiac.tinhChuVi();
        System.out.println("Chu vi của đa giác: " + chuVi);

        // Tìm và in đỉnh xa Gốc Tọa Độ nhất
        double[] dinhXaGoc = daGiac.timDinhXaGocToaDoNhat();
        System.out.println("Đỉnh xa Gốc Tọa Độ nhất: (" + dinhXaGoc[0] + ", " + dinhXaGoc[1] + ")");

	}

}
