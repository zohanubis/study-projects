import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int luachon = 0;
		do {
			System.out.println("----------MENU-----------");
			System.out.println("Chọn chức năng: ");
			System.out.println(
					  "1. Câu 29.\n"
					+ "2. Câu 30.\n"
					+ "3. Câu 31.\n"
					+ "4. Câu 32.\n"
					+ "0. Thoát chương trình.");
			luachon = sc.nextInt();
			sc.nextLine();
			if (luachon==1) {
				ArrayList<NhanVien> danhSachNhanVien = new ArrayList<>();
				
				try {
		            File file = new File("nhanvien.txt");
		            Scanner scanner = new Scanner(file);
		            while (scanner.hasNextLine()) {
		                String[] data = scanner.nextLine().split(",");
		                String hoTen = data[0];
		                int namVaoLam = Integer.parseInt(data[1]);
		                String loaiNhanVien = data[2];
		                switch (loaiNhanVien) {
		                    case "VanPhong":
		                        int soNgayLV = Integer.parseInt(data[3]);
		                        double troCap = Double.parseDouble(data[4]);
		                        danhSachNhanVien.add(new NhanVienVanPhong(hoTen, namVaoLam, soNgayLV, troCap));
		                        break;
		                    case "SanXuat":
		                        int soSanPham = Integer.parseInt(data[3]);
		                        danhSachNhanVien.add(new NhanVienSanXuat(hoTen, namVaoLam, soSanPham));
		                        break;
		                    case "QuanLy":
		                        double heSoChucVu = Double.parseDouble(data[3]);
		                        double thuong = Double.parseDouble(data[4]);
		                        danhSachNhanVien.add(new NhanVienQuanLy(hoTen, namVaoLam, heSoChucVu, thuong));
		                        break;
		                    default:
		                        System.out.println("Loại nhân viên không hợp lệ.");
		                }
		            }
		            scanner.close();
		        } catch (IOException e) {
		            System.out.println("Đã xảy ra lỗi khi đọc file.");
		            e.printStackTrace();
		        }

		        double tongLuongCongTy = 0;
		        double tongLuongVanPhong = 0;
		        double tongLuongSanXuat = 0;
		        double tongLuongQuanLy = 0;

		        for (NhanVien nhanVien : danhSachNhanVien) {
		            tongLuongCongTy += nhanVien.tinhLuong();
		            if (nhanVien instanceof NhanVienVanPhong) {
		                tongLuongVanPhong += nhanVien.tinhLuong();
		            } else if (nhanVien instanceof NhanVienSanXuat) {
		                tongLuongSanXuat += nhanVien.tinhLuong();
		            } else if (nhanVien instanceof NhanVienQuanLy) {
		                tongLuongQuanLy += nhanVien.tinhLuong();
		            }
		        }

		        try {
		            FileWriter writer = new FileWriter("tongluong.txt");
		            writer.write("Tổng lương công ty: " + tongLuongCongTy + "\n");
		            writer.write("Tổng lương nhân viên văn phòng: " + tongLuongVanPhong + "\n");
		            writer.write("Tổng lương nhân viên sản xuất: " + tongLuongSanXuat + "\n");
		            writer.write("Tổng lương nhân viên quản lý: " + tongLuongQuanLy + "\n");
		            writer.close();
		            System.out.println("Kết quả đã được lưu vào file tongluong.txt.");
		        } catch (IOException e) {
		            System.out.println("Đã xảy ra lỗi khi ghi vào file.");
		            e.printStackTrace();
		        }
		    }
			else if(luachon==2) {
				ArrayList<MonHoc> danhSachMonHoc = new ArrayList<>();
				
				try {
		            File file = new File("monhoc.txt");
		            Scanner scanner = new Scanner(file);
		            while (scanner.hasNextLine()) {
		                String[] data = scanner.nextLine().split(",");
		                String maMonHoc = data[0];
		                String tenMonHoc = data[1];
		                int soTinChi = Integer.parseInt(data[2]);
		                String loaiMonHoc = data[3];
		                switch (loaiMonHoc) {
		                    case "LyThuyet":
		                        double diemTieuLuan = Double.parseDouble(data[4]);
		                        double diemGiuaKy = Double.parseDouble(data[5]);
		                        double diemCuoiKy = Double.parseDouble(data[6]);
		                        danhSachMonHoc.add(new MonLyThuyet(maMonHoc, tenMonHoc, soTinChi, diemTieuLuan, diemGiuaKy, diemCuoiKy));
		                        break;
		                    case "ThucHanh":
		                        ArrayList<Double> diemKiemTra = new ArrayList<>();
		                        for (int i = 4; i < data.length; i++) {
		                            diemKiemTra.add(Double.parseDouble(data[i]));
		                        }
		                        danhSachMonHoc.add(new MonThucHanh(maMonHoc, tenMonHoc, soTinChi, diemKiemTra));
		                        break;
		                    case "DoAn":
		                        double diemGVHD = Double.parseDouble(data[4]);
		                        double diemGVPB = Double.parseDouble(data[5]);
		                        danhSachMonHoc.add(new MonDoAn(maMonHoc, tenMonHoc, soTinChi, diemGVHD, diemGVPB));
		                        break;
		                    default:
		                        System.out.println("Loại môn học không hợp lệ.");
		                }
		            }
		            scanner.close();
		        } catch (IOException e) {
		            System.out.println("Đã xảy ra lỗi khi đọc file.");
		            e.printStackTrace();
		        }

		        StringBuilder result = new StringBuilder();
		        for (MonHoc monHoc : danhSachMonHoc) {
		            double diemTrungBinh = monHoc.tinhDiemTrungBinh();
		            result.append("Mã môn học: ").append(monHoc.maMonHoc).append(", Tên môn học: ").append(monHoc.tenMonHoc)
		                    .append(", Điểm trung bình: ").append(diemTrungBinh).append("\n");
		        }

		        try {
		            FileWriter writer = new FileWriter("ketqua.txt");
		            writer.write(result.toString());
		            writer.close();
		            System.out.println("Kết quả đã được lưu vào file ketqua.txt.");
		        } catch (IOException e) {
		            System.out.println("Đã xảy ra lỗi khi ghi vào file.");
		            e.printStackTrace();
		        }
			}
	        else if(luachon==3) {
	        	ArrayList<BatDongSan> danhSachBatDongSan = new ArrayList<>();

	            try {
	                File file = new File("batdongsan.txt");
	                Scanner scanner = new Scanner(file);
	                while (scanner.hasNextLine()) {
	                    String[] data = scanner.nextLine().split(",");
	                    String loaiBatDongSan = data[0];
	                    String maSo = data[1];
	                    double chieuDai = Double.parseDouble(data[2]);
	                    double chieuRong = Double.parseDouble(data[3]);
	                    switch (loaiBatDongSan) {
	                        case "DatTrong":
	                            danhSachBatDongSan.add(new DatTrong(maSo, chieuDai, chieuRong));
	                            break;
	                        case "NhaO":
	                            int soLau = Integer.parseInt(data[4]);
	                            danhSachBatDongSan.add(new NhaO(maSo, chieuDai, chieuRong, soLau));
	                            break;
	                        case "BietThu":
	                            danhSachBatDongSan.add(new BietThu(maSo, chieuDai, chieuRong));
	                            break;
	                        case "KhachSan":
	                            int soSao = Integer.parseInt(data[4]);
	                            danhSachBatDongSan.add(new KhachSan(maSo, chieuDai, chieuRong, soSao));
	                            break;
	                        default:
	                            System.out.println("Loại bất động sản không hợp lệ.");
	                    }
	                }
	                scanner.close();
	            } catch (IOException e) {
	                System.out.println("Đã xảy ra lỗi khi đọc file.");
	                e.printStackTrace();
	            }

	            double tongGiaBan = 0;
	            for (BatDongSan batDongSan : danhSachBatDongSan) {
	                tongGiaBan += batDongSan.tinhGiaBan();
	            }


	            try {
	                FileWriter writer = new FileWriter("giaban.txt");
	                writer.write("Tổng giá bán của tất cả bất động sản: " + tongGiaBan + "\n");
	                writer.close();
	                System.out.println("Kết quả đã được lưu vào file giaban.txt.");
	            } catch (IOException e) {
	                System.out.println("Đã xảy ra lỗi khi ghi vào file.");
	                e.printStackTrace();
	            }
	        }else if (luachon==4) {
	        	
	        }
		}while (luachon!=0);
	}
}
