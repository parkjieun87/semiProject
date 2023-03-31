package com.petpal.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.env.IUpdatableModule.AddReads;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpal.dao.CartDao;
import com.petpal.dao.MemberDao;
import com.petpal.dao.OrderDao;
import com.petpal.dto.CartDto;
import com.petpal.dto.MemberDto;
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.ProductOrderDto;

@Controller
@RequestMapping("/shop")
public class OrderController {
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private MemberDao memberDao;

	
	//주문내역 (cartDao에서 가져옴) , 주문자 이름,이메일 가져오기
	@GetMapping("/order")
	public String order(HttpSession session, Model model,@ModelAttribute ProductOrderDto productOrderDto,@ModelAttribute OrderDetailDto orderDetailDto) {
		String memberId = (String) session.getAttribute("memberId");
		
		//주문내역
		List<CartDto> cartList= cartDao.getCart(memberId);
		model.addAttribute("cartList",cartList);
		
		//주문자 이름,이메일
		MemberDto findDto = memberDao.selectOne(memberId);
		model.addAttribute("findDto",findDto);
		
		//주문상세조회(시퀀스 받아서, 주문상세번호로 조회)
		int orderDetailNo = orderDao.sequence();
		System.out.println(orderDetailNo);
		orderDetailDto.setOrderDetailNo(orderDetailNo);
		OrderDetailDto orderDetailDto1 = orderDao.selectOne(orderDetailNo);
		
		model.addAttribute("orderDetailDto",orderDetailDto1);
		
		//주문정보조회(시퀀스 받아서, 주문번호로 조회)
		int orderNo = orderDao.sequence();
		System.out.println(orderNo);
		productOrderDto.setOrderNo(orderNo);
		ProductOrderDto productOrderDto2 = orderDao.select(orderNo);
		
		model.addAttribute("productOrderDto",productOrderDto2);
		
	
		
		
		return "/WEB-INF/views/shop/order.jsp";
	}
	
	//2.주문정보 등록
	@PostMapping("/order")
	public String insert(@ModelAttribute ProductOrderDto productOrderDto,HttpSession session,@ModelAttribute OrderDetailDto orderDetailDto) {
		String memberId = (String) session.getAttribute("memberId");
		
		//주문정보 등록
		productOrderDto.setMemberId(memberId);
		orderDao.insert(productOrderDto);
		//상세정보 등록
		
		int orderNo = orderDao.sequence();
		orderDetailDto.setOrderNo(orderNo);
	
		orderDao.insert2(orderDetailDto);
		
//		orderDetailDto.setMemberId(memberId);
//		orderDao.insert2(orderDetailDto);
		
		

		return "redirect:orderFinish";
	}
	
	@GetMapping("/orderFinish")
	public String orderFinish() {
		return "/WEB-INF/views/shop/orderFinish.jsp";
	}
	

	
	
	

}
