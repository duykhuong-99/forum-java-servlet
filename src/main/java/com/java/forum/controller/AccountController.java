package com.java.forum.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.forum.model.AccountModel;
import com.java.forum.model.CategoryModel;
import com.java.forum.service.IAccountService;
import com.java.forum.service.ICategorySetvice;
import com.java.forum.util.FormUtil;
import com.java.forum.util.SessionUtil;

@WebServlet(urlPatterns = { "/account", "/account/register", "/account/login", "/account/logout", "/account/info" })
public class AccountController extends HttpServlet {

	@Inject
	private ICategorySetvice categorySetvice;
	@Inject
	private IAccountService accountService;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		CategoryModel cate = new CategoryModel();
		cate.setListCate(categorySetvice.findAllCategory());
		request.setAttribute("category", cate);

		String url = request.getRequestURI().substring(request.getContextPath().length());

		// đăng nhập
		if (url != null && url.equals("/account/login")) {
			String alert = request.getParameter("alert");
			if (alert != null) {
				if (alert.equals("invalid")) {
					request.setAttribute("alert", "Sai thông tin tài khoản");
				} else if (alert.equals("success")) {
					request.setAttribute("message", "Đăng ký tài khoản thành công");
				} else if (alert.equals("updated")) {
					request.setAttribute("message", "Thay đổi thông tin thành công, hãy đăng nhập lại !");
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/account/login.jsp");
			rd.forward(request, response);
		}
		// đăng xuất
		else if (url != null && url.equals("/account/logout")) {
			SessionUtil.getInstance().removeSession(request, "account");
			response.sendRedirect(request.getContextPath() + "/account/login");
		}
		// đăng ký
		else if (url != null && url.equals("/account/register")) {
			String alert = request.getParameter("alert");
			if (alert != null) {
				if (alert.equals("password")) {
					request.setAttribute("alert", "Mật khẩu không trùng khớp !");
				} else {
					request.setAttribute("alert", "Tài khoản đã tồn tại trong hệ thống !");
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/account/register.jsp");
			rd.forward(request, response);
		}

		// thông tin tài khoản
		else if (url != null && url.equals("/account/info")) {
			String alert = request.getParameter("alert");
			if (alert != null) {
				if (alert.equals("success")) {
					request.setAttribute("message", "Cập nhật thành công");
				} else if (alert.equals("fail")) {
					request.setAttribute("alert", "Cập nhât thất bại");
				} else if (alert.equals("password")) {
					request.setAttribute("alert", "Mật khẩu không trùng khớp");
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/account/account_info.jsp");
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

		String action = request.getParameter("action");
		/// đăng ký
		if (action != null && action.equals("register")) {

			String userName = request.getParameter("userName");
			String userPassword = request.getParameter("userPassword");
			String passwordConfirm = request.getParameter("passwordConfirm");
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");

			if (userPassword.equals(passwordConfirm)) {
				int result = accountService.accountRegister(userName, userPassword, fullName, email);
				if (result == 0) {
					// Đăng ký thất bại
					response.sendRedirect(request.getContextPath() + "/account/register?alert=exists");
				} else {
					// Đăng ký thành công
					response.sendRedirect(request.getContextPath() + "/account/login?alert=success");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/account/register?alert=password");
			}
		}
		// đăng nhập
		else if (action != null && action.equals("login")) {
			AccountModel account = FormUtil.toModel(AccountModel.class, request);
			account = accountService.findAccount(account.getUserName(), account.getUserPassword());
			if (account != null) {
				SessionUtil.getInstance().putSession(request, "account", account); // đặt session
				if (account.getIsAdmin() == 0) {
					response.sendRedirect(request.getContextPath() + "/admin/home");
				} else {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/account/login?alert=invalid");
			}
		}
		// Cập nhật
		else if (action != null && action.equals("update")) {
			String userName = request.getParameter("userName");
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String userPassword = request.getParameter("userPassword");
			String passwordConfirm = request.getParameter("passwordConfirm");

			if (userPassword.equals(passwordConfirm)) {
				Boolean result = accountService.updateInfo(userName, userPassword, fullName, email);
				if (result == false) {
					// thất bại
					response.sendRedirect(request.getContextPath() + "/account/info?alert=fail");
				} else {
					// thành công
					SessionUtil.getInstance().removeSession(request, "account");
					response.sendRedirect(request.getContextPath() + "/account/login?alert=updated");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/account/info?alert=password");
			}
		}

	}

}
