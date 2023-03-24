<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
   
	.logo 
	{
	  display: block;
	  margin: auto;
	}

</style>
<title>아이디 찾기 결과</title>

<div class="container-600">
   <div class="row center">
		<img src = "/static/image/petpal.png" width = "300px" height = "300px" padding="10em" class="logo">
   </div>
  
	<div class="row center">	
	<h4>찾으시는 아이디는 ${memberId} 입니다.</h4>
	<a href="login"><button class="form-btn positive w-50">로그인하기</button></a>
	</div>
  </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
