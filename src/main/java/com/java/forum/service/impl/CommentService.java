package com.java.forum.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.java.forum.dao.ICommentDAO;
import com.java.forum.model.CommentModel;
import com.java.forum.service.ICommentService;

public class CommentService implements ICommentService {

	@Inject
	private ICommentDAO commentDAO;
	
	@Override
	public List<CommentModel> findComment(Long postId) {
		return commentDAO.findComment(postId);
	}
	
	@Override
	public int createComment(long postId, String content, String userComment) {
		return commentDAO.createComment(postId, content, userComment);
	}

	@Override
	public boolean deleteComment(long cmtId) {
		return commentDAO.deleteComment(cmtId);
	}
}
