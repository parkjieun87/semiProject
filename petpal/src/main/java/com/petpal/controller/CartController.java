package com.petpal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpal.dao.CartDao;
import com.petpal.dao.ProductImageDao;
import com.petpal.dao.ProductWithImageDao;
import com.petpal.dto.CartDto;
import com.petpal.dto.MemberDto;
import com.petpal.dto.ProductImageDto;
import com.petpal.dto.ProductWithImageDto;
import com.petpal.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartDao cartDao;
	
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCart(CartDto cart, HttpServletRequest request) {
		
		// 로그인 체크
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null) {
			return "5";
		}
		
		int result = cartService.addCart(cart);
		
		
		return result + "";
	}

	
	@GetMapping("/cart")
	public String cartPage(Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		
		model.addAttribute("cartInfo", cartService.getCartList(memberId));
		return "/WEB-INF/views/cart/cart.jsp";
	}
	
	// 장바구니 수량 수정
	@ResponseBody
	@PostMapping("/cart/update")
	public void updateCart(CartDto cart) {
		
		cartDao.modifyCount(cart);
		
//		return "redirect:/cart/"+cart.getMemberId();
	}
	
	// 장바구니 삭제
	@PostMapping("/cart/delete")
	public String deleteCart(CartDto cart) {
		
		cartDao.deleteCart(cart.getCartNo());
		
		return "redirect:/cart";
	}
}
