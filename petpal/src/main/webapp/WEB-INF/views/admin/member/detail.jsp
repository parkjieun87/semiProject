<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<script>
	$(function(){
		$(".del-btn").click(function(e){
			e.preventDefault();
			
			var choice = confirm("삭제하시겠습니까?");

			if(choice == false) return;
			
			var memberId = $(this).data("memberid");
			
			$(".delete_memberId").val(memberId);
			$(".delete_form").submit();
		});
	});
</script>

<div class="container-600">
	<!-- 삭제 form -->
    <form action="delete" method="post" class="delete_form">
       <input type="hidden" name="memberId" class="delete_memberId">
    </form> 
       
	<div class="row center">
		<h2>회원 상세정보</h2>
	</div>
    
	<div class="row center">
		<table class="table center ms-20">
			<colgroup>
				<col style="width: 20%;">
           		<col style="width: 20%;">
           		<col style="width: 30%;">
           		<col style="width: 30%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">아이디</th>
					<td scope="col" colspan=3>${memberDto.memberId}</td>			
				</tr>
				<tr>
					<th>이름</th>
					<td colspan=3>${memberDto.memberName}</td>				
				</tr>
				<tr>
					<th>닉네임</th>
					<td colspan=3>${memberDto.memberNick}</td>				
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan=3>${memberDto.memberTel}</td>				
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan=3>${memberDto.memberEmail }</td>				
				</tr>
				<tr>
					<th>등급</th>
					<td colspan=3>
						<c:if test="${memberDto.adminCk == 1}"> 관리자 </c:if>
                  		<c:if test="${memberDto.adminCk == 0}"> 일반회원</c:if>				
					</td>				
				</tr>
				<tr>
					<th>가입일</th>
					<td colspan=3>
						<fmt:formatDate value="${memberDto.memberRegdate}"
										pattern="y년 M월 d일 E a h시 m분 s초"/> 
					</td>				
				</tr>
				<tr>
					<th >주소</th>
					<td>[${memberDto.memberPost}]</td>		
					<td scope="col">${memberDto.memberBasicAddr}</td>
					<td scope="col">${memberDto.memberDetailAddr}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row right">
		<!-- 회원 관리 메뉴 -->
		<a class="link" href="${pageContext.request.contextPath}/admin/member/edit?memberId=${memberDto.memberId}">개인정보 변경</a>
		<a class="link del-btn" data-memberid="${memberDto.memberId}">탈퇴</a>
		<a class="link" href="${pageContext.request.contextPath}/admin/member/list">목록</a>
	</div>

</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>