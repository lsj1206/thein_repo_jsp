package com.lsj;

public class Ex3_cal {

	public static void main(String[] args) {
		
		MyCal mycal1 = new MyCal(1000, '+', 500);
		System.out.println(mycal1.getResult());
		
		MyCal mycal2 = new MyCal(1000, '-', 500);
		System.out.println(mycal2.getResult());
		
		MyCal mycal3 = new MyCal(1000, '*', 500);
		System.out.println(mycal3.getResult());
		
		MyCal mycal4 = new MyCal(1000 , '/', 500);
		System.out.println(mycal4.getResult());
		
		MyCal mycal5 = new MyCal(1000, '%', 500);
		System.out.println(mycal5.getResult());
		
		MyCal mycal6 = new MyCal(1000, '&', 500);
		System.out.println(mycal6.getResult());
	}
}
