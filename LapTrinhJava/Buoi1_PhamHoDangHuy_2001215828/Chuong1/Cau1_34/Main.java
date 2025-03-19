import java.io.File;
import java.util.Scanner;

public class Main {
	private static Scanner sc;

	public static void main(String[] args) {
		sc = new Scanner(System.in);
		danhsachDanhBa dsdb = new danhsachDanhBa();
		int luachon = 0;
		do {
			System.out.println("----------MENU-----------");
			System.out.println("Chọn chức năng: ");
			System.out.println(
					  "1. Thêm danh bạ mới.\n"
					+ "2. In danh sách danh bạ.\n"
					+ "3. Lưu danh sách danh bạ vào filetext.\n"
					+ "4. Đọc danh sách danh bạ từ file text."
					+ "0. Thoát chương trình");
			luachon = sc.nextInt();
			sc.nextLine();
			if (luachon==1) {
				System.out.println("Nhập tên: "); String name = sc.nextLine();
				System.out.println("Nhập SĐT: "); String phoneNumber = sc.nextLine();
				DanhBa db = new DanhBa(name, phoneNumber);
				dsdb.themDanhBa(db);
			}else if(luachon==2) {
				dsdb.inDSDanhBa();
			}else if(luachon==3) {
				System.out.println("Nhập tên file: ");
				String tenFile = sc.nextLine();
				File f = new File(tenFile);
				dsdb.ghiDLXuongFile(f);
			}else if(luachon==4) {
				System.out.println("Nhập tên file: ");
				String tenFile = sc.nextLine();
				File f = new File(tenFile);
				dsdb.docDLFile(f);
			}
		}while(luachon!=0);
	}
}
