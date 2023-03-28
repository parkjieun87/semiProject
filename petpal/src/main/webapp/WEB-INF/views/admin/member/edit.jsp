<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-800">
<div class="row center">
	<h1>회원 정보 변경</h1>
</div>
<div class="row">
	<form action="edit" method="post">
		<input type="hidden" name="memberId" value="${memberDto.memberId }">
		<table style="margin-left:auto; margin-right:auto;">
			<tbody>
				<tr>
					<th>이름<th>
					<td>
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
					<th>가입일</th>
					<td>
						<input type="date" name="memberRegdate" value="${memberDto.memberRegdate }">
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
				<tr>
					<td colspan="2" align="right">
						<button>수정</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>