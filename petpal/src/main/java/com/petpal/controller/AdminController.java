package com.petpal.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petpal.configuration.CustomFileuploadProperties;
import com.petpal.dao.AdminOrderDao;
import com.petpal.dao.MemberDao;
import com.petpal.dao.ProductAttachmentDao;
import com.petpal.dao.ProductDao;
import com.petpal.dao.ProductImageDao;
import com.petpal.dao.SalesDao;
import com.petpal.dto.AttachmentDto;
import com.petpal.dto.CategoryDto;
import com.petpal.dto.MemberDto;
import com.petpal.dto.ProductDto;
import com.petpal.dto.ProductImageDto;
import com.petpal.vo.PaginationVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
   
   @Autowired private MemberDao memberDao;
   
   @Autowired private ProductDao productDao;
   
   @Autowired private ProductAttachmentDao productAttachmentDao;
   
   @Autowired private CustomFileuploadProperties fileuploadProperties;
   
   @Autowired private ProductImageDao productImageDao;
   
   @Autowired private SalesDao salesDao;
   
   @Autowired private AdminOrderDao adminOrderDao;
   
   
   
   private File dir;
   @PostConstruct
   public void init() {
      dir = new File(fileuploadProperties.getPath());
   }
   
   // 관리자 홈
   @GetMapping("/home")
   public String home() {
      return "/WEB-INF/views/admin/home.jsp";
   }
   
   // 관리자 상품등록 페이지
   @GetMapping("/product/insert")
   public String insert(Model model) throws Exception{
      ObjectMapper objm = new ObjectMapper();
      
      // 카테고리 리스트
      List<CategoryDto> list = productDao.categoryList();
      
      // 자바 객체를 String 타입의 JSON 형식 데이터로 변환
      String categoryList = objm.writeValueAsString(list);
      model.addAttribute("cateList",categoryList);
      
      return "/WEB-INF/views/admin/product/insert.jsp";
   }
   
   @PostMapping("/product/insertProcess")
   public String insert(@ModelAttribute ProductDto productDto,
         @RequestParam MultipartFile attach) throws IllegalStateException, IOException {
      productDto.setProductNo(productDao.sequence());
      productDao.insert(productDto);
      if(!attach.isEmpty()) {
         int attachmentNo = productAttachmentDao.sequence();   
         File target = new File(dir, String.valueOf(attachmentNo));
         attach.transferTo(target);
         
         productAttachmentDao.insert(AttachmentDto.builder()
                                 .attachmentNo(attachmentNo)
                                 .attachmentName(attach.getOriginalFilename())
                                 .attachmentType(attach.getContentType())
                                 .attachmentSize(attach.getSize())
                                 .build()
               );
         
         productImageDao.insert(ProductImageDto.builder()
                                 .productNo(productDto.getProductNo())
                                 .attachmentNo(attachmentNo)
                                 .build()
               );
      }
      return "redirect:insertFinish";
   }
   
   // 상품등록 완료 페이지
   @GetMapping("/product/insertFinish")
   public String insertFinish() {
      return "/WEB-INF/views/admin/product/insertFinish.jsp";
   }
   
   // 상품 리스트 페이지
   @GetMapping("/product/list")
   public String productList(Model model, @ModelAttribute("vo") PaginationVO vo) {
      
      int totalProductCnt = productDao.totalProductCnt();
      vo.setCount(totalProductCnt);
      model.addAttribute("productList", productDao.selectList(vo));
      return "/WEB-INF/views/admin/product/list.jsp";
   }
   
   // 상품 상세
   @GetMapping("/product/detail")
   public String productDetail(Model model, 
                     @RequestParam int productNo) {
      return "/WEB-INF/views/admin/product/detail.jsp";
   }
   
   // 상품정보 변경
   @GetMapping("/product/edit")
   public String productEdit(Model model, @RequestParam int productNo) {
      ProductDto productDto = productDao.selectOne(productNo);
      model.addAttribute("productDto", productDto);
      return "/WEB-INF/views/admin/product/edit.jsp";
   }
   
   @PostMapping("/product/edit")
   public String productEdit(@ModelAttribute ProductDto productDto, 
                              RedirectAttributes attr) {
      // 정보변경
      productDao.changeProductInfo(productDto);
      attr.addAttribute("productNo", productDto.getProductNo());
      return "redirect:list";
   }
   
   // 상품 삭제
   @GetMapping("/product/delete")
   public String delete(@RequestParam int productNo) {
      productDao.delete(productNo);
      return "redirect:list";
   }
   
   // 회원 리스트 페이지
   @GetMapping("/member/list")
   public String memberList(Model model, @ModelAttribute("vo") PaginationVO vo) {
      int totalMemberCnt = memberDao.selectCount();
      vo.setCount(totalMemberCnt);
      model.addAttribute("memberList", memberDao.selectList(vo));
      return "/WEB-INF/views/admin/member/list.jsp";
   }
   
   // 회원정보 상세
   @GetMapping("/member/detail")
   public String memberDetail(Model model,
                  @RequestParam String memberId) {
      model.addAttribute("memberDto", memberDao.selectOne(memberId));
      return "/WEB-INF/views/admin/member/detail.jsp";
   }
   
   // 회원정보 업데이트
   @GetMapping("/member/edit")
   public String memberEdit(Model model, @RequestParam String memberId) {
      MemberDto memberDto = memberDao.selectOne(memberId);
      model.addAttribute("memberDto", memberDto);
      return "/WEB-INF/views/admin/member/edit.jsp";
   }
   @PostMapping("/member/edit")
   public String memberEdit(@ModelAttribute MemberDto memberDto, 
                           RedirectAttributes attr) {
      memberDao.changeInformationByAdmin(memberDto);
      attr.addAttribute("memberId", memberDto.getMemberId());
      return "redirect:detail";
   }
   // 회원 강제 탈퇴 후 waiting 테이블에 추가
   @GetMapping("/member/delete")
   public String memberExit(
         @RequestParam String memberId,
         @RequestParam(required = false, defaultValue = "1") int page,
         RedirectAttributes attr) {
      MemberDto memberDto = memberDao.selectOne(memberId);
      memberDao.delete(memberId);
      memberDao.insertWaiting(memberDto);
      
      attr.addAttribute("page", page);
      return "redirect:list";
   }
//   // 일회용 비밀번호 설정
//   @GetMapping("/member/password")
//   public String memberPassword(@RequestParam String memberId, HttpSession session) {
//      String memberPw = randomComponent.generateString(10);
//      memberDao.changePassword(memberId, memberPw);
//      session.setAttribute("memberPw", memberPw);
//      return "redirect:passwordFinish";
//   }
//   
   @GetMapping("/member/passwordFinish")
   public String passwordFinish(HttpSession session, Model model) {
      String memberPw = (String)session.getAttribute("memberPw");
      session.removeAttribute("memberPw");
      model.addAttribute("memberPw", memberPw);
      return "/WEB-INF/views/admin/member/password.jsp";
   }
   
   // 매출 목록
   @GetMapping("/sales/list")
   public String Salse(Model model, @ModelAttribute("vo") PaginationVO vo,
	   @RequestParam(required=false, defaultValue=" order_date desc") String sort) {
      int totalSalesCnt = salesDao.selectCount();
      vo.setCount(totalSalesCnt);
      
      model.addAttribute("salesDto", salesDao.selectList(vo, sort));
      model.addAttribute("monthly", salesDao.selectMonthlyList());
      model.addAttribute("daily", salesDao.selectDailyList());
      
      return "/WEB-INF/views/admin/sales/list.jsp";
   }
   
   // 주문 목록
   @GetMapping("/order/list")
   public String Order(Model model, @ModelAttribute("vo") PaginationVO vo,
	   @RequestParam(required=false, defaultValue="  order_date desc") String sort) {
      int totalOrderCnt = adminOrderDao.selectCount();
      vo.setCount(totalOrderCnt);
      
      model.addAttribute("orderDto", adminOrderDao.selectList(vo, sort));
      
      return "/WEB-INF/views/admin/order/list.jsp";
   }
   
   
   
}
