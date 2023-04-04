package com.petpal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder 
//주문목록 확인하기 위한 DTO 2023.04.03 형석
public class OrderListDto {
	
	private int orderNo;
	private String memberId;
	private String productName;
	private int productCount;
	private int productPrice;
	
	
}
