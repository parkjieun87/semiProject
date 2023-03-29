package com.petpal.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProductOrderDto {
	//주문(ProductOrder) 필드
	private int orderNo; // 주문번호
	private String memberId; // 아이디
	private Date orderDate; // 주문날짜
	private String receiverName; // 수취인 이름
	private String receiverTel; // 수취인 전화번호
	private String receiverBasicAddr; //수취인 기본주소
	private String receiverPost; // 수취인 우편번호
	private String receiverDetailAddr; // 수취인 상세주소
	
	//주문상세(OrderDetail) 필드
	private int orderDetailNo; // 주문상세번호
//	private int orderNo; // 주문 번호
	private int productNo; // 상품 번호
//	private String memberId; // 아이디
	private String categoryCode; // 카테고리 코드
	private int productCount; // 주문상품수량
	private int productPrice; // 주문상품가격
}
