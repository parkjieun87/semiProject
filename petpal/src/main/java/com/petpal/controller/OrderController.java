package com.petpal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpal.dao.CartDao;
import com.petpal.dao.MemberDao;
import com.petpal.dao.OrderDao;
import com.petpal.dto.CartDto;
import com.petpal.dto.MemberDto;
import com.petpal.dto.ProductOrderDto;

@Controller
@RequestMapping("/member")
public class OrderController {
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private MemberDao memberDao;

	
	//1.주문내역 (cartDao에서 가져옴) , 주문자 이름,이메일 가져오기
	@GetMapping("/order")
	public String order(HttpSession session, Model model,@ModelAttribute ProductOrderDto productOrderDto) {
		String memberId = (String) session.getAttribute("memberId");
		
		//주문내역
		List<CartDto> cartList= cartDao.getCart(memberId);
		model.addAttribute("cartList",cartList);
		
		//주문자 이름,이메일
		MemberDto findDto = memberDao.selectOne(memberId);
		model.addAttribute("findDto",findDto);
		
		return "/WEB-INF/views/member/order.jsp";
	}
	
	//2.주문정보 등록
//	@GetMapping("/order")
//	public String insert() {
//		return "/WEB-INF/views/member/order.jsp";
//	}
	
	@PostMapping("/order")
	public String insert(@ModelAttribute ProductOrderDto productOrderDto,HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
		
		//주문정보 등록
		productOrderDto.setMemberId(memberId);
		orderDao.insert(productOrderDto);
		System.out.println(orderDao);
		
		return "redirect:orderFinish";
	}
	@GetMapping("/orderFinish")
	public String orderFinish() {
		return "/WEB-INF/views/member/orderFinish.jsp";
	}

}
