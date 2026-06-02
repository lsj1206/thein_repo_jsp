package com.lsj;

public class Ex2_Inheritance {

	public static void main(String[] args) {
		
	    Car myCar = new Car();
	    
	    System.out.println(myCar.brand + " " + myCar.getModelName());
	    myCar.honk();
	    
	    Pig pig = new Pig();
	    Dog dog = new Dog();
	    
	    pig.animalSound();
	    dog.animalSound();
	    
	    // -----------------
	    
	    Animal cat = new Cat();
	    cat.animalSound();
	    
	    cat.printAnimal();
	    
	    cat.setColor("치즈");
	    cat.printAnimal();
	}
}
