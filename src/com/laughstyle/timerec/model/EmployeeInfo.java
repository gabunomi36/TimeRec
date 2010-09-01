package com.laughstyle.timerec.model;

public class EmployeeInfo {
	private String firstName = "";
	private String lastName = "";
	private String imageUrl = "";
	private String profile = "";
	private String status = "";
	
	public EmployeeInfo()
	{
		
	}
	
	public EmployeeInfo(String firstName,String lastName, String imageUrl, String profile, String status)
	{
		this.firstName = firstName;
		this.lastName = lastName;
		this.imageUrl = imageUrl;
		this.profile = profile;
		this.status = status;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getProfile() {
		return profile;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
}
