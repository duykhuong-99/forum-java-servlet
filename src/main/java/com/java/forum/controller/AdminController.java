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

import com.java.forum.model.AccountModel;
import com.java.forum.model.CategoryModel;
import com.java.forum.model.PostModel;
import com.java.forum.service.IAccountService;
import com.java.forum.service.ICategorySetvice;
import com.java.forum.service.IPostService;

@WebServlet(urlPatterns = { "/admin/post", "/admin/user", "/admin/user/info" })
public class AdminController extends HttpServlet {

	@Inject
	private ICategorySetvice categorySetvice;
	@Inject
	private IAccountService accountService;
	@Inject
	private IPostService postService;

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

		// admin - quản lý bài viết
		if (url != null && url.equals("/admin/post")) {
			List<PostModel> listPost = new ArrayList<PostModel>();
			listPost.addAll(postService.findAllPost());
			request.setAttribute("listPost", listPost);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/post.jsp");
			rd.forward(request, response);
		}
		// admin- danh sách tài khoản
		else if (url != null && url.equals("/admin/user")) {
			List<AccountModel> acc = new ArrayList<AccountModel>();
			acc.addAll(accountService.finALlAccount());
			request.setAttribute("listAccount", acc);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user.jsp");
			rd.forward(request, response);
		}
		// admin- quản lý người dùng
		else if (url != null && url.equals("/admin/user/info")) {
			String userName = request.getParameter("userName");
			AccountModel acc = accountService.findAccountInfo(userName);
			if (acc != null) {
				request.setAttribute("user_info", acc);
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user_info.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user");
			}
		}

		// kiểm tra action
		String action = request.getParameter("action");

		/// xóa post
		if (action != null && action.equals("delete_post")) {
			if (postService.deletePost(Long.valueOf(request.getParameter("postId")))) {
				response.sendRedirect(request.getContextPath() + "/admin/post?message=success");
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/post?message=fail");
			}
		}
		// xóa tài khoản
		else if (action != null && action.equals("delete_user")) {
			if (accountService.deleteAccount(request.getParameter("userName"))) {
				response.sendRedirect(request.getContextPath() + "/admin/user?message=success");
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user?message=fail");
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// kiểm tra action
		String action = request.getParameter("action");

		if (action != null && action.equals("change_status")) {
			if (accountService.updateStatus(Integer.parseInt(request.getParameter("status")),
					request.getParameter("userName"))) {
				response.sendRedirect(request.getContextPath() + "/admin/user?message=success");
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user?message=fail");
			}
		}
	}

}
