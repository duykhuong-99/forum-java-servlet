package com.java.forum.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.forum.model.AccountModel;

public class AccountMapper implements RowMapper<AccountModel> {

	@Override
	public AccountModel mapRow(ResultSet rS) {
		try {
			AccountModel model = new AccountModel();
			model.setUserName(rS.getString("userName"));
			model.setUserPassword(rS.getString("userPassword"));
			model.setFullName(rS.getString("fullName"));
			model.setEmail(rS.getString("email"));
			model.setJoinDate(rS.getDate("joinDate"));
			model.setIsAdmin(rS.getInt("isAdmin"));
			model.setStatus(rS.getInt("status"));
			return model;
		} catch (SQLException e) {
		return null;
		}
	}

}
