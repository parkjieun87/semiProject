<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<div class="container-600">
	<div class="row center">
		<h1>일회용 비밀번호 설정 완료</h1>
		<h2>${memberPw} 로 변경되었습니다</h2>
		<a class="link" href="${pageContext.request.contextPath}/list">돌아가기</a>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>