package com.java.forum.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.forum.service.ICommentService;


@WebServlet(urlPatterns = {"/comment"})
public class CommentController extends HttpServlet {
	
	@Inject 
	private ICommentService commentService;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		
		
		if (action != null && action.equals("delete")) {
			Long commentId = Long.valueOf(request.getParameter("commentId"));
			Long postId = Long.valueOf(request.getParameter("postId"));
			if(commentService.deleteComment(commentId)) {
				response.sendRedirect(request.getContextPath() + "/post/detail?id=" + postId);
			}else {
				//không thể xóa 
				response.sendRedirect(request.getContextPath() + "/post/detail?id=" + postId);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");

		// comment
		if (action != null && action.equals("newcomment")) {
			String content = request.getParameter("content");
			Long postId = Long.valueOf(request.getParameter("postId"));
			String userName = request.getParameter("userName");
			
			if(commentService.createComment(postId, content, userName) == 1) {
				response.sendRedirect(request.getContextPath() + "/post/detail?id=" + postId);
			}
			else {
				// khi không thể cmt
			}
		} 
	}

}
