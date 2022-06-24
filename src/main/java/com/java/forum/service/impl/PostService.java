package com.java.forum.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.java.forum.dao.IPostDAO;
import com.java.forum.model.PostModel;
import com.java.forum.service.IPostService;

/***
 * THỰC THI LỆNH THÔNG QUA DAO
 */
public class PostService implements IPostService {

	@Inject
	private IPostDAO postDAO;

	/**
	 * LẤY TẤT CẢ POST
	 * 
	 * @return list
	 */
	@Override
	public List<PostModel> findAllPost() {
		return postDAO.findAllPost();
	}

	/**
	 * TÌM POST THEO ID
	 * 
	 * @return 1 post
	 */
	@Override
	public PostModel findPostById(Long id) {
		return postDAO.findPostById(id);
	}

	/**
	 * TÌM THEO LOẠI
	 * 
	 * @return list
	 */
	@Override
	public List<PostModel> findPostByCateId(int cateId) {
		return postDAO.findPostByCateId(cateId);
	}

	/**
	 * XÓA POST
	 * @param  postId
	 * @return 0--> false--> thất bại | true --> thành công
	 */
	@Override
	public boolean deletePost(Long id) {
		return postDAO.deletePost(id);
	}

	/**
	 * TÌM POST THEO NGƯỜI VIẾT
	 */
	@Override
	public List<PostModel> findPostByAuthor(String author) {
		return postDAO.findPostByAuthor(author);
	}

	/**
	 * TẠO POST
	 * @param  category, author, title, content
	 * @return 0--> thất bại | 1 --> thành công
	 */
	@Override
	public int createPost(int category, String author, String title, String content) {
		return postDAO.createPost(category, author, title, content);
	}

	/**
	 * CẬP NHẬT
	 * @param category, title,  content, author
	 * @return false--> thất bại | true --> thành công
	 */
	@Override
	public boolean updatePost(int category, String title, String content, Long id) {
		return postDAO.updatePost(category, title, content, id);
	}

}
