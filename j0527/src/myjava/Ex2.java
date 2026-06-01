package myjava;

public class Ex2 {

	public static void main(String[] args) {
		int myInt = 9;
		double myDouble = myInt; // Automatic casting: int to double

		System.out.println(myInt);    // Outputs 9
		System.out.println(myDouble); // Outputs 9.0
		
		myDouble = 9.78d;
		myInt = (int) myDouble; // Manual casting: double to int

		System.out.println(myDouble); // Outputs 9.78
		System.out.println(myInt);    // Outputs 9
		
		int sum1 = 100 + 50;        // 150 (100 + 50)
		int sum2 = sum1 + 250;      // 400 (150 + 250)
		int sum3 = sum2 + sum2;  
		System.out.println(sum1);
		System.out.println(sum2);
		System.out.println(sum3);
		
		int x = 10;
		int y = 3;

		System.out.println(x + y); // 13
		System.out.println(x - y); // 7
		System.out.println(x * y); // 30
		System.out.println(x / y); // 3
		System.out.println(x % y); // 1

		int z = 5;
		++z;
		System.out.println(z); // 6
		--z;
		System.out.println(z); // 5
		
		boolean isLoggeln = true;
		boolean isAdmin = false;
		
		
		System.out.println("일반 사용자 " + (isLoggeln && !isAdmin));
		System.out.println("사이트 접근 " + (isLoggeln || isAdmin));
		System.out.println("사이트 접근 " + (!isAdmin));
		
		String txt = "Please locate where 'locate' occurs!";
		System.out.println(txt.indexOf("locate")); // Outputs 7
		
		String txt1 = "Hello";
		String txt2 = "Hello";

		String txt3 = "Greetings";
		String txt4 = "Great things";

		System.out.println(txt1.equals(txt2));  // true
		System.out.println(txt3.equals(txt4));  // false
		
		String txt5 = "We are the so-called \"Vikings\" from the north.";
		System.out.println(txt5);
		
		
			
	}

}
