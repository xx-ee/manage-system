package com.ms.utils;

import com.ms.entity.User;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebUtils {
	
	
	/**
	 * 得到requset
	 */
	public static HttpServletRequest getRequest() {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes)
				RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = requestAttributes.getRequest();
		return request;
	}
	
	/**
	 * 得到session
	 */
	public static HttpSession getSession() {
		return getRequest().getSession();
	}
	/**
	 *
	 * @return
	 */
	public static ServletRequestAttributes getServletRequestAttributes() {
		return (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
	}
	/**
	 * 得到当前响应对象
	 */
	public static HttpServletResponse getResponse() {
		HttpServletResponse response = getServletRequestAttributes().getResponse();
		return response;
	}/**
	 * 得到ServletContext
	 */
	public static ServletContext getServletContext() {
		return getRequest().getServletContext();
	}

	/**
	 * 得到session里面的user对象
	 */
	public static User getCurrentUser() {
		return (User) getSession().getAttribute("user");
	}
}
