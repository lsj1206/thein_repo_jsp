package j0528.w3c;

public class Ex3 {

	public static void main(String[] args) {
		int i = -1;
		
		do {
			System.out.println(i);
			if (i++ == 3)
				break;
		}
		while(i >= 0);
		System.out.println("[" + i + "]");
		
		for (int j = 0; j < 5; j++) {
			  System.out.println(j);
			};

		String[] cars = {"Volvo", "BMW", "Ford", "Mazda"};

		for (String car : cars) {
		  System.out.println(car);
		};
	}
}
