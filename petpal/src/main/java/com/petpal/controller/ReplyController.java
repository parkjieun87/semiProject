package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petpal.dao.ReplyDao;
import com.petpal.dto.ProductDto;
import com.petpal.dto.ReplyDto;
import com.petpal.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private ReplyService replyService;
	
	/* 리뷰 등록 */
	@PostMapping("/enroll")
	public void enrollReply(ReplyDto dto) {
		replyDao.enrollReply(dto);
	}
	
	/*
	/* 리뷰 체크 */
	/* 리뷰가 존재하면 1 존재하지 않으면 0 
	@PostMapping("/check")
	public String replyCheck(ReplyDto dto) {
		return replyService.replyCheck(dto);
	}
	*/
	


}
