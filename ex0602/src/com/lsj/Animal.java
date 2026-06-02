package com.lsj;

public class Animal {
	protected String type;
	protected String color;
	
	public void animalSound() {
		System.out.println("동물 소리");
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	
	public void printAnimal() {
		if (this.color != null)
			System.out.println(this.color + this.type);
		else
			System.out.println(this.type);
	}
}
