package com.java.forum.dao.impl;

import java.util.List;

import com.java.forum.dao.ICategoryDAO;
import com.java.forum.mapper.CategoryMapper;
import com.java.forum.model.CategoryModel;

/**
 * THỰC THI CÁC LỆNH SQL
 */
public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAllCategory() {
		String qr = "SELECT * FROM category";
		return find(qr, new CategoryMapper());
	}


}
