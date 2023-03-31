<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<title>회원정보 수정 페이지</title>

<style>

     .logo 
   {
     display: block;
     margin: auto;
   }


   .info-window {
   }
   
</style>

   <!-- 다음 우편 API 사용을 위한 CDN -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/js/find-address.min.js"></script>



<article style="display:flex; margin-top:3%; margin-left:10%;">

<section class="flex-box flex-vertical">
            <aside style="border: 4px solid #b1b2ff; border-radius: 15px 15px 15px 15px ">
            
                <!-- 관리 메뉴는 수직으로 배치(List-Group 형태) -->
                <div class="flex-box flex-vertical">
                
                    <div class="p-20">
                        <h3>내 정보 </h3>
                    </div>
                    <div class="p-20"><a href="/member/edit" class="link">개인정보 관리</a></div>
                    <div class="p-20"><a href="/member/shipping" class="link">배송지 관리</a></div>
                    <br>
                    <div class="p-20">
                        <h3>내 활동 </h3>
                    </div>
                    <div class="p-20"><a href="/member/orderPage" class="link">주문 목록</a></div>
                    <div class="p-20"><a href="/cart/add" class="link">장바 구니</a></div>
                </div>
                
            </aside>
            
        </section>
          <img src = "/static/image/petpal.png" width = "200px" height = "200px" padding="10em" class="logo">
          
 </article>
 
 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>