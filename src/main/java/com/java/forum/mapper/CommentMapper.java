package com.java.forum.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.forum.model.CommentModel;

public class CommentMapper implements RowMapper<CommentModel> {

	@Override
	public CommentModel mapRow(ResultSet rS) {

		try {
			CommentModel model = new CommentModel();
			model.setCommentId(rS.getLong("commentId"));
			model.setPost(rS.getLong("post"));
			model.setContent(rS.getString("content"));
			model.setCmtDate(rS.getDate("cmtDate"));
			model.setLikes(rS.getInt("likes"));
			model.setUserComment(rS.getString("userComment"));
			return model;
		} catch (SQLException e) {
			return null;
		}
	}

}
