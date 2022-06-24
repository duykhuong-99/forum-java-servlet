package com.java.forum.dao.impl;

import java.util.List;

import com.java.forum.dao.IAccountDAO;
import com.java.forum.mapper.AccountMapper;
import com.java.forum.model.AccountModel;

/**
 * THỰC THI CÁC LỆNH SQL
 */
public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

	@Override
	public AccountModel findAccount(String userName, String userPassword) {
		String query = "SELECT * FROM account WHERE userName = ? AND userPassword = ?";
		List<AccountModel> account = find(query, new AccountMapper(), userName, userPassword);
		return account.isEmpty() ? null : account.get(0);
	}

	@Override
	public int accountRegister(String userName, String userPassword, String fullName, String email) {
		String query = "INSERT INTO account (userName, userPassword, fullName, email, joinDate, isAdmin, status) "
				+ "VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, 1, 1)";
		return insert(query, userName, userPassword, fullName, email);
	}

	@Override
	public AccountModel findAccountInfo(String userName) {
		String query = " SELECT * FROM account WHERE userName = ?";
		List<AccountModel> account = find(query, new AccountMapper(), userName);
		return account.isEmpty() ? null : account.get(0);
	}

	@Override
	public boolean updateInfo(String userName, String userPassword, String fullName, String email) {
		String query ="UPDATE account SET userPassword = ?, fullName = ?, email= ? WHERE userName = ?";
		return update(query, userPassword, fullName, email, userName);
	}

	@Override
	public List<AccountModel> finALlAccount() {
		String query =  "SELECT * FROM account";
		return find(query, new AccountMapper());
	}

	@Override
	public boolean deleteAccount(String userName) {
		String query = "DELETE FROM account WHERE userName = ?";
		return update(query, userName);
	}

	@Override
	public boolean updateStatus(int status, String userName) {
		String query="UPDATE account SET status = ?  WHERE userName =? "; 
		return update(query, status, userName);
	}


}
