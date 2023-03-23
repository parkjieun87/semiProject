package com.petpal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class BoardImageDto {
	private int attachmentNo;
	private int boardNo;
	
}
