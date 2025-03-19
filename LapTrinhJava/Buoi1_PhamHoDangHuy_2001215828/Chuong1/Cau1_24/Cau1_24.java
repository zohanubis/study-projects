package c1.Cau1_24;

public class Cau1_24 {
    public static void main(String[] args) {
        // Tạo điểm A tọa độ (3,4)
        Diem2D A = new Diem2D(3, 4);
        System.out.print("Tọa độ điểm A: ");
        A.hienThi();

        // Tạo điểm B với giá trị nhập từ bàn phím
        Diem2D B = new Diem2D();
        System.out.println("Nhập tọa độ điểm B:");
        B.nhapDiem();
        System.out.print("Tọa độ điểm B: ");
        B.hienThi();

        // Tạo điểm C đối xứng với điểm B qua gốc tọa độ
        Diem2D C = new Diem2D(-B.giaTriX(), -B.giaTriY());
        System.out.print("Tọa độ điểm C (đối xứng với B qua gốc tọa độ): ");
        C.hienThi();

        // Hiển thị khoảng cách từ điểm B đến tâm O
        System.out.println("Khoảng cách từ điểm B đến tâm O: " + B.khoangCach());

        // Hiển thị khoảng cách từ điểm A đến điểm B
        System.out.println("Khoảng cách từ điểm A đến điểm B: " + A.khoangCach(B));
    }
}
