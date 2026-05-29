package com.lsj.scan;

import java.util.Scanner;

public class ScannerEx {

	public static void main(String[] args) {
		
		System.out.println("=== 두 숫자의 합 구하기===");
		// import 단축키: ctrl + shift + o
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Num1: ");
		int num1 = sc.nextInt();
		System.out.print("Num2: ");	
		int num2 = sc.nextInt();
		
		int result = num1 + num2;
		System.out.println("=== Sum: " + result + " ===");
	}
}
