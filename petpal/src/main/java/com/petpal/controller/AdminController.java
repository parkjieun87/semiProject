package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petpal.dao.MemberDao;
import com.petpal.dao.ProductDao;
import com.petpal.dto.ProductDto;
import com.petpal.vo.PaginationVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired MemberDao memberdao;
	
	@Autowired ProductDao productDao;
	
	// 관리자 홈
	@GetMapping("/home")
	public String home() {
		return "/WEB-INF/views/admin/home.jsp";
	}
	
	// 관리자 상품등록 페이지
	@GetMapping("/product/insert")
	public String insert() {
		return "/WEB-INF/views/product/insert.jsp";
	}
	
	@PostMapping("/product/insertProcess")
	public String insert(@ModelAttribute ProductDto productDto) {
		productDao.insert(productDto);
		return "redirect:insertFinish";
	}
	
	// 상품등록 완료 페이지
	@GetMapping("/product/insertFinish")
	public String insertFinish() {
		return "/WEB-INF/views/product/insertFinish.jsp";
	}
	
	// 상품 리스트 페이지
	@GetMapping("/product/list")
	public String productList(Model model, @ModelAttribute("vo") PaginationVO vo) {
		
		int totalProductCnt = productDao.totalProductCnt();
		vo.setCount(totalProductCnt);
		model.addAttribute("productList", productDao.selectList(vo));
		return "/WEB-INF/views/admin/product/list.jsp";
	}
	
	// 상품정보 변경
	@GetMapping("/product/edit")
	public String productEdit(Model model, @RequestParam int productNo) {
		ProductDto productDto = productDao.selectOne(productNo);
		model.addAttribute("productDto", productDto);
		return "WEB-INF/views/product/edit.jsp";
	}
	
	@PostMapping("/product/edit")
	public String productEdit(@ModelAttribute ProductDto productDto, 
										RedirectAttributes attr) {
		// 정보변경
		productDao.changeProductInfo(productDto);
		attr.addAttribute("productNo", productDto.getProductNo());
		return "redirect:";
	}
	
	// 상품 삭제
	@GetMapping("/product/delete")
	public String delete(@RequestParam int productNo) {
		productDao.delete(productNo);
		return "redirect:list";
	}
	
	
	
	
}
