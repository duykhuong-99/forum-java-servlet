package com.java.forum.mapper;

import java.sql.ResultSet;

public interface RowMapper<T> {

	T mapRow(ResultSet rS);
}
