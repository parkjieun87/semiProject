package com.petpal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petpal.dao.MemberDao;
import com.petpal.dao.ProductDao;
import com.petpal.dto.MemberDto;
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.OrderListDto;
import com.petpal.dto.ProductDto;

@Controller
@RequestMapping("/member")
public class MemberController {

   @Autowired
   private MemberDao memberDao;
   
   @Autowired
   private ProductDao productDao;

   
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
	   session.setAttribute("adminCk", findDto.getAdminCk());
	   
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
   
 //비밀번호를 제외한 개인정보 변경 (형석 2023.03.23)
   @GetMapping("/edit")
	 public String edit(
			 HttpSession session,//회원 아이디가 저장되어 있는 세션 객체
			 Model model//회원의 모든 정보를 전달할 전송 객체
			) {
		 String memberId = (String) session.getAttribute("memberId");
		 MemberDto memberDto = memberDao.selectOne(memberId);
		 model.addAttribute("memberDto", memberDto);
		 return "/WEB-INF/views/member/edit.jsp";
	 }
	 
	 @PostMapping("/edit")
	 public String edit(
			 @ModelAttribute MemberDto memberDto,//데이터 자동 수신 객체
			 HttpSession session,//회원 아이디가 저장되어 있는 세션 객체
			 RedirectAttributes attr//리다이렉트 시 정보를 추가할 전송 객체
		 ) {
		 String memberId = (String)session.getAttribute("memberId");
		 MemberDto findDto = memberDao.selectOne(memberId);
		 
		 //비밀번호가 일치하지 않는다면 → 에러 표시 후 이전 페이지로 리다이렉트
		 if(!findDto.getMemberPw().equals(memberDto.getMemberPw())) {

			 
			 attr.addAttribute("mode","error");

			 attr.addAttribute("mode", "error");
			 return "redirect:edit";
		 }
		 
		 //비밀번호가 일치한다면 → 비밀번호 변경 및 완료 페이지로 리다이렉트
		 memberDto.setMemberId(memberId);//아이디를 추가 설정
		 memberDao.changeInformation(memberDto);//정보 변경 요청
		 return "redirect:editFinish";
	 }
	 
	 @GetMapping("/editFinish")
	 public String editFinish() {
		 return "/WEB-INF/views/member/editFinish.jsp";
	 }
	 
	 //회원탈퇴 기능 구현 (2023.03.24 형석)
	 
	 @GetMapping("/exit")
	 public String exit(HttpSession session) {
		 return "/WEB-INF/views/member/exit.jsp";
	 }
	 
	 @PostMapping("/exit")
	 public String exit(HttpSession session, //회원 정보가 저장되어 있는 세션 객체
			 @RequestParam String memberPw, //사용자가 입력한 비번
			 RedirectAttributes attr//리다이렉트시 정보를 추가 하기위한 객체
			 )
	 {
		 String memberId = (String)session.getAttribute("memberId");
		 MemberDto memberDto = memberDao.selectOne(memberId);
		 
		 //비번이 일치하지 않는 경우
		 if(!memberDto.getMemberPw().equals(memberPw)) {
			 attr.addAttribute("mode","error");
			 return "redirect:exit";
		 }
		 
		 //비번이 일치하는 경우 = 회원탈퇴 + 로그아웃
		 memberDao.delete(memberId);
		 
		 session.removeAttribute("memberId");
		 session.removeAttribute("memberNick");
		 
		 return "redirect:exitFinish";
	 }
			 
	 @GetMapping("/exitFinish")
	 public String exitFinish() {
		 return "/WEB-INF/views/member/exitFinish.jsp";
	 }
	 
	 //장바구니 페이지 구현
	 @GetMapping("/cart")
	 public String cart() {
		 return "/WEB-INF/views/member/cart.jsp";
	 }
	 
	 //주문목록 페이지 구현  - (재영 수정)
	 @GetMapping("/orderList")
	 public String orderList(HttpSession session, Model model) {
		 
		 String memberId = (String)session.getAttribute("memberId");
		 
		 List<OrderDetailDto> list = memberDao.orderList(memberId);
		 model.addAttribute("orderList",list);
		 return "/WEB-INF/views/member/orderList.jsp";
	 }
	 
		/* 리뷰 쓰기 */
		@GetMapping("/replyEnroll/{memberId}")
		public String replyEnrollWindowGET(@PathVariable("memberId") String memberId, int productNo, Model model) {
			ProductDto dto = productDao.getProduct(productNo);
			
			model.addAttribute("orderList",dto);
			model.addAttribute("memberId",memberId);
			return "/WEB-INF/views/product/replyEnroll.jsp";
			
		}
	 
}

