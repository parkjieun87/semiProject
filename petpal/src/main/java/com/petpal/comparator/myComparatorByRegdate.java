package com.petpal.comparator;

import java.util.Comparator;

import com.petpal.dto.ProductWithImageDto;

public class myComparatorByRegdate implements Comparator<ProductWithImageDto> {

	@Override
	public int compare(ProductWithImageDto o1, ProductWithImageDto o2) {
		// TODO Auto-generated method stub
		return o2.getProductRegdate().compareTo(o1.getProductRegdate());
	}
	
}
