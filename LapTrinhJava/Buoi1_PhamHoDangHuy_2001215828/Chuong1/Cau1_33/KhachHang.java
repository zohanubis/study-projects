package c1.Cau1_33;

import java.io.Serializable;

//Class để biểu diễn thông tin một khách hàng
public class KhachHang implements Serializable {
 private static final long serialVersionUID = 1L;
 private String maSo;
 private String hoTen;
 private int namSinh;

 public KhachHang(String maSo, String hoTen, int namSinh) {
     this.maSo = maSo;
     this.hoTen = hoTen;
     this.namSinh = namSinh;
 }

 @Override
 public String toString() {
     return "Mã số: " + maSo + ", Họ tên: " + hoTen + ", Năm sinh: " + namSinh;
 }
}
