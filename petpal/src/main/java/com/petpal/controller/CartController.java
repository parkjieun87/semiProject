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

import com.petpal.dto.CartDto;
import com.petpal.dto.MemberDto;
import com.petpal.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
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

	
	@GetMapping("/cart/{memberId}")
	public String cartPage(@PathVariable("memberId") String memberId, Model model) {
		
		model.addAttribute("cartInfo", cartService.getCartList(memberId));
		
		return "/WEB-INF/views/cart/cart.jsp";
	}
}
