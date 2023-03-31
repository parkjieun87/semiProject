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

	
	//주문내역 (cartDao에서 가져옴) , 주문자 이름,이메일 가져오기
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
	@PostMapping("/order")
	public String insert(@ModelAttribute ProductOrderDto productOrderDto,HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
		
		//주문정보 등록
		productOrderDto.setMemberId(memberId);
		orderDao.insert(productOrderDto);

		return "redirect:orderFinish";
	}
	
	@GetMapping("/orderFinish")
	public String orderFinish() {
		return "/WEB-INF/views/member/orderFinish.jsp";
	}
	
	//카카오페이연동
//	@RequestMapping("/kakaopay.cls")
//	@ResponseBody
//	public String kakaopay() {
//		try {
//			URL addr = new URL("https://kapi.kakao.com/v1/payment/ready HTTP/1.1");
//			HttpURLConnection link = (HttpURLConnection) addr.openConnection();
//			link.setRequestMethod("post");
//			link.setRequestProperty("Authorization", "KakaoAK 9cfebf6e8a6fe8160ae2a79538566c66");
//			link.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//			link.setDoOutput(true);
//			
//			String test1 = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:8080/success&fail_url=http://localhost:8080/fail&cancel_url=http://localhost:8080/cancel";
//			OutputStream give1 = link.getOutputStream();
//			DataOutputStream dataGive = new DataOutputStream(give1);
//			dataGive.writeBytes(test1);
//			dataGive.close();
//			
//			int result = link.getResponseCode();
//			
//			InputStream get1;
//			if(result==200) {
//				get1=link.getInputStream();
//			}else {
//				get1=link.getErrorStream();
//			}
//			
//			InputStreamReader read1 = new InputStreamReader(get1);
//			
//			BufferedReader change1 = new BufferedReader(read1);
//			
//			return change1.readLine();
//			
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return "{\"result\":\"NO\"}";
//	}
	

}
