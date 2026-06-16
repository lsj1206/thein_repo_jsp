package com.dao;

public class Person implements java.io.Serializable {
	private int id = 20260616;
	private String name = "홍길동";

	public Person() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
