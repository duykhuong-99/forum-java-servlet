package com.java.forum.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.forum.model.AccountModel;
import com.java.forum.util.SessionUtil;

/***
 * 
 * Xác thực --> chặn user vào trang admin
 *
 */
public class Authorization implements Filter {

	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext(); // setup filter
	}

	@Override
	public void doFilter(ServletRequest rq, ServletResponse rs, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) rq;
		HttpServletResponse response = (HttpServletResponse) rs;

		String url = request.getRequestURI();
		// lấy session tài khoản
		AccountModel acc = (AccountModel) SessionUtil.getInstance().getSession(request, "account");
		if (url.startsWith(request.getContextPath() + "/admin")) // truy cập trang admin
		{
			if (acc != null) {
				if (acc.getIsAdmin() == 0) {
					chain.doFilter(rq, rs); // là admin --> cho phép truy cập
				} else {
					// ko phải admin --> chuyển về home user
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/account/login");
			}
		}
		// truy cập trang user --> chưa đăng nhập --> ko cho tạo/update/delete/mypost
		else if (url.startsWith(request.getContextPath() + "/post/update")
				|| url.startsWith(request.getContextPath() + "/post/create")
				|| url.startsWith(request.getContextPath() + "/post/delete")
				|| url.startsWith(request.getContextPath() + "/account/info")
				|| url.startsWith(request.getContextPath() + "/account/update")) {
			// đã đăng nhập
			if (acc != null) {
				chain.doFilter(rq, rs);
			} else {
				response.sendRedirect(request.getContextPath() + "/account/login");
			}

		}
		// mypost : url ?username=... --> ngăn chặn thay đổi username khác  
		else if (url.startsWith(request.getContextPath() + "/post/mypost")) {
			// đã đăng nhập
			if (acc != null) {
				if(acc.getUserName().equals(request.getParameter("username"))) {
					chain.doFilter(rq, rs);
				}else {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/home");
			}

		}

		else {
			chain.doFilter(rq, rs);
		}
	}

	@Override
	public void destroy() {
		// destroy

	}

}
