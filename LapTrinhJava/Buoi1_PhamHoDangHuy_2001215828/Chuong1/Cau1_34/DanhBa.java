import java.io.Serializable;

public class DanhBa implements Comparable<DanhBa>, Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
    private String phoneNumber;

    public DanhBa(String name, String phoneNumber) {
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    @Override
    public String toString() {
    	return "Tên : "+ name +", SĐT: "+ phoneNumber +"";
    }

	@Override
	public int compareTo(DanhBa o) {
		// TODO Auto-generated method stub
		return 0;
	}
}
