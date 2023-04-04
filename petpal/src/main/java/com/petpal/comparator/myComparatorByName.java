package com.petpal.comparator;

import java.util.Comparator;

import com.petpal.dto.ProductWithImageDto;

public class myComparatorByName implements Comparator<ProductWithImageDto> {

	@Override
	public int compare(ProductWithImageDto o1, ProductWithImageDto o2) {
		// TODO Auto-generated method stub
		return o1.getProductName().compareTo(o2.getProductName());
	}
	
}
