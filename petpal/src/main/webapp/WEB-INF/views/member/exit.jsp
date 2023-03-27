<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<title>회원 탈퇴 페이지</title>
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
<form action="exit" method="post">

	<div class="container-800">
	   <div class="row center">
	   <img src = "/static/image/petpal.png" width = "200px" height = "200px" padding="10em" class="logo">
	   
	<h3>탈퇴하려면 비밀번호를 입력해 주세요</h3>
	
	<input class="form-input w-50  type="password" name="memberPw" placeholder = "비밀번호를 적어주세요" required>
		<button class="form-btn w-50 negative">회원 탈퇴</button>
		</div>
		</div>
</form>

<c:if test="${param.mode == 'error'}">
	<h2>비밀번호가 일치하지 않습니다</h2>
</c:if>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>