package com.java.forum.service;

import java.util.List;

import com.java.forum.model.PostModel;

public interface IPostService {

	
	/**
	 * DANH SÁCH TẤT CẢ POST
	 * @return list
	 */
	List<PostModel> findAllPost();
	
	/**
	 * TÌM POST THEO ID
	 * @param id
	 * @return model
	 */
	PostModel findPostById(Long id);
	
	/**
	 * TÌM THEO THỂ LOẠI
	 * @param cateId
	 * @return list
	 */
	List<PostModel> findPostByCateId(int cateId);
	
	/**
	 * TÌM THEO NGƯỜI VIẾT
	 * @param author
	 * @return list
	 */
	List<PostModel> findPostByAuthor(String author);

	/**
	 * TẠO POST
	 * @param category, author, title, content
	 * @return 0 -> thất bại|| 1 -> thành công
	 */
	int createPost(int category, String author, String title, String content);
	
	/**
	 * CẬP NHẬT POST
	 * @param category, title, content, id
	 * @return false -> thất bại|| true -> thành công
	 */
	boolean updatePost(int category, String title, String content, Long id);
	
	/**
	 *  XÓA POST
	 * @param id
	 * @return false -> thất bại|| true -> thành công
	 */
	boolean deletePost(Long id);
	
	
}
