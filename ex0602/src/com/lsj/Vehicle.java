package com.lsj;

public class Vehicle {
	protected String brand = "Ford";
	
	public void honk() {                    // Vehicle method
	    System.out.println("Tuut, tuut!");
	  }
}

class Car extends Vehicle {
	private String modelName = "Mustang";

	public String getModelName() {
		return modelName;
	}
	

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	
	
}