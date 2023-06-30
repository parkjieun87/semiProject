//package com.petpal.reply;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.petpal.dao.ReplyDao;
//import com.petpal.dto.ReplyDto;
//
//@SpringBootTest
//public class ReplyTest {
//	
//	@Autowired
//	private ReplyDao dao;
//	
//	
//	@Test
//	public void test() {
//		
//		String id="testuser4";
//		int productNo = 168;
//		double rating = 3.5;
//		String content = "test";
//		
//		ReplyDto dto = new ReplyDto();
//		dto.setMemberId(id);
//		dto.setProductNo(productNo);
//		dto.setRating(rating);
//		dto.setContent(content);
//		
//		dao.enrollReply(dto);
//	}
//
//}
