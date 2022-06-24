package com.java.forum.service;

import java.util.List;

import com.java.forum.model.CommentModel;

public interface ICommentService {
	/**
	 * LẤY DANH SÁCH COMMENT 
	 * @param postId
	 * @return list
	 */
	List<CommentModel> findComment(Long postId);
	
	/**
	 * TẠO COMMENT
	 * @param postId , content, userComment
	 * @return 0 -> thất bại|| 1 -> thành công
	 */
	int createComment(long postId, String content, String userComment );
	
	/**
	 * XÓA COMMENT
	 * @param cmtId
	 * @return
	 */
	boolean deleteComment(long cmtId);
}
