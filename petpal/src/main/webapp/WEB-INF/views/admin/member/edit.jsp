<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<div class="container-500">
	<div class="row center">
		<h1>회원 정보 변경</h1>
	</div>
	<div class="row">
		<form action="edit" method="post" class="edit_form">
			<input type="hidden" name="memberId" value="${memberDto.memberId}">
			<input type="hidden" name="memberRegdate" value="${memberDto.memberRegdate }">
			
			<table class="table center ms-20">
			<colgroup>
				<col style="width: 30%;">
           		<col style="width: 70%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">이름</th>
					<td scope="col">
						<input type="text" name="memberName" value="${memberDto.memberName}">
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="memberNick" value="${memberDto.memberNick}">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="memberTel" value="${memberDto.memberTel}">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="memberEmail" value="${memberDto.memberEmail }">
					</td>
				</tr>
				<tr>
					<th>등급<th>
					<td>
					<c:choose>
						<c:when test="${memberDto.adminCk == 0 }">
							<select name="adminCk" >
								<option value=1>관리자</option>
								<option value=0 selected>일반회원</option>
							</select>
						</c:when>
						
						<c:when test="${memberDto.adminCk == 1 }">
							<select name="adminCk" >
								<option value=1 selected>관리자</option>
								<option value=0>일반회원</option>
							</select>
						</c:when>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="memberPost" value="${memberDto.memberPost }">
						<input type="text" name="memberBasicAddr" value="${memberDto.memberBasicAddr }">
						<input type="text" name="memberDetailAddr" value="${memberDto.memberDetailAddr }">
					</td>
				</tr>
			</tbody>
			</table>
			<div class="row right">
				<button class="edit-btn">수정</button>
				<a class="link" href="list">목록</a>
			</div>
			</form>
		</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>