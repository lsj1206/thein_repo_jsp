package com.lsj_array;

import java.util.ArrayList;

public class ArrayMain2 {

	public static void main(String[] args) {
		
		ArrayList<Student> students = new ArrayList<Student>();
		
		students.add(new Student("홍길동", 90));
		students.add(new Student("김철수", 80));
		students.add(new Student("이영희", 95));
		
		for (Student s : students) {
			System.out.println(s.getName() + " : " + s.getScore());
		}
	}
}
