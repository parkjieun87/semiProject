package com.petpal.cart;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.petpal.dao.CartDao;
import com.petpal.dto.CartDto;

@SpringBootTest
public class cartTests {
	
	@Autowired
	private CartDao cartDao;
	
//	@Test
//	public void addCart() {
//		String memberId = "testuser1";
//		int productNo = 2;
//		int count = 2;
//		
//		CartDto cart = new CartDto();
//		cart.setMemberId(memberId);
//		cart.setProductNo(productNo);
//		cart.setProductCount(count);
//		
//		int result = 0;
//		result = cartDao.addCart(cart);
//		
//		System.out.println("결과 : "+result);
//	}
	
//	@Test
//	public void deleteCart() {
//		int cartNo = 21;
//		cartDao.deleteCart(cartNo);
//		
//	}
	
//	@Test
//	public void modifyCartTest() {
//		int cartNo = 23;
//		int count = 10;
//		
//		CartDto cart = new CartDto();
//		cart.setCartNo(cartNo);
//		cart.setProductCount(count);
//		
//		cartDao.modifyCount(cart);
//	}
	
	@Test
	public void getCartTest() {
		String memberId = "testuser1";
		
		List<CartDto> list = cartDao.getCart(memberId);
		for(CartDto cart : list) {
			System.out.println(cart);
			cart.initSaleTotal();
			System.out.println("init cart : "+cart);
		}
	}

}
