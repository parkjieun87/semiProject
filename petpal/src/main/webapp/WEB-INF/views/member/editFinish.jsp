<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
   
	.logo 
	{
	  display: block;
	  margin: auto;
	}

   .info-window {
   }
   
</style>

<title>회원정보 수정 완료</title>
<div class="container-800">
   <div class="row center">
		<img src = "/static/image/joinFinishDog.png" width = "400px" height = "400px" padding="10em" class="logo">
   </div>
<div class="row center">	
	<h2> 회원 정보 수정 완료</h2>
</div>
<div class="row center">	
	<a href="/"><button class="form-btn positive w-70">홈으로</button></a>
	<a href="mypage"><button class="form-btn neutral w-70">마이 페이지</button></a>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
