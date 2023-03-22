package com.petpal.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@AllArgsConstructor@Builder@NoArgsConstructor
public class ProductDto {
	//상품(product) 필드
	private int productNo; // 상품번호
	private String categoryCode; // 카테고리코드
	private String productName; // 상품이름
	private int productPrice; // 상품가격
	private int productStock; // 상품수량
	private String productDesc; // 상품설명
	private Date productRegdate; // 상품등록일
	private int productDiscount; // 상품할인율
	private int productViews; //조회수
	
}
