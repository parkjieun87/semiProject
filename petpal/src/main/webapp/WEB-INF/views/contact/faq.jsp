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
                        <li><a href="">주문/결제/배송</a></li>
                    </div>
                    <div class="search btn">
                        <li><a href="">회원가입/정보</a></li>
                    </div>
                    <div class="search btn">
                        <li><a href="">기타</a></li>
                    </div>
                </ul>
            </div>

    
     
            <div class="ans-list">
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
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
                                혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.
                                따라서 혼합 구성 내 내품 변경을 불가합니다.
                                특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나, 골라담기 상품으로 구매 부탁드립니다.
                                </p>
                            </div>
                        </div>
                    </li>   
                </ul>
                
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
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
                                혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.
                                따라서 혼합 구성 내 내품 변경을 불가합니다.
                                특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나, 골라담기 상품으로 구매 부탁드립니다.
                                </p>
                            </div>
                        </div>
                    </li>   
                </ul>
               
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
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
                                혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.
                                따라서 혼합 구성 내 내품 변경을 불가합니다.
                                특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나, 골라담기 상품으로 구매 부탁드립니다.
                                </p>
                            </div>
                        </div>
                    </li>   
                </ul>
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
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
                                혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.
                                따라서 혼합 구성 내 내품 변경을 불가합니다.
                                특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나, 골라담기 상품으로 구매 부탁드립니다.
                                </p>
                            </div>
                        </div>
                    </li>   
                </ul>
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
                            </div>
                            <div class="right">
                                <i class="fa-solid fa-chevron-down">
                                    <span class="blind">내용보기</span>
                                </i>
                            </div>
                        </a>
                    </li>   
                </ul>
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
                            </div>
                            <div class="right">
                                <i class="fa-solid fa-chevron-down">
                                    <span class="blind">내용보기</span>
                                </i>
                            </div>
                        </a>
                    </li>   
                </ul>
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
                            </div>
                            <div class="right">
                                <i class="fa-solid fa-chevron-down">
                                    <span class="blind">내용보기</span>
                                </i>
                            </div>
                        </a>
                    </li>   
                </ul>
                <ul class="ans-list-ul">
                    <li>
                        <a href="" class="title-div">
                            <div class="subject">
                                <span class="category">기타</span>
                                <span class="classify">Q</span>
                                <p class="txt">언제부터 멤버십이 변경되나요?</p>
                            </div>
                            <div class="right">
                                <i class="fa-solid fa-chevron-down">
                                    <span class="blind">내용보기</span>
                                </i>
                            </div>
                        </a>
                       
                    </li>   
                </ul>
            </div> 

            
    </div>
   
    <%@include file="../template/footer.jsp" %>   
            
    
