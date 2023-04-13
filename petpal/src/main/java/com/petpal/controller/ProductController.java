package com.petpal.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.petpal.dao.ReplyDao;
import com.petpal.dto.CategoryCountDto;
import com.petpal.dto.CategoryDto;
//import com.petpal.dao.ProductWithImageDao;
import com.petpal.dto.ProductDto;
//import com.petpal.dto.ProductWithImageDto;
import com.petpal.dto.ProductWithImageDto;
import com.petpal.vo.PaginationVO;

import edu.emory.mathcs.backport.java.util.Collections;
import edu.emory.mathcs.backport.java.util.LinkedList;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductWithImageDao productWithImageDao;

	@Autowired
	private ReplyDao replyDao;

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
	public String list(Model model, @RequestParam(required = false, defaultValue = "") String categoryCode,
			@RequestParam(required = false, defaultValue = "") String parentCode, @ModelAttribute("vo") PaginationVO vo,
			@RequestParam(required = false, defaultValue = "") String sort,
			@RequestParam(required = false, defaultValue = "") String search_word) throws JsonProcessingException {

		List<ProductWithImageDto> list = new ArrayList<>();
		List<ProductWithImageDto> list2 = new ArrayList<>();
		ObjectMapper objm = new ObjectMapper();
		String categoryList;
		String parent;
		String parentName;
		int totalProductCnt;
		int sum = 0;
		// 검색,카테고리,부모카테고리 번호에 따라 리스트 생성
		if (!search_word.equals("")) {
			model.addAttribute("search", true);
			parentName = search_word;
			parent = null;
			List<CategoryDto> productCateList = productDao.categoryList();
			list = productWithImageDao.selectListBySearch(search_word);

			Set<CategoryCountDto> cateSet = new HashSet<>();
			for (int i = 0; i < list.size(); i++) {
				CategoryCountDto dto = new CategoryCountDto();
				dto.setCategoryCode(list.get(i).getCategoryCode());
				for (int k = 0; k < productCateList.size(); k++) {
					if (dto.getCategoryCode().equals(productCateList.get(k).getCategoryCode())) {
						dto.setCategoryName(productCateList.get(k).getCategoryName());
					}
				}
				cateSet.add(dto);
			}
			
			List<CategoryCountDto> cateList = new ArrayList<>(cateSet);
			for (int i = 0; i < list.size(); i++) {
				for (int k = 0; k < cateList.size(); k++) {
					if (list.get(i).getCategoryCode().equals(cateList.get(k).getCategoryCode())) {
						cateList.get(k).setCategoryCount(cateList.get(k).getCategoryCount() + 1);
						sum++;
					}
				}
			}
			categoryList = objm.writeValueAsString(cateList);
			model.addAttribute("cateList", cateList);
			if(!parentCode.equals("")) {
				list = productWithImageDao.selectListBySearchAndP(search_word, parentCode);
			}else if(!categoryCode.equals("")) {
				list = productWithImageDao.selectListBySearchAndC(search_word, categoryCode);
			}
			totalProductCnt = list.size();
		    vo.setCount(totalProductCnt);
		} else {
			model.addAttribute("search", false);
			if (parentCode.equals("")) {
				parent = productDao.ParentCate(categoryCode);
				list = productWithImageDao.selectList(categoryCode);
			}else {
				parent = parentCode;
				list = productWithImageDao.selectListFromParent(parentCode);
			}
			totalProductCnt = list.size();
		    vo.setCount(totalProductCnt);
			parentName = productDao.parentName(parent);
			List<CategoryCountDto> cateList = productDao.categoryCountList(parent);
			for (int i = 0; i < cateList.size(); i++) {
				sum += cateList.get(i).getCategoryCount();
			}
			categoryList = objm.writeValueAsString(cateList);
			model.addAttribute("cateList", cateList);
		}

		// sort가 존재한다면 list를 정렬
		if (sort.equals("viewName"))
			Collections.sort(list, new myComparatorByName());
		else if (sort.equals("regdate"))
			Collections.sort(list, new myComparatorByRegdate());
		else if (sort.equals("price_low"))
			Collections.sort(list, new myComparatorByPriceAsc());
		else if (sort.equals("price_high"))
			Collections.sort(list, new myComparatorByPriceDesc());

		// 페이지네이션

		if (vo.getPage() == vo.getTotalPage()) {
			for (int i = vo.getBegin() - 1; i < list.size(); i++) {
				list2.add(list.get(i));
			}
		} else {
			for (int i = vo.getBegin() - 1; i < vo.getEnd(); i++) {
				list2.add(list.get(i));
			}
		}

		// 할인된 가격
		List<Integer> DisPrice = new ArrayList<>();
		for (int i = 0; i < list2.size(); i++) {
			int disPrice = list2.get(i).getProductPrice() * (100 - list2.get(i).getProductDiscount()) / 100;
			DisPrice.add(disPrice);
		}

		// 목록화

		model.addAttribute("parentName", parentName);
		model.addAttribute("sum", sum);
		model.addAttribute("parent", parent);
		model.addAttribute("cateList2", categoryList);
		model.addAttribute("sort", sort);
		model.addAttribute("list", list2);
		model.addAttribute("DisPrice", DisPrice);
		model.addAttribute("mode2", true);
		return "/WEB-INF/views/product/list.jsp";
	}

	@GetMapping("/detail")
	public String detail(@RequestParam int productNo, Model model) {
		ProductWithImageDto productWithImageDto = productWithImageDao.selectOne(productNo);
		int disPrice = productWithImageDto.getProductPrice() * (100 - productWithImageDto.getProductDiscount()) / 100;

		model.addAttribute("productDto", productWithImageDto);
		model.addAttribute("disPrice", disPrice);
		model.addAttribute("replyList", replyDao.replyList(productNo));

		return "/WEB-INF/views/product/detail.jsp";

	}

}
