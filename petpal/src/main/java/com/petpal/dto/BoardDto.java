package com.petpal.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDto {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;

}
