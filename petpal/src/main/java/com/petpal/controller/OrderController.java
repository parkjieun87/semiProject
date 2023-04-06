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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.petpal.dao.CartDao;
import com.petpal.dao.MemberDao;
import com.petpal.dao.OrderDao;
import com.petpal.dao.ProductDao;
import com.petpal.dao.ProductWithImageDao;
import com.petpal.dto.CartDto;
import com.petpal.dto.CategoryCountDto;
import com.petpal.dto.MemberDto;
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.ProductDto;
import com.petpal.dto.ProductOrderDto;
import com.petpal.dto.ProductWithImageDto;
import com.petpal.vo.PaginationVO;

@Controller
@RequestMapping("/shop")
public class OrderController {
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ProductWithImageDao productWithImageDao;
	
	@Autowired
	private ProductDao productDao;

	
	//주문내역 (cartDao에서 가져옴) , 주문자 이름,이메일 가져오기
	@GetMapping("/order")
	public String order(HttpSession session, Model model) {
		
		String memberId = (String) session.getAttribute("memberId");
		//주문내역 (장바구니에 있는 이름, 이미지,수량,가격 불러오기)
		List<CartDto> cartList= cartDao.getCart(memberId);
		model.addAttribute("cartList",cartList);
		
		//구매자 (MEMBER테이블에 있는 이름,이메일,전화번호 불러오기)
		MemberDto findDto = memberDao.selectOne(memberId);
		model.addAttribute("findDto",findDto);
		

		return "/WEB-INF/views/shop/order.jsp";
	}
	
	//2.주문정보 등록
	@PostMapping("/order")
	public String insert(@ModelAttribute ProductOrderDto productOrderDto,HttpSession session,RedirectAttributes attr) {
		String memberId = (String) session.getAttribute("memberId");
		
		//주문번호(시퀀스) = 주문테이블에서의 주문번호와 주문상세테이블에서의 주문번호는 동일해야한다.(같은 시퀀스부여)-등록할때만 시퀀스!
		
		int orderNo = orderDao.sequence();
		
		//주문정보 등록
		productOrderDto.setMemberId(memberId);
		productOrderDto.setOrderNo(orderNo);
		
		orderDao.insert(productOrderDto);
		System.out.println(productOrderDto);

		
		//주문상세정보 등록(주문번호,아이디는 가져오고, 상품번호,수량,가격은 jsp에서 등록한다.
			
		for(OrderDetailDto orderDetailDto : productOrderDto.orderDetailDto) { //값:리스트
			orderDetailDto.setMemberId(memberId);
			orderDetailDto.setOrderNo(orderNo);
			orderDao.insert2(orderDetailDto);
		}
		
		attr.addAttribute("orderNo",orderNo); //redirect로 보낼때 쓰는 코드(RedirectAttributes),orderFinish로 보냄
		

//		//주문완료 후 상품 수량 수정
		for(OrderDetailDto orderDetailDto : productOrderDto.orderDetailDto) {
			int productCount = orderDetailDto.getProductCount();
			int productNo = orderDetailDto.getProductNo();
			productDao.update(productCount, productNo);
		}

		//주문완료 후 장바구니 상품 삭제
		cartDao.orderCartDelete(memberId);

		return "redirect:orderFinish";
	}
	
	//결제완료페이지에 주문정보 뿌려주기
	@GetMapping("/orderFinish")
	public String orderFinish(Model model,@ModelAttribute ProductOrderDto productOrderDto, @RequestParam int orderNo) { //위에있는orderno를 @RequestParam 어노테이션으로 받아옴
		
		ProductOrderDto dto =  orderDao.select(orderNo);
		model.addAttribute("dto",dto);


		return "/WEB-INF/views/shop/orderFinish.jsp";
	}
	
	
	//header 검색 구현(수정해야함)
	@PostMapping("/searchList")
	public String searchList(Model model,@RequestParam(required = false, defaultValue = "") String column,
			@RequestParam(required = false, defaultValue = "") String keyword, @ModelAttribute("vo") PaginationVO vo) {
		List<ProductWithImageDto> list = productWithImageDao.selectList1(vo, column, keyword);
		
		String parent;
		
			parent = productDao.ParentCate("");
			list = productWithImageDao.selectList("");


		String parentName = productDao.parentName(parent);
		int sum=0;
		List<CategoryCountDto> cateList = productDao.categoryCountList(parent);
		for(int i=0;i<cateList.size();i++) {
			sum+=cateList.get(i).getCategoryCount();
		}
		List<Integer> DisPrice = new ArrayList<>();
		for(int i=0;i<list.size();i++) {
			int disPrice = list.get(i).getProductPrice()*(100-list.get(i).getProductDiscount())/100;
			DisPrice.add(disPrice);
		}
		model.addAttribute("parentName", parentName);
		model.addAttribute("sum", sum);
		model.addAttribute("parent", parent);
		model.addAttribute("list", list);
		model.addAttribute("cateList", cateList);
		model.addAttribute("DisPrice", DisPrice);
		return "/WEB-INF/views/product/list.jsp";
	}
	
	

}
