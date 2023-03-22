package com.petpal.dto;

import java.sql.Date;

import lombok.Data;

@Data	
public class MemberDto {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberTel;
	private String memberNick;
	private int adminck;
	private Date memberRegdate;
	private String memberPost;
	private String memberBasicAddr;
	private String memberDetailAddr;
	
}
