package com.petpal.dto;



import java.sql.Date;

import lombok.Data;

@Data
public class SalesDto {
	
	private Date orderDate;
	private int productCount;
	private int productPrice;
	private long totalSale;
	
	public void setTotalSale(){
		this.totalSale = productCount * productPrice;
	}
	
	public long getTotalSale() {
		return totalSale;
	}
	
	
	
}
