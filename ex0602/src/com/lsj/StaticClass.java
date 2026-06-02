package com.lsj;

public class StaticClass {
	
	private static String staticStrVal = "Hello";
	
	static int staticIntVal = 100;

	public static String getStaticStrVal() {
		return staticStrVal;
	}

	public static void setStaticStrVal(String staticStrVal) {
		StaticClass.staticStrVal = staticStrVal;
	}
	
}
