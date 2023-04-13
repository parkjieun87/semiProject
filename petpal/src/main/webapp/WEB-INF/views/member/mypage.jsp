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
<script src="${pageContext.request.contextPath}/static/js/find-address.min.js"></script>




	<section class="flex-box flex-vertical"  style="display:flex; margin-top:3%; margin-left:15%; background-image:url('${pageContext.request.contextPath}/static/image/mypage.png'); background-position: center; background-size: 400px; background-repeat:no-repeat">
            <aside style="border: 4px solid #b1b2ff; border-radius: 15px 15px 15px 15px ">
            
                <!-- 관리 메뉴는 수직으로 배치(List-Group 형태) -->
                <div class="flex-box flex-vertical">
                
                    <div class="p-20">
                        <h3>내 정보 </h3>
                    </div>
                    <div class="p-20"><a href="${pageContext.request.contextPath}/member/edit" class="link">개인정보 관리</a></div>
              		 <div class="p-20"><a href="${pageContext.request.contextPath}/member/password" class="link">비밀번호 변경</a></div>
                     <div class="p-20"><a href="${pageContext.request.contextPath}/member/exit" class="link">회원 탈퇴</a></div>
                     <c:if test="${memberDto.adminCk == 1}">
                     	<div class="p-20"><a href="${pageContext.request.contextPath}/admin/" class="link">관리자 페이지</a></div>
                     </c:if>
                    
                    <br>
                    <div class="p-20">
                        <h3>내 활동 </h3>
                    </div>
                    <div class="p-20"><a href="${pageContext.request.contextPath}/member/orderList" class="link">주문목록</a></div>
                    <div class="p-20"><a href="${pageContext.request.contextPath}/cart" class="link">장바구니</a></div>
                    
                </div>
                
            </aside>
                
        </section>
          
 
 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>