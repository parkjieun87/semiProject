package com.petpal.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductDto {
	
	private int productNo;
	private String categoryCode;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productDesc;
	private Date productRegdate;
	private int productDiscount;
	private int productViews;
	
}
