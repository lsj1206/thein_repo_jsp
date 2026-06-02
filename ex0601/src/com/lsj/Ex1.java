package com.lsj;

public class Ex1 {

	public static void main(String[] args) {
		Myobj myobj_1 = new Myobj();
		Myobj myobj_2 = new Myobj();
		Myobj myobj_3 = new Myobj();

		String str = "asdf";
		int num = 5;

		System.out.println(myobj_1.x);
		System.out.println(myobj_2.x);
		System.out.println(myobj_3.x);

		myobj_3.x = 10;
		myobj_3.name = "lsj";

		System.out.println(myobj_3.x);
		System.out.println(myobj_3.name);
		System.out.println(myobj_2.x);
		System.out.println(myobj_2.x);

		myobj_1.meNethod();
		myobj_2.meNethod();
		myobj_3.meNethod();
		
		myobj_1.meNethod(1);
		myobj_2.meNethod(2);
		myobj_3.meNethod(3);
		

		

	}

}
