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
import com.fasterxml.jackson.databind.ObjectMapper;
import com.petpal.comparator.myComparatorByName;
import com.petpal.comparator.myComparatorByPriceAsc;
import com.petpal.comparator.myComparatorByPriceDesc;
import com.petpal.comparator.myComparatorByRegdate;
import com.petpal.dao.MemberDao;
import com.petpal.dao.ProductDao;
import com.petpal.dao.ProductWithImageDao;
import com.petpal.dto.CategoryCountDto;
import com.petpal.dto.OrderListDto;
//import com.petpal.dao.ProductWithImageDao;
import com.petpal.dto.ProductDto;
//import com.petpal.dto.ProductWithImageDto;
import com.petpal.dto.ProductWithImageDto;
import com.petpal.dto.ReplyDto;
import com.petpal.service.ReplyService;
import com.petpal.vo.PaginationVO;

import edu.emory.mathcs.backport.java.util.Collections;


@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductWithImageDao productWithImageDao;
	

	
	@Autowired
	private MemberDao memberDao;
	
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
			@RequestParam(required=false, defaultValue="") String parentCode, @ModelAttribute("vo") PaginationVO vo,
			@RequestParam(required=false, defaultValue="") String sort) throws JsonProcessingException {
		String parent;
		int totalProductCnt;
		List<ProductWithImageDto> list = new ArrayList<>();
		List<ProductWithImageDto> list2 = new ArrayList<>();
		if(parentCode.equals("")) {
			parent = productDao.ParentCate(categoryCode);
			list = productWithImageDao.selectList(categoryCode);
			if(sort.equals("viewName")) Collections.sort(list, new myComparatorByName());
			else if(sort.equals("regdate")) Collections.sort(list, new myComparatorByRegdate());
			else if(sort.equals("price_low")) Collections.sort(list, new myComparatorByPriceAsc());
			else if(sort.equals("price_high")) Collections.sort(list, new myComparatorByPriceDesc());
			totalProductCnt = list.size();
		    vo.setCount(totalProductCnt);
			 if(vo.getPage() == vo.getTotalPage()) {
			    	for(int i=vo.getBegin()-1;i<list.size();i++) {
			    		list2.add(list.get(i));
			    	}
			    }else {
			    	for(int i=vo.getBegin()-1;i<vo.getEnd();i++) {
				    	list2.add(list.get(i));
				    }	
			    }
			model.addAttribute("mode", true);
		}else {
			parent = parentCode;
			list = productWithImageDao.selectListFromParent(parent);
			if(sort.equals("viewName")) Collections.sort(list, new myComparatorByName());
			else if(sort.equals("regdate")) Collections.sort(list, new myComparatorByRegdate());
			else if(sort.equals("price_low")) Collections.sort(list, new myComparatorByPriceAsc());
			else if(sort.equals("price_high")) Collections.sort(list, new myComparatorByPriceDesc());
			totalProductCnt = list.size();
		    vo.setCount(totalProductCnt);
		    if(vo.getPage() == vo.getTotalPage()) {
		    	for(int i=vo.getBegin()-1;i<list.size();i++) {
		    		list2.add(list.get(i));
		    	}
		    }else {
		    	for(int i=vo.getBegin()-1;i<vo.getEnd();i++) {
			    	list2.add(list.get(i));
			    }	
		    }
			model.addAttribute("mode", false);
		}
		
		
		
		String parentName = productDao.parentName(parent);
		int sum=0;
		List<CategoryCountDto> cateList = productDao.categoryCountList(parent);
		ObjectMapper objm = new ObjectMapper();
		String categoryList = objm.writeValueAsString(cateList);
		for(int i=0;i<cateList.size();i++) {
			sum+=cateList.get(i).getCategoryCount();
		}
		List<Integer> DisPrice = new ArrayList<>();
		for(int i=0;i<list2.size();i++) {
			int disPrice = list2.get(i).getProductPrice()*(100-list2.get(i).getProductDiscount())/100;
			DisPrice.add(disPrice);
		}
	
	
	    model.addAttribute("sort", sort);
		model.addAttribute("parentName", parentName);
		model.addAttribute("sum", sum);
		model.addAttribute("parent", parent);
		model.addAttribute("list", list2);
		model.addAttribute("cateList", cateList);
		model.addAttribute("cateList2",categoryList);
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
	
	

	
	
	
	
	
}
