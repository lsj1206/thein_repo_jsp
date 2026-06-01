package com.lsj.datatype;

public class Ex1_datatype {

	public static void main(String[] args) {
		
		boolean myBool = true;
		int myIntNum = 5;
		float myFloatNum = 5.99f; // 32bit
		double myDouble = 20.000; // 64bit
		char myLetter = 'D';
		String myText = "hello";
		
		System.out.println("Auto Typecasting:\n byte->short->char->int->long->float->double");
		System.out.println("Manaul Typecasting:\n double->float->long->int->char->short->byte");
		
		// int -> double
		double resultDouble = myIntNum;
		System.out.println("int->double: " + resultDouble);
		
		// double -> int
		int resultInt = (int) myDouble;
		System.out.println("double->int: " + resultInt);
	}

}
