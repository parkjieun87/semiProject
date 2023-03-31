package com.petpal.dto;

import lombok.Data;

@Data
public class CategoryCountDto {
				
		// 카테고리 이름
		private String categoryName;
		
		// 카테고리 넘버
		private String categoryCode;
		
		// 상위 카테고리
		private int categoryCount;

		private int totalCount;
		
}
