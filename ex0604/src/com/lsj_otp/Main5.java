package com.lsj_otp;

import java.util.Random;
import java.util.Scanner;

class Main5 {

	public static void main(String[] args) {
		
		Payment p1 = new CardPayment();
		Payment p2 = new TossPay();

		p1.pay(10000);
		p2.pay(20000);
		
		Random random = new Random();
		Scanner sc = new Scanner(System.in);

		// 6자리 OTP(인증번호) 를 생성하는 대표적인 코드
		// random.nextInt(900000) : 0 ~ 899999 사이의 정수를 생성
		int otp = 100000 + random.nextInt(900000);

		System.out.println("생성 OTP: " + otp);

		int failCount = 0;

		while (true) {

			System.out.print("OTP 입력: ");
			int input = sc.nextInt();

			if (input == otp) {
				System.out.println("인증 성공");
				break;
			} else {
				failCount++;
				System.out.println("인증 실패");

				if (failCount >= 3) {
					System.out.println("계정 잠금");
					break;
				}
			}
		}
	}

}