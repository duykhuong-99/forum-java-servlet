package com.java.forum.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import com.java.forum.dao.GenericDAO;
import com.java.forum.mapper.RowMapper;


/**  
* CÁC LỆNH DÙNG CHUNG TRONG DAO.IMPL 
* KẾT NỐI DB / INSERT /UPDATE /DELETE
*/
public class AbstractDAO<T> implements GenericDAO<T> {

	ResourceBundle bundel = ResourceBundle.getBundle("database");
	public Connection getConnection() {
		try {
			Class.forName(bundel.getString("driverName"));
			String url = bundel.getString("url");
			String username =  bundel.getString("username");
			String pass = bundel.getString("pass");
			try {
				return DriverManager.getConnection(url, username, pass);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return null;
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public <T> List<T> find(String query, RowMapper<T> rowMapper, Object... parameters) {
		List<T> list = new ArrayList<>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(query);
			setParameter(statement, parameters);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				list.add(rowMapper.mapRow(resultSet));
			}
			return list;
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				return null;
			}
		}
	}

	// chuyển đổi tham số truyền vào 
	private void setParameter(PreparedStatement statement, Object... parameters) {
		try {
			for (int i = 0; i < parameters.length; i++) {
				Object parameter = parameters[i];
				int index = i + 1;
				if (parameter instanceof Long) {
					statement.setLong(index, (Long) parameter);
				} else if (parameter instanceof String) {
					statement.setString(index, (String) parameter);
				} else if (parameter instanceof Integer) {
					statement.setInt(index, (Integer) parameter);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(String query, Object... parameters) {
		Connection connection = null;
		PreparedStatement statement = null;
		int result;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(query);
			setParameter(statement, parameters);
			result = statement.executeUpdate();
			connection.commit(); // success - lưu vào db
			return result;
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback(); // fail -- rollback
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			return 0;
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				return 0;
			}
		}
	}

	@Override
	public boolean update(String query, Object... parameters) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(query);
			setParameter(statement, parameters);
			statement.executeUpdate();
			connection.commit();
			return true;
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback(); // fail -- rollback
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			return false;
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				return false;
			}
		}

	}

	/**
	 * DELETE
	 */
	@Override
	public boolean delete(String query, Object... parameters) {
		// delete
		return false;
	}
}
