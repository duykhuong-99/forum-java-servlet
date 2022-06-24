package com.java.forum.service;

import java.util.List;

import com.java.forum.model.CategoryModel;

public interface ICategorySetvice {

	/**  
	* LẤY DANH SÁCH THỂ LOẠI ---> return LIST
	*/ 
	List<CategoryModel> findAllCategory();
}
