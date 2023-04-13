<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>

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

<title>로그인</title>

<div class ="container-800">
<img src = "${pageContext.request.contextPath}/static/image/petpal.png" width = "200px" height = "200px" padding="10em" class="logo">
<form action="login" method="post" align="center" class="mt-10">
	<input type="text" name="memberId" class="form-input w-50" required placeholder="아이디"><br><br>
	<input type="password" name="memberPw" class="form-input w-50"  required placeholder="비밀번호"><br><br>
	<button class="form-btn positive w-50" style="margin-bottom : 10px;">로그인</button>
	
	<button class= "form-btn neutral w-50" onclick="location.href='find'">아이디가 기억나지 않습니다</button>
	
</form>
</div>
<div class ="row center" >
 </div>
<%-- 
	이 페이지에 접근 가능한 방법은 2가지가 있다.
	1. 일반적 접근 : 메뉴 또는 회원가입 완료 페이지의 링크로 이동
	2. 로그인 실패 시 리다이렉트로 이동
	- 구분을 하기 위해서 2번의 경우 파라미터에 mode=error를 추가했다.
	- 파라미터를 검사해서 로그인 실패인 경우 추가 메세지를 출력
	- JSP에서 파라미터를 직접 읽으려면 ${param, 이름}
	- ${param.mode}는 파라미터 중 mode라는 항목의 값을 불러오라는 의미이다.
	- EL은 equals 대신 ==로 문자열 비교가 가능하다. 
	- EL은 문자열을 쌍따옴표 또는 외따옴표 구분하지 않고 사용
 --%>
 <c:if test="${param.mode == 'error'}">
 	<h3 class="center" style="color:red; font-weight:1100;"> 로그인 정보가 일치하지 않습니다.</h3>
</c:if>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>