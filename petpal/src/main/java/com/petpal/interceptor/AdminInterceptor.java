package com.petpal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;


//관리자만 접근하도록 하는 인터셉터
@Service
public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	throws Exception{
		HttpSession session = request.getSession();
		Integer memberLevel = (Integer)session.getAttribute("adminCk");
	
		//null 검사 무적권 해야함
	if(memberLevel == 1)
			{
		return true;
	}
	else {
		response.sendRedirect("/member/login");//return "redirect:/member/login"
		return false;
	}
	}
	
}
