package com.petpal.cart;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.petpal.dao.CartDao;
import com.petpal.dto.CartDto;
import com.petpal.service.CartService;

@SpringBootTest
public class cartTests {
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private CartService cartService;
	
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
	
//	@Test
//	public void getCartTest() {
//		String memberId = "testuser1";
//		
//		List<CartDto> list = cartDao.getCart(memberId);
//		for(CartDto cart : list) {
//			System.out.println(cart);
//			cart.initSaleTotal();
//			System.out.println("init cart : "+cart);
//		}
//	}
	
//	@Test
//	public void checkCartTest() {
//		String memberId = "testuser1";
//		int productNo = 2;
//		
//		CartDto cart = new CartDto();
//		cart.setMemberId(memberId);
//		cart.setProductNo(productNo);
//		
//		CartDto resultCart = cartDao.checkCart(cart);
//		System.out.println("결과 : "+resultCart);
//	}
	
	@Test
	public void addCartTest() {
		
		// given
		String memberId = "testuser21121";
		int productNo = 2;
		int count = 11;
		
		CartDto dto = new CartDto();
		dto.setMemberId(memberId);
		dto.setProductNo(productNo);
		dto.setProductCount(count);
		// when
		int result = cartService.addCart(dto);
		// then
		System.out.println("result : "+result);
	}
	

}
