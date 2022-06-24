package com.java.forum.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.forum.model.CategoryModel;
import com.java.forum.model.PostModel;
import com.java.forum.service.ICategorySetvice;
import com.java.forum.service.IPostService;

@WebServlet(urlPatterns = { "/home", "/admin/home" })
public class HomeController extends HttpServlet {

	@Inject
	private ICategorySetvice categorySetvice;

	@Inject
	private IPostService postService;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CategoryModel cate = new CategoryModel();
		cate.setListCate(categorySetvice.findAllCategory());
		request.setAttribute("category", cate);

		PostModel post = new PostModel();
		post.setPostList(postService.findAllPost());
		request.setAttribute("post", post);

		String url = request.getRequestURI().substring(request.getContextPath().length());

		// user page
		if (url != null && url.equals("/home")) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(request, response);
		}
		// admin page
		else if (url != null && url.equals("/admin/home")) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
