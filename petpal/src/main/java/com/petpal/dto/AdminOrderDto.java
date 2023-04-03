package com.petpal.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminOrderDto {

	private String receiverName;
	private Date orderDate;
	private String receiverPost;
	private String receiverBasicAddr;
	private String receiverDetailAddr;
	private String receiverTel;
	private String productName;
	private int productCount;
	private int productPrice;
	private long total;
	private long orderDetailNo;
}
