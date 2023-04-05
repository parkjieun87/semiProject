package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.petpal.dao.ProductDao;

@Controller
public class HomeController {
	
	@Autowired
	private ProductDao productDao;
	
	@GetMapping("/")
	public String main(Model model) {
		
		model.addAttribute("list",productDao.mainList());
		model.addAttribute("list2",productDao.mainList2());
		
		return "/WEB-INF/views/home.jsp";
	}

}
