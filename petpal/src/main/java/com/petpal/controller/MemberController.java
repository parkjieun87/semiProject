package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

   
}
