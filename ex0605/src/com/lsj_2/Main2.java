package com.lsj_2;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

class Main2 {

	public static void main(String[] args) {
		
		LocalDate mylocalDate = LocalDate.now();
		System.out.println(mylocalDate);
		
		
		LocalTime mylocalTime= LocalTime.now();
		System.out.println(mylocalTime);
		
		LocalDateTime myDataTime = LocalDateTime.now();
		System.out.println(myDataTime);
		
		DateTimeFormatter myFormat = DateTimeFormatter.ofPattern("YY.MM.dd HH:mm:ss");
		
		String str = myDataTime.format(myFormat);
		System.out.println(str);
		
		int x = 10;
		int y = 0;
		
		int result = x / y;
		System.out.println(result);
	}

}
