package com.petpal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpal.dao.CartDao;
import com.petpal.dto.CartDto;

@Service
public class CartService {
	
	@Autowired
	private CartDao cartDao;
	
	public int addCart(CartDto cart) {
		
		// 장바구니 데이터 체크
		CartDto checkCart = cartDao.checkCart(cart);
		
		// 0 : 등록 실패 / 1: 등록 성공 / 2: 등록된 데이터 존재  / 5:로그인 필요
		if(checkCart != null) {
			return 2;
		}
		
		try {
			return cartDao.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public List<CartDto> getCartList(String memberId){
	
		List<CartDto> cart = cartDao.getCart(memberId);
		System.out.println(cart);
		
		for(CartDto dto : cart) {
			dto.initSaleTotal();
		}
		return cart;
	}

}
