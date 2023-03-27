package com.petpal.dto;

import java.sql.Date;


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
}
