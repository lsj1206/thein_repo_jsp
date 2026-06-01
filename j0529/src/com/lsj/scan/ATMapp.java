package com.lsj.scan;

import java.util.Scanner;

public class ATMapp {

	public static void main(String[] args) {
		int input = 0;
		int money = 0;
		
		System.out.println("=== Menu ===");
		System.out.print("[1] 입금 ");
		System.out.print("[2] 출금 ");
		System.out.println("[3] 잔액확인 ");

		System.out.print("메뉴를 선택해주세요: ");
		Scanner sc = new Scanner(System.in);
		input = sc.nextInt();
		
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
				System.out.println("유효한 번호만 입력해주세요.");
				break;
		}
		switch (input) {
		case 1:
			System.out.println("입금 기능을 점검중입니다.");
			break;
		case 2:
			System.out.println("출금 기능을 점검중입니다.");
			break;
		case 3:
			money = 313150;
			String money_str = String.format("%,d", money);
			System.out.println("고객님의 잔액은: " + money_str + "원 입니다.");
			break;
		default:
			//function
			break;
		}
	}
}
