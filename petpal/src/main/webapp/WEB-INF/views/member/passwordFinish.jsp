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

<div class="container-800">

   <div class="row center">
<h1>비밀번호 변경 완료</h1>
	</div>
	
   <div class="row center">
		<img src = "${pageContext.request.contextPath}/static/image/joinFinishDog.png" width = "400px" height = "400px" padding="10em" class="logo">
   </div>
<div class="row center">	
	<h2> </h2>
</div>
<div class="row center">	
	<a href="${pageContext.request.contextPath}/"><button class="form-btn positive w-70">홈으로</button></a>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
