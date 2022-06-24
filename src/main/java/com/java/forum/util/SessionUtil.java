package com.java.forum.util;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {

	private static SessionUtil session = null;

	/**
	 *  kiểm tra dối tượng tồn tại hay chưa
	 */
	public static SessionUtil getInstance() {
		if (session == null) {
			session = new SessionUtil();
		}
		return session;
	}

	public void putSession(HttpServletRequest request, String key, Object value) {
		request.getSession().setAttribute(key, value);
	}

	public Object getSession(HttpServletRequest request, String key) {
		return request.getSession().getAttribute(key);
	}

	public void removeSession(HttpServletRequest request, String key) {
		request.getSession().removeAttribute(key);
	}
}
