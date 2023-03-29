package com.petpal.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpal.dao.ProductDao;
//import com.petpal.dao.ProductWithImageDao;
//import com.petpal.dto.ProductWithImageDto;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired private ProductDao productDao;
//	@Autowired private ProductWithImageDao productWithImageDao;
	
	@GetMapping("")
	@ResponseBody
	public String hello() {
		return "aa";
	}
	
//	@GetMapping("/goods/goods_list")
//	public String list(Model model, @RequestParam(required=false, defaultValue="") String categoryCode) {
//		List<ProductWithImageDto> list = productWithImageDao.selectList(categoryCode);
//		model.addAttribute("list", list);
//		return "/WEB-INF/views/shop/list.jsp";
//	}
	

}
