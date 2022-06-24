package com.java.forum.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.java.forum.dao.IAccountDAO;
import com.java.forum.model.AccountModel;
import com.java.forum.service.IAccountService;

public class AccountService implements IAccountService{
	
	@Inject
	private IAccountDAO accountDAO;

	@Override
	public AccountModel findAccount(String userName, String userPassword) {
		return accountDAO.findAccount(userName, userPassword);
	}
 
	@Override
	public int accountRegister(String userName, String userPassword, String fullName, String email) {
		return accountDAO.accountRegister(userName, userPassword, fullName, email);
	}

	@Override
	public AccountModel findAccountInfo(String userName) {
		return accountDAO.findAccountInfo(userName);
	}
	
	@Override
	public boolean updateInfo(String userName, String userPassword, String fullName, String email) {
		return accountDAO.updateInfo(userName, userPassword, fullName, email);
	}
	
	@Override
	public List<AccountModel> finALlAccount() {
		return accountDAO.finALlAccount();
	}
	
	@Override
	public boolean deleteAccount(String userName) {
		return accountDAO.deleteAccount(userName);
	}

	@Override
	public boolean updateStatus(int status, String userName) {
		return accountDAO.updateStatus(status, userName);
	}

}
