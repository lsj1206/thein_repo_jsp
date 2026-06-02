package com.lsj;

public class Myobj {
	int x = 5;
	String name = "seojun";
	
	public void meNethod() {
		System.out.println("run method");
	}

	public void meNethod(int i) {
		System.out.println("run method");
		System.out.println(i);
	
		//ex2
		System.out.println("myobj"+i);
		
		
		//ex3
		String str1 ="myobj1_";
		System.out.println(str1+i);
		
		//exit
		
		String result="myobj_" + i;
		System.out.println(result);
		
		//ex4
//		String result = "myobj_" + i;
//		System.out.println(result);
//		//ex5
		
		String result2 =str1 +i;
		System.out.println(result2);
		
	}
	

}
