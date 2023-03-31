package com.petpal.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CategoryDto {
	
	// 카테고리 등급
	private int tier;
	
	// 카테고리 이름
	private String categoryName;
	
	// 카테고리 넘버
	private String categoryCode;
	
	// 상위 카테고리
	private String categoryParent;

}
