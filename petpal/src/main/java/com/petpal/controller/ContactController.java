package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petpal.dao.BoardDao;
import com.petpal.vo.PaginationVO;

@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@Autowired
	private BoardDao boardDao;
	
	@GetMapping("/notice/write")
	public String write() {
		return "/WEB-INF/views/contact/write.jsp";
	}
	
	
	@GetMapping("/notice")
	public String notice(Model model,@ModelAttribute("vo") PaginationVO vo) {
		// 전체 게시물 개수
		int totalPageCnt = boardDao.totalPageCnt();
		vo.setCount(totalPageCnt);
		model.addAttribute("noticeList",boardDao.selectList(vo));
	
		
	return "/WEB-INF/views/contact/notice.jsp";
	}
	
	@GetMapping("/noticeDetail")
	public String detail(Model model, @RequestParam int boardNo) {
		
		model.addAttribute("pageInfo",boardDao.selectOne(boardNo));
		
		return "/WEB-INF/views/contact/noticeDetail.jsp";
	}

}
