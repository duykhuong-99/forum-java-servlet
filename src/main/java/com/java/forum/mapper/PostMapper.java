package com.java.forum.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.forum.model.PostModel;

public class PostMapper implements RowMapper<PostModel> {

	@Override
	public PostModel mapRow(ResultSet rS) {
		try {
			PostModel model = new PostModel();
			model.setPostId(rS.getLong("postId"));
			model.setCategory(rS.getInt("category"));
			model.setAuthor(rS.getString("author"));
			model.setTitle(rS.getString("title"));
			model.setContent(rS.getString("content"));
			model.setCreateDate(rS.getDate("createDate"));
			model.setLikes(rS.getInt("likes"));
			return model;
		} catch (SQLException e) {
		return null;
		}
	}

}
