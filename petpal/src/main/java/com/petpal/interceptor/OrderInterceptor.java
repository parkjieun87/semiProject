package com.petpal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.petpal.advice.RequireLoginException;

//비회원이 회원 기능에 접근 하는걸 막기위해 만듬. 
@Service
public class OrderInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//로그인 상태 = 세션의 memberId가 null이 아닌 경우
		HttpSession session = request.getSession(); //세션을 직접 가져와야 한다. 컨트롤러가 아니니.
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId != null) { //회원이라면 이라는 소리
			return true;
		}
		else { //비회원이라면 - 로그인 페이지로 이동시키면서 차단
			
			throw new RequireLoginException("로그인 후 이용 가능합니다.");
		
		}
		
	}

}
