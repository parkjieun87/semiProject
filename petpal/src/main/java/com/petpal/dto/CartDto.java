package com.petpal.dto;

import lombok.Data;

@Data
public class CartDto {
	
	private int cartNo;
	private String memberId;
	private int productNo;
	private int productCount;
	
	// product (cart 테이블과 조인을 하여 3개의 변수를 장바구니 페이지에 뿌려줄 것)
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int productStock;
	
	
	// 추가 (할인을 적용한 상품의 한개 가격과 판매 가격에 수량까지 곱한 총가격을 의미)
	private int salePrice;
	private int totalPrice;
	
	public void initSaleTotal() {
		this.salePrice = (int)(this.productPrice * (1-this.productDiscount));
		this.totalPrice = this.salePrice * this.productCount;
	}

}
