package com.petpal.dto;

import lombok.Data;

@Data
public class FaqDto {
	private int faqNo;
	private String faqTitle;
	private String faqAnswer;
	private int faqCategory;
	private String faqCategoryName;
	
}
