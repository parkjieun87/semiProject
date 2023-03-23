package com.petpal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petpal.dao.MemberDao;
import com.petpal.dto.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {

   @Autowired
   private MemberDao memberDao;
   
   
   //회원가입 구현 (형석)
   
   @GetMapping("/join")
   public String join() {
      return "/WEB-INF/views/member/join.jsp";
   }

   @PostMapping("/join")
   public String join(@ModelAttribute MemberDto memberDto) {   
      
      memberDao.insert(memberDto);
      return "redirect:joinFinish";
   }
   
   @GetMapping("/joinFinish")
   public String joinFinish() {
      return "/WEB-INF/views/member/joinFinish.jsp";
   }
   
   
   //로그인 기능 구현 (형석 2023.03.23)
   
   @GetMapping("/login")
   public String login() {
	   return "/WEB-INF/views/member/login.jsp";
   }
   
   @PostMapping("/login")
   public String login(@ModelAttribute MemberDto userDto,
		  RedirectAttributes attr, HttpSession session) {
	   //로그인 검사 : 단일조회 진행 후 비밀번호가 일치하는지를 비교함.
	   MemberDto findDto = memberDao.selectOne(userDto.getMemberId());
	   
	   //아디 중복검사 -> 중복 -> 오류처리
	   if(findDto == null) {
		   attr.addAttribute("mode", "error");
		   return "redirect:login"; 
	   }
	   
	   //비밀번호가 일치하지 않는다면,
	   if(!userDto.getMemberPw().equals(findDto.getMemberPw())) {
		   attr.addAttribute("mode", "error");
		   return "redirect:login";
	   }
	   
	   //로그인 성공한 경우 이를 기억하기 위해 HttpSession에 정보 추가
	   session.setAttribute("memberId", findDto.getMemberId());
	   session.setAttribute("memberNick", findDto.getMemberNick());
	   
	   return "redirect:/";
   }
   
   // 로그아웃 기능 (형석 2023.03.23)
   
   @GetMapping("/logout")
   public String logout(HttpSession session) {
	   session.removeAttribute("memberId");
	   session.removeAttribute("memberNick");
	   return "redirect:/";
   }
   
   // 마이페이지 기능 (형석 2023.03.23)
   @GetMapping("/mypage")
   public String mypage(HttpSession session, Model model) {
	   String memberId = (String) session.getAttribute("memberId");
	   MemberDto memberDto = memberDao.selectOne(memberId);
	   model.addAttribute("memberDto", memberDto);
	   return "/WEB-INF/views/member/mypage.jsp";
   }
   
   // 비밀번호 변경 기능 (형석 2023.03.23)
   @GetMapping("/password")
   public String password() {
	   return "/WEB-INF/views/member/password.jsp";
   }
   
   @PostMapping("/password")
   public String password(
		   HttpSession session, // 아디 저장되어 있는 세션 객체
		   @RequestParam String currentPw, //현재 비번
		   @RequestParam String changePw, //변경할 비번
		   RedirectAttributes attr) {
	   	String memberId = (String)session.getAttribute("memberId");
	   	MemberDto memberDto = memberDao.selectOne(memberId);
	   	
	   	//비밀번호가 일치하지 않으면,
	   	if(!memberDto.getMemberPw().equals(currentPw)) {
	   		attr.addAttribute("mode","error");
	   		return "redirect:password";
	   	}
	   
	   	//비밀번호가 일치한다면 -> 비번 변경처리 완료 
	   	memberDao.changePassword(memberId, changePw);
	   	return "redirect:passwordFinish";
   		}
   
   @GetMapping("/passwordFinish")
	 public String passwordFinish() {
		 return "/WEB-INF/views/member/passwordFinish.jsp";
	 }
		   
		   
   
   //아이디 찾기 페이지 구현 (형석 2023.03.23)
   @GetMapping("/find")
   public String find() {
	   return "/WEB-INF/views/member/find.jsp";
   }
   
   @PostMapping("/find") //session은 아디가 로그인 한 상태일때 쓰는거다
	 public String find(@ModelAttribute MemberDto memberDto, 
			 Model model, RedirectAttributes attr) {
		 try {
			 String memberId = memberDao.findId(memberDto);
			 model.addAttribute("memberId", memberId);
			 return "/WEB-INF/views/member/findResult.jsp";
		 }
		 catch(Exception e) {
			 attr.addAttribute("mode", "error");
			 return "redirect:find";
		 }
	 }
}
