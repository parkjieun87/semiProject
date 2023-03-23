<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<title>아이디 찾기 페이지</title>
<style>
	img {
	  display: block;
	  margin: auto;
	}
</style>


<div class ="container-800">
<img src = "/static/image/petpal.png" width = "200px" height = "200px" padding="10em">
<form action="find" method="post" align="center" class="mt-10">
	<input type="text" name="memberNick" class="form-input w-50" placeholder="닉네임을 적으세요" required><br><br>
	<input type="tel" name="memberTel" class="form-input w-50"  placeholder="전화번호를 적으세요" required><br><br>
	<button class="form-btn positive w-50">아이디 찾기</button>
</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
