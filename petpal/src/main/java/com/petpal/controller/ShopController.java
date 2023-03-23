package com.petpal.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpal.dao.ProductDao;
import com.petpal.dto.ProductDto;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired private ProductDao productDao;
	
	@GetMapping("/goods/goods_list")
	public String list(Model model) {
		List<ProductDto> list = productDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/shop/list.jsp";
	}
}
