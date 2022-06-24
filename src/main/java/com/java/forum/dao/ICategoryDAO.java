package com.java.forum.dao;

import java.util.List;

import com.java.forum.model.CategoryModel;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
	
	/**  
	*  LẤY DANH SÁCH THỂ LOẠI
	*  @return list
	*/
	List<CategoryModel> findAllCategory();
}
