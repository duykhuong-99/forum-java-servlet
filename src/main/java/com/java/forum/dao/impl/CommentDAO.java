package com.java.forum.dao.impl;

import java.util.List;

import com.java.forum.dao.ICommentDAO;
import com.java.forum.mapper.CommentMapper;
import com.java.forum.model.CommentModel;

/**
 * THỰC THI CÁC LỆNH SQL
 */
public class CommentDAO extends AbstractDAO<CommentModel> implements ICommentDAO {

	@Override
	public List<CommentModel> findComment(Long postId) {
		String query ="SELECT * FROM comment WHERE post = ? ORDER BY cmtDate ASC";
		return find(query, new CommentMapper(), postId);
	}

	@Override
	public int createComment(long postId, String content, String userComment) {
		String query = "INSERT INTO comment (post, content, cmtDate, likes, userComment)"
				+ " VALUES (?, ?, CURRENT_TIMESTAMP, 0, ?)";
		return insert(query, postId, content, userComment);
	}

	@Override
	public boolean deleteComment(long cmtId) {
		String query = "DELETE FROM comment WHERE commentId= ?";
		return update(query, cmtId);
	}

}
