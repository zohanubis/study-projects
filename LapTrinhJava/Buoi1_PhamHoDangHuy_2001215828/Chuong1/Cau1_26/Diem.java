package c1.Cau1_26;

public class Diem {
    private double x;
    private double y;

    public Diem() {
        this.x = 0.0;
        this.y = 0.0;
    }

    public Diem(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Diem(Diem diem) {
        this.x = diem.x;
        this.y = diem.y;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }
}
