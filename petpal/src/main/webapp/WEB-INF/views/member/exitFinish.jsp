<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<title>회원 탈퇴 완료</title>
<style>

.logo 
	{
	  display: block;
	  margin: auto;
	}

	img {
	  display: block;
	  margin: auto;
	}
</style>
<div class="container-800">
   <div class="row center">
   <img src = "/static/image/goodbye.png" width = "400px" height = "400px" padding="10em" class="logo">
   

	<div class="row">
	<a href="/"><button class="form-btn positive w-30">홈으로</button></a>
	<a href="mypage"><button class="form-btn neutral w-30">마이 페이지</button></a>
	</div>
	
	</div>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>