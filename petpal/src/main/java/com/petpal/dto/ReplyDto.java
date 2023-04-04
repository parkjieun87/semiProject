package com.petpal.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyDto {

	private int replyId;
	private int productNo;
	private String memberId;
	private Date regDate;
	private String content;
	private double rating;
	
	// 조인할 컬럼
	private String productName;
	

}
