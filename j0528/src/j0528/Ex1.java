package j0528;

public class Ex1 {

	public static void main(String[] args) {
//		공용계산기
//		변수 정의
		int money = 0;
		double interestRate = 0;
		
		money = 100000;
		interestRate = 0.05;
		
		double result = money + (money + interestRate);
		System.out.println(result);
	}

}
