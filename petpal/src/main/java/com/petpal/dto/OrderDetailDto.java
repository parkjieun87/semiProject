package com.petpal.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder 
public class OrderDetailDto {

	//주문상세(OrderDetail) 필드
	private int orderDetailNo; // 주문상세번호
	private int orderNo; // 주문 번호
	private int productNo; // 상품 번호
	private String memberId; // 아이디
//	private String categoryCode; // 카테고리 코드
	private int productCount; // 주문상품수량
	private int productPrice; // 주문상품가격
	
	// 조인 할 컬럼
	private String productName;
	private int attachmentNo;
	
}
