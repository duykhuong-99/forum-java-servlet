package com.java.forum.dao;

import java.util.List;

import com.java.forum.model.AccountModel;

public interface IAccountDAO extends GenericDAO<AccountModel> {

	/**
	 * ĐĂNG NHẬP
	 * @param username, pass
	 * @return AccountModel
	 */
	AccountModel findAccount(String userName, String userPassword);

	/**
	 * ĐĂNG KÝ
	 * @param username, pass, name, email
	 * @return 0 -> thất bại|| 1 -> thành công
	 */
	int accountRegister(String userName, String userPassword, String fullName, String email);

	/**
	 * XEM THÔNG TIN TÀI KHOẢN
	 * @param username
	 * @return model
	 */
	AccountModel findAccountInfo(String userName);

	/**
	 * CẬP NHẬT ACCOUNT
	 * @param username, pass, name, email
	 * @return false -> thất bại|| true -> thành công
	 */
	boolean updateInfo(String userName, String userPassword, String fullName, String email);

	/**
	 * ALL ACCOUNT
	 * @return danh sách account
	 */
	List<AccountModel> finALlAccount();

	/**
	 * XÓA TÀI KHOẢN
	 * @param username
	 * @return 0 -> thất bại|| 1 -> thành công
	 */
	boolean deleteAccount(String userName);

	/**
	 * TRẠNG THÁI - 1- bình thường | 2 - mute | 3- ban
	 * 
	 * @return true/false
	 */
	boolean updateStatus(int status, String userName);
	
}
