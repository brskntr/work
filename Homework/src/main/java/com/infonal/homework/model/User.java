package com.infonal.homework.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="users")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1438367496019605794L;
	
	@Id
	private String id;
	private String username;
	private String firstName;
	private String lastName;
	private String phone;

	public User() {
		
	}
	
	public User(String username,String firstName,String lastName,String phone){
		this.username  = username;
		this.firstName = firstName;
		this.lastName  = lastName;
		this.phone     = phone;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
