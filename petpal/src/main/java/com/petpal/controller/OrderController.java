package com.petpal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpal.dao.CartDao;
import com.petpal.dao.MemberDao;
import com.petpal.dao.OrderDao;
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.ProductOrderDto;

@Controller
@RequestMapping("/member")
public class OrderController {
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private MemberDao dao;
	
	//1.주문내역 불러오기
	@GetMapping("/order")
	public String order(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		System.out.println(memberId);
		model.addAttribute("orderDto",orderDao.selectOne(memberId));
		
		
		return "/WEB-INF/views/member/order.jsp";
	}
	
//	@PostMapping("/order")
	


}
