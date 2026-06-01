package com.lsj;

public class Ex4_Car {

	public static void main(String[] args) {
		
		Car hyundai = new Car("현대");
		
		Car ford = new Car("포드", "머스탱", 2015);
		
		//차의 브랜드를 출력하세요.
		System.out.println(hyundai.getBrand());
		
		ford.printInfo();
	}
}
