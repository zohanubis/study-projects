import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

public class danhsachDanhBa {
	private ArrayList<DanhBa> danhSach;
	public danhsachDanhBa() {
		this.danhSach = new ArrayList<DanhBa>();
	}
	public danhsachDanhBa(ArrayList<DanhBa> danhSach) {
		this.danhSach = danhSach;	
	}
	public void themDanhBa(DanhBa db) {
		this.danhSach.add(db);
	}
	public void inDSDanhBa() {
		for(DanhBa db : danhSach) {
			System.out.println(db);
		}
	}
	public void ghiDLXuongFile(File file) {
		try {
			FileOutputStream os = new FileOutputStream(file);
			ObjectOutputStream oos = new ObjectOutputStream(os);
			
			for(DanhBa db : danhSach) {
				oos.writeObject(db);
			}
			
			oos.flush();
			oos.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void docDLFile(File f) {
		try {
			FileInputStream is = new FileInputStream(f);
			ObjectInputStream ois = new ObjectInputStream(is);
			DanhBa db = null;
			while(true) {
				Object oj = ois.readObject();
				if(oj == null ) {
					break;
				}
				if(oj!=null) {
					db = (DanhBa) oj;
					this.danhSach.add(db);
				}
			}
			ois.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
