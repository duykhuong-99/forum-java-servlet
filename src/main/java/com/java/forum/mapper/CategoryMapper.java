package com.java.forum.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.forum.model.CategoryModel;

public class CategoryMapper implements RowMapper<CategoryModel>{

	@Override
	public CategoryModel mapRow(ResultSet rS) {
		try {
			CategoryModel model = new CategoryModel();
			model.setCateId(rS.getInt("cateId"));
			model.setCateName(rS.getString("cateName"));
			model.setNote(rS.getString("note"));
			return model;
		} catch (SQLException e) {
		return null;
		}
	}

}
