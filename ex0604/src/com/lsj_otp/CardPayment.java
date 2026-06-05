package com.lsj_otp;

class CardPayment extends Payment {
	@Override
	void pay(int amount) {
		System.out.println("카드 결제: " + amount);
	}
}