package com.java.forum.model;

import java.util.List;

public class CategoryModel {


	private int cateId ;
	private String cateName;
	private String note;
	
	private List<CategoryModel> listCate;
	
	public List<CategoryModel> getListCate() {
		return listCate;
	}
	public void setListCate(List<CategoryModel> listCate) {
		this.listCate = listCate;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
	
}
