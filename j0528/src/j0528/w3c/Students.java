package j0528.w3c;

public class Students {
	private String st_name;
	private int st_age;
	private boolean st_is_male;

	public String getName() {
		return st_name;
	}
	
	public void setName (String name) {
		st_name = name;
	}
	
	public void setData(int age, boolean is_male) {
		st_age = age;
		st_is_male = is_male;
	}
	
	public void callName() {
		System.out.println("Name: " + st_name);
	}
	
	public void callData() {
		System.out.println("Name: " + st_name);
		System.out.println("Age: " + st_age);
		if (st_is_male) {
			System.out.println("Gender: Male");
		}
		else {
			System.out.println("Gender: FeMale");
		}
		
	}
}
