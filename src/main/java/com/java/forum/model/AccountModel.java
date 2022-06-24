package com.java.forum.model;

import java.util.Date;

public class AccountModel {
	
	private String userName;
	private String userPassword;
	private String fullName;
	private String email;
	private Date joinDate;
	private int isAdmin;  
	private int status;
	

	
	/**
	 * 1: normal - 2:muted - 3: blocked
	 */
	public int getStatus() {
		return status;
	}

	
	/**
	 * 1: normal - 2:muted - 3: blocked
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	/**
	 * 0: admin - 1:user
	 */
	public int getIsAdmin() {
		return isAdmin;
	}

	/**
	 * 0: admin - 1:user
	 */
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	

}
