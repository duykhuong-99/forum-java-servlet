package com.java.forum.model;

import java.util.Date;
import java.util.List;

public class PostModel {


	private Long postId ;
	private int category ;
	private String author ;
	private String title ;
	private String content ;
	private Date createDate ;
	private int likes;
	private List<PostModel> postList;
	
	public List<PostModel> getPostList() {
		return postList;
	}
	public void setPostList(List<PostModel> postList) {
		this.postList = postList;
	}
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	
}
