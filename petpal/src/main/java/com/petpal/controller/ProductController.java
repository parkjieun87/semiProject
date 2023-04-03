package com.petpal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.petpal.dao.ProductDao;
import com.petpal.dao.ProductWithImageDao;
import com.petpal.dto.CategoryCountDto;
//import com.petpal.dao.ProductWithImageDao;
import com.petpal.dto.ProductDto;
//import com.petpal.dto.ProductWithImageDto;
import com.petpal.dto.ProductWithImageDto;
import com.petpal.dto.ReplyDto;
import com.petpal.service.ReplyService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductWithImageDao productWithImageDao;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/product/insert.jsp";
	}
	
	@PostMapping("/insertProcess")
	public String insert(@ModelAttribute ProductDto productDto) {
		productDao.insert(productDto);
		return "redirect:insertFinish";
	}
	
	@GetMapping("/insertFinish")
	public String insertFinish() {
		return "/WEB-INF/views/product/insertFinish.jsp";
	}
	
	@GetMapping("/list")
	public String list(Model model, @RequestParam(required=false, defaultValue="") String categoryCode,
			@RequestParam(required=false, defaultValue="") String parentCode) throws JsonProcessingException {
		String parent;
		List<ProductWithImageDto> list = new ArrayList<>();
		if(parentCode.equals("")) {
			parent = productDao.ParentCate(categoryCode);
			list = productWithImageDao.selectList(categoryCode);
		}else {
			parent = parentCode;
			list = productWithImageDao.selectListFromParent(parent);
		}
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
	
	@GetMapping("/detail")
	public String detail(@RequestParam int productNo, Model model) {
		ProductWithImageDto productWithImageDto = productWithImageDao.selectOne(productNo);
		int disPrice = productWithImageDto.getProductPrice()*(100-productWithImageDto.getProductDiscount())/100;
		model.addAttribute("productDto", productWithImageDto);
		model.addAttribute("disPrice", disPrice);
		
		return "/WEB-INF/views/product/detail.jsp";
		
	}
	
	
	/* 리뷰 쓰기 */
	@GetMapping("/replyEnroll/{memberId}")
	public String replyEnrollWindowGET(@PathVariable("memberId") String memberId, int productNo, Model model) {
		ProductDto dto = productDao.getProduct(productNo);
		model.addAttribute("productInfo",dto);
		model.addAttribute("memberId",memberId);
		return "/WEB-INF/views/product/replyEnroll.jsp";
		
	}
	
	
	
	
	
}
