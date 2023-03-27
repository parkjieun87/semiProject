<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/contact/faq.css">
 <style>
 .page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('/static/image/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('/static/image/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('/static/image/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('/static/image/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
 	
 </style> 
    
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
          $(".title-div").eq(5).click(function(e){
              e.preventDefault();
              $(".ui-accordion-view").eq(5).toggle(10);
            });
          $(".title-div").eq(6).click(function(e){
              e.preventDefault();
              $(".ui-accordion-view").eq(6).toggle(10);
            });
          $(".title-div").eq(7).click(function(e){
              e.preventDefault();
              $(".ui-accordion-view").eq(7).toggle(10);
            });
          $(".title-div").eq(8).click(function(e){
              e.preventDefault();
              $(".ui-accordion-view").eq(8).toggle(10);
            });
          $(".title-div").eq(9).click(function(e){
              e.preventDefault();
              $(".ui-accordion-view").eq(9).toggle(10);
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
       		<form action="/contact/notice/faqAll" method="get">	
       		<input type="hidden" name="column" value="${vo.getColumn()}">
            <div class="top_search">
                <input type="search" class="input_search" name="keyword" placeholder="검색어를 입력하세요.">
                <button type="button" class="btn_top_search" id="btnTopSearch"><i class="fas fa-search fa-lg"></i></button>   
            </div>
            </form>
            <div>
            
                <ul class="ul">
               
                    <div class="search btn">
                        <li><a href="/contact/notice/faqAll">전체보기</a></li>
                    </div>
                    <div class="search btn">
                        <li><a href="/contact/notice/faq?faqCategory=2">주문/결제/배송</a></li>
                    </div>
                    
                    <div class="search btn">
                        <li><a href="/contact/notice/faq?faqCategory=1">회원가입/정보</a></li>
                    </div>
                    <div class="search btn">
                        <li><a href="/contact/notice/faq?faqCategory=3">기타</a></li>
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
            
       	<c:if test="${flag != null}">
            	<!-- 페이징 영역 -->
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="/contact/notice/faqAll?page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="/contact/notice/faqAll?page=${i}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="/contact/notice/faqAll?page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div> 
	</c:if>
            
    </div>
   
    <%@include file="../template/footer.jsp" %>   
            
    
