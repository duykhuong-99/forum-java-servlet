package com.java.forum.dao.impl;

import java.util.List;

import com.java.forum.dao.IPostDAO;
import com.java.forum.mapper.PostMapper;
import com.java.forum.model.PostModel;

/**
 * THỰC THI CÁC LỆNH SQL
 */
public class PostDAO extends AbstractDAO<PostModel> implements IPostDAO {

	@Override
	public List<PostModel> findPostByCateId(int cateId) {
		String qr = "SELECT * FROM post WHERE category =?  ORDER BY createDate DESC ";
		return find(qr, new PostMapper(), cateId);
	}

	@Override
	public int createPost(int category, String author, String title, String content) {
		String query = "INSERT INTO post(category, author, title, content, createDate, likes) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, 0)";
		return insert(query, category, author, title, content);
	}

	@Override
	public PostModel findPostById(Long id) {
		String query="SELECT * FROM post WHERE postId =? ";
		List<PostModel> post = find(query, new PostMapper(), id);
		return post.isEmpty() ? null: post.get(0);
	}

	@Override
	public List<PostModel> findAllPost() {
		String qr = "SELECT * FROM post  ORDER BY createDate DESC";
		return find(qr, new PostMapper());
	}

	@Override
	public boolean updatePost(int category, String title, String content, Long id) {
		String query="UPDATE post SET category = ? , title = ?, content = ? WHERE postId =? ";
		return update(query, category, title, content, id);
	}
	
	@Override
	public boolean deletePost(Long id) {
		String query = "DELETE FROM post WHERE postId= ?";
		return update(query, id);
	}

	@Override
	public List<PostModel> findPostByAuthor(String author) {
		String query ="SELECT * FROM post WHERE author = ?  ORDER BY createDate DESC";
		return find(query, new PostMapper(), author);
	}

}
