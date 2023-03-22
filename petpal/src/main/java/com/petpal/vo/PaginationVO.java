package com.petpal.vo;

import lombok.Data;

@Data
public class PaginationVO {
	
		// 현재 페이지
		private int page;
		
		// 한 페이지당 보여줄 게시물 개수
		private int size;
		
		// 전체 게시물 개수
		private int count;
		
		// 보여지는 네비사이즈
		private int blockSize;
		
		PaginationVO() {
			this(1,10,10);
		}
		
		PaginationVO(int page, int size, int blockSize){
			this.page = page;
			this.size = size;
			this.blockSize = blockSize;
		}
		
		public int getBegin() {
			return page * size - (size-1);
		}
		
		public int getEnd() {
			return (int)Math.min(page*size,count);
		}
		
		public int getTotalPage() {
			return (count + size -1)/ size;
		}
		
		public int getStartBlock() {
			return (page-1)/ blockSize * blockSize + 1;
		}
		
		public int getFinishBlock() {
			int value = (page-1) / blockSize * blockSize + blockSize;
			return Math.min(value, getTotalPage());
		}
		
		public boolean isFirst() {
			return page == 1;
		}
		
		public boolean isLast() {
			return page == getTotalPage();
		}
		
		public boolean isPrev() {
			return getStartBlock() > 1;
		}
		
		public boolean isNext() {
			return getFinishBlock() < getTotalPage();
		}
		
		public int getPrevPage() {
			return getStartBlock() - 1;
		}
		
		public int getNextPage() {
			return getFinishBlock() + 1;
		}

}
