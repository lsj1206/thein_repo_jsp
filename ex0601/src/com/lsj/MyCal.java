package com.lsj;

public class MyCal {
	@SuppressWarnings("unused")
	private int num1;
	@SuppressWarnings("unused")
	private int num2;
	@SuppressWarnings("unused")
	private char operator;
	private int result;
	
	public MyCal(int n, char f, int m) {
		num1 = n;
		num2 = m;
		operator = f;
		
		switch (f) {
			case '+':
				result = n + m;
				break;
			case '-':
				result = n - m;
				break;
			case '*':
				result = n * m;
				break;
			case '/':
				result = n / m;
				break;
			case '%':
				result = n % m;
				break;
			default:
				System.out.println("처리가능한 입력값이 아닙니다.");
				break;
		}
	}
	public int getResult() {
		return result;
	}
}
