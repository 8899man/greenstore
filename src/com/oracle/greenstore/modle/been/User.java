package com.oracle.greenstore.modle.been;

public class User {
	private int user_id;
	private String user_name;
	private String password;
	private String address;
	private int phone;
	private int age;
	private String touxiang;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getTouxiang() {
		return touxiang;
	}
	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
	}
	public User() {
		super();
	}
	
	public User(int user_id, String user_name, String password, String address, int phone, int age, String touxiang) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.age = age;
		this.touxiang = touxiang;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", address="
				+ address + ", phone=" + phone + ", age=" + age + ", touxiang=" + touxiang + "]";
	}
	
	
	
}
