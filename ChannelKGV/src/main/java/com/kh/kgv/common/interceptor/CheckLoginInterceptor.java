package com.kh.kgv.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kgv.customer.model.vo.User;

public class CheckLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	        throws Exception {
	    HttpSession session = request.getSession();
	    User loginUser = (User) session.getAttribute("loginUser");

	    if (loginUser == null || !"Y".equals(loginUser.getUserManagerSt())) {
	        response.sendRedirect(request.getContextPath() + "/");
	        return false;
	    }

	    return true;
	}
}