<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  
    
    <script type="text/javascript">
        $(function(){
          $(".title-div").eq(0).click(function(e){
            e.preventDefault();
            $(".ui-accordion-view").eq(0).toggle(10);
          });

          $(".title-div").eq(1).click(function(e){
            e.preventDefault();
            $(".ui-accordion-view").eq(1).toggle(10);
          });

          $(".title-div").eq(2).click(function(e){
            e.preventDefault();
            $(".ui-accordion-view").eq(2).toggle(10);
          });

          $(".title-div").eq(3).click(function(e){
            e.preventDefault();
            $(".ui-accordion-view").eq(3).toggle(10);
          });

          $(".title-div").eq(4).click(function(e){
            e.preventDefault();
            $(".ui-accordion-view").eq(4).toggle(10);
          });
        });
    </script>
    <style>
    	.header_search{
    		margin : 0 auto;
    		
    	}
    </style>

<%@ include file="../template/header.jsp"%>
   <br>
    <div class="row center title" style="margin-top:30px;">
            <h3>자주묻는 FAQ</h3>
       </div>
       <div class="header_search">			
            <div class="top_search">
                <input type="search" class="input_search" name="keyword" placeholder="검색어를 입력하세요.">
                <button type="button" class="btn_top_search" id="btnTopSearch"><i class="fas fa-search fa-lg"></i></button>   
            </div>
            <div>
                <ul class="ul">
               
                    <div class="search btn">
                        <li><a href="">전체보기</a></li>
                    </div>
                    <div class="search btn">
                        <li><a href="/contact/notice/faq?faqCategory=2">주문/결제/배송</a></li>
                    </div>
                    
                    <div class="search btn">
                        <li><a href="/contact/notice/faq?faqCategory=1">회원가입/정보</a></li>
                    </div>
                    <div class="search btn">
                        <li><a href="">기타</a></li>
                    </div>
                </ul>
            </div>

    
     
            <div class="ans-list">
            	<c:forEach items="${pageInfo}" var="list">
            		<ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">${list.faqCategoryName}</span>
                                <span class="classify">Q</span>
                                <p class="txt">${list.faqTitle}</p>
                            </div>
                            <div class="right">
                                <i class="fa-solid fa-chevron-down">
                                    <span class="blind">내용보기</span>
                                </i>
                            </div>
                        </a>
                        <div class="ui-accordion-view">
                            <div class="answer">
                               
                                <p class="txt type2">
                                ${list.faqAnswer}
                                </p>
                            </div>
                        </div>
                    </li>   
                </ul>
            	</c:forEach>
                
                
               
            </div> 

            
    </div>
   
    <%@include file="../template/footer.jsp" %>   
            
    
