package com.lsj;

public class Car {
	private String brand;
	private String model;
	private int model_year;
	
	public Car(String brand) {
		this.brand = brand;
	}
	
	public Car(String brand, String model, int year) {
		this.brand = brand;
		this.model = model;
		model_year = year;
	}

	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getModel_year() {
		return model_year;
	}
	public void setModel_year(int model_year) {
		this.model_year = model_year;
	}
	
	public void printInfo() {
		System.out.print(this.brand + " ");
		System.out.print(this.model + " ");
		System.out.println(this.model_year + "년식");
	}
}
