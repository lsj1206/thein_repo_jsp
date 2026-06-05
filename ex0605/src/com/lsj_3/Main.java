package com.lsj_3;

import java.util.ArrayList;

class Main {

	public static void main(String[] args) {
		
		ArrayList<String> cars;
		
		cars = new ArrayList<String>();
		System.out.println(cars);
		
		cars.add("Volvo");
	    cars.add("BMW");
	    cars.add("Ford");
	    cars.add("Mazda");
	    
	    System.out.println(cars);
	    
	    cars.add(0, "0번 추가");
	    System.out.println(cars);
	    
	    System.out.println(cars.get(0));
	    System.out.println("개수: [" + cars.size() + "] " + cars);
	    
	    System.out.println("set 리턴값 : " + cars.set(0, "GV90"));
	    System.out.println("개수: [" + cars.size() + "] " + cars);
	    
	    System.out.println("remove 리턴값 : " + cars.remove(4));
	    System.out.println("개수: [" + cars.size() + "] " + cars);
	    
	    cars.clear();
	    System.out.println("개수: [" + cars.size() + "] " + cars);
	    
	}

}
