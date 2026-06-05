package com.lsj_otp;

class TossPay extends Payment {
	@Override
	void pay(int amount) {
		System.out.println("토스페이 결제: " + amount);
	}
}