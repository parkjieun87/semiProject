package com.petpal.dto;



import java.sql.Date;

import lombok.Data;

@Data
public class SalesDto {
	
	private Date orderDate;
	private long total;
}
