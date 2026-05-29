package com.lsj.scan;

import java.util.Scanner;

public class ATMapp {

	public static void main(String[] args) {
		
		System.out.println("=== Menu ===");
		System.out.print("[1] 입금 ");
		System.out.print("[2] 출금 ");
		System.out.println("[3] 잔액확인 ");

		System.out.print("메뉴를 선택해주세요 : ");
		Scanner sc = new Scanner(System.in);
		int input = sc.nextInt();
		
		switch (input) {
			case 1:
				System.out.println("입금을 선택하셨습니다.");
				break;
			case 2:
				System.out.println("출금을 선택하셨습니다.");
				break;
			case 3:
				System.out.println("잔액확인을 선택하셨습니다.");
				break;
			default:
				System.out.println("유효한 숫자만 입력해주세요.");
				break;
		}
		switch (input) {
		case 1:
			//function
			break;
		case 2:
			//function
			break;
		case 3:
			//function
			break;
		default:
			//function
			break;
		}
	}
}
