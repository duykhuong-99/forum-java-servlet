package com.java.forum.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.java.forum.dao.ICategoryDAO;
import com.java.forum.model.CategoryModel;
import com.java.forum.service.ICategorySetvice;

public class CategoryService implements ICategorySetvice {
	
	@Inject
	private ICategoryDAO iCategoryDAO;
	
	@Override
	public List<CategoryModel> findAllCategory() {
		return iCategoryDAO.findAllCategory();
	}

}
