package com.petpal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpal.dao.ReplyDao;
import com.petpal.dto.ReplyDto;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDao replyDao;
	
	
	public String replyCheck(ReplyDto dto) {
		
		Integer result = replyDao.checkReply(dto);
		System.out.println(result);
		if(result > 1) {
			return "1";
		}else {
			return "0";
		}
	}

}
