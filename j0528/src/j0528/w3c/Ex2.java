package j0528.w3c;

public class Ex2 {

	public static void main(String[] args) {
		boolean isRaining = true;
		boolean isbreaktime = true;
		
		if(!isRaining) 
			System.out.println("비안옴");
		else if (isRaining && isbreaktime)
			System.out.println("비오는 점심");
		else 
			System.out.println("비옴");
		System.out.println("==========");
		
		int time = 22;
		String message = (time < 12) ? "Good morning."
		               : (time < 18) ? "Good afternoon."
		               : "Good evening.";
		System.out.println(message);
		
		int day = 0;
		switch (day) {
		  case 1:
		    System.out.println("월");
		    break;
		  case 2:
		    System.out.println("화");
		    break;
		  case 3:
		    System.out.println("수");
		    break;
		  case 4:
		    System.out.println("목");
		    break;
		  case 5:
		    System.out.println("금");
		    break;
		  case 6:
		    System.out.println("토");
		    break;
		  case 7:
		    System.out.println("일");
		    break;
		}
	}
}
