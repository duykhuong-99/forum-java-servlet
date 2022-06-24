package com.java.forum.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.forum.model.CategoryModel;
import com.java.forum.model.CommentModel;
import com.java.forum.model.PostModel;
import com.java.forum.service.ICategorySetvice;
import com.java.forum.service.ICommentService;
import com.java.forum.service.IPostService;

@WebServlet(urlPatterns = { "/post", "/post/create", "/post/category", "/post/update", "/post/detail", "/post/mypost",
		"/post/delete" })
public class PostController extends HttpServlet {
	@Inject
	private ICategorySetvice categorySetvice;
	@Inject
	private IPostService postService;
	@Inject
	private ICommentService commentService;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		// danh sách thể loai
		CategoryModel cate = new CategoryModel();
		cate.setListCate(categorySetvice.findAllCategory());
		request.setAttribute("category", cate);

		String url = request.getRequestURI().substring(request.getContextPath().length());

		// danh sách bài viết theo loại
		if (url != null && url.equals("/post/category")) {
			int cateId = Integer.parseInt(request.getParameter("id"));
			PostModel post = new PostModel();
			post.setPostList(postService.findPostByCateId(cateId));
			request.setAttribute("post", post);

			RequestDispatcher rd = request.getRequestDispatcher("/views/post/post_category.jsp");
			rd.forward(request, response);
		}

		// tạo bài viết
		else if (url != null && url.equals("/post/create")) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/post/create_post.jsp");
			rd.forward(request, response);
		}

		// chi tiết bài viết
		else if (url != null && url.equals("/post/detail")) {
			try { // id bài viết là số
				Long id = Long.parseLong(request.getParameter("id"));
				PostModel post = postService.findPostById(id);

				List<CommentModel> commentList = new ArrayList<CommentModel>();
				commentList.addAll(commentService.findComment(id));

				if (id != null && post != null) // bài viết tồn tại --> chuyển trang
				{
					// comment
					if (commentList.size() != 0) {
						request.setAttribute("comment", commentList);
					}

					request.setAttribute("post", post);
					RequestDispatcher rd = request.getRequestDispatcher("/views/post/post_detail.jsp");
					rd.forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} catch (NumberFormatException e) {
				response.sendRedirect(request.getContextPath() + "/home");
			}
		}

		// Cập nhật
		else if (url != null && url.equals("/post/update")) {
			try // id bài viết là số
			{
				Long id = Long.parseLong(request.getParameter("id"));
				PostModel post = postService.findPostById(id);
				if (post != null) // bài viết tồn tại
				{
					request.setAttribute("post", post);
					RequestDispatcher rd = request.getRequestDispatcher("/views/post/update_post.jsp");
					rd.forward(request, response);
				} else // Bài viết ko tồn tài --> chuyển về home
				{
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} catch (NumberFormatException e) {
				response.sendRedirect(request.getContextPath() + "/home");
			}

		}

		// xóa bài viết
		else if (url != null && url.equals("/post/delete")) {
			Long postId = Long.parseLong(request.getParameter("id"));
			String username = request.getParameter("username");
			Boolean result = postService.deletePost(postId);
			if (result == true) {
				response.sendRedirect(request.getContextPath() + "/post/mypost?username=" + username);
			} else {
				response.sendRedirect(
						request.getContextPath() + "/post/mypost?username=" + username + "&&message=cannot_delete");
			}
		}

		// bài viết đã viết
		else if (url != null && url.equals("/post/mypost")) {
			String username = request.getParameter("username");
			PostModel post = new PostModel();
			post.setPostList(postService.findPostByAuthor(username));
			request.setAttribute("post", post);

			RequestDispatcher rd = request.getRequestDispatcher("/views/post/mypost.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * 
	 * POST
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		CategoryModel cate = new CategoryModel();
		cate.setListCate(categorySetvice.findAllCategory());
		request.setAttribute("category", cate);

		String action = request.getParameter("action");// kiểm tra action

		int category = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// tạo
		if (action != null && action.equals("create")) {
			// lấy dữ liệu
			String author = request.getParameter("author");
			int result = postService.createPost(category, author, title, content); // tạo

			if (result == 1) {
				// tạo thành công
				response.sendRedirect(request.getContextPath() + "/post/mypost?username=" + author);
			} else {
				// tạo thất bại
				response.sendRedirect(request.getContextPath() + "/home");
			}
		}
		
		// cập nhật
		else if (action != null && action.equals("update")) {
			// lấy dữ liệu
			Long postId = Long.parseLong(request.getParameter("postId"));
			Boolean result = postService.updatePost(category, title, content, postId); // cập nhật
			if (result == true) {
				// đã cập nhât
				response.sendRedirect(request.getContextPath() + "/post/update?id=" + postId + "&message=updated");
			} else {
				// chưa cập nhật
				response.sendRedirect(request.getContextPath() + "/post/update?id=" + postId + "&message=cannot_update");
			}
		}

	}

}
