package com.lsj.operators;

public class Ex2_oper1 {

	public static void main(String[] args) {
		// 연산자
		int x = 5;
		int y = 10;

		System.out.println(x + y);
		System.out.println(x - y);
		System.out.println(x * y);
		System.out.println(x / y);
		System.out.println(x % y);
		
		int i = 0;
		System.out.println("[i] : " + i);
		while (i < 3) {
			System.out.println("++i : " + ++i);
		}
		System.out.println("[i] : " + i);
		while (i > 0) {
			System.out.println("--i : " + --i);
		}
		System.out.println("[i] : " + i);
		while (i < 3) {
			System.out.println("i++ : " + i++);
		}
		System.out.println("[i] : " + i);
		while (i > 0) {
			System.out.println("i-- : " + i--);
		}
		System.out.println("[i] : " + i);
	}

}
