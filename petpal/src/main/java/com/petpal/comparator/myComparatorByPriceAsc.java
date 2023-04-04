package com.petpal.comparator;

import java.util.Comparator;

import com.petpal.dto.ProductWithImageDto;

public class myComparatorByPriceAsc implements Comparator<ProductWithImageDto> {

	@Override
	public int compare(ProductWithImageDto o1, ProductWithImageDto o2) {
		// TODO Auto-generated method stub
		return o1.getProductPrice()*(100-o1.getProductDiscount())/100 - o2.getProductPrice()*(100-o2.getProductDiscount())/100;
	}
	
}
