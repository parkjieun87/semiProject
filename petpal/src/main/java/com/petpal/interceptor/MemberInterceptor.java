package com.petpal.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.petpal.advice.RequireLoginException;
import com.petpal.dao.CartDao;
import com.petpal.dto.CartDto;

//비회원이 회원 기능에 접근 하는걸 막기위해 만듬. 
@Service
public class MemberInterceptor implements HandlerInterceptor {

   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      
      //로그인 상태 = 세션의 memberId가 null이 아닌 경우
      HttpSession session = request.getSession(); //세션을 직접 가져와야 한다. 컨트롤러가 아니니.
      String memberId = (String)session.getAttribute("memberId");

      if(memberId != null) { //회원이라면 이라는 소리
         return true;
      }else { //비회원이라면 - 로그인 페이지로 이동시키면서 차단
         response.sendRedirect("/member/login");//return "redirect:/member/login"
         return false;
      }
      
   }
}