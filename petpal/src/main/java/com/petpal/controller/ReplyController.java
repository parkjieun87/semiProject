package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petpal.dao.OrderDao;
import com.petpal.dao.ReplyDao;
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.ProductDto;
import com.petpal.dto.ReplyDto;
import com.petpal.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyDao replyDao;
	
	
	/* 리뷰 등록 */
	@PostMapping("/enroll")
	public void enrollReply(ReplyDto dto) {
		replyDao.enrollReply(dto);
		
	}
	
	
	


}
