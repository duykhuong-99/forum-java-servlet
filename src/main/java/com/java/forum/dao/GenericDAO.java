package com.java.forum.dao;

import java.util.List;

import com.java.forum.mapper.RowMapper;

public interface GenericDAO<T> {
	
	/**
	 *  SELECT 
	 * @param <T> : Model
	 * @param query ,rowMapper,parameters
	 * @return list
	 */
	<T> List<T> find(String query, RowMapper<T> rowMapper, Object... parameters);
	
	/**
	 *  INSERT
	 * @param query
	 * @param parameters
	 * @return 0 -> thất bại|| 1 -> thành công
	 */
	int insert (String query, Object... parameters);
	
	/**
	 *  DÙNG CHO UPDATE + DELETE
	 * @param query
	 * @param parameters
	 * @return false -> thất bại|| true -> thành công
	 */
	boolean update(String query, Object... parameters);
	
	boolean delete(String query, Object... parameters);
}
