package com.lsj;

public class MyClass {

	public static void main(String[] args) {
		
		Car1 car1 = new Car1("Corvette");
		
		Car1 car2 = new Car1(1969, "Mustang");
		
		car1.printInfo();
		car2.printInfo();
		
		Person user = new Person();
		user.setName("이름");
		String userName = user.getName();
		System.out.println(userName);
	}
}
