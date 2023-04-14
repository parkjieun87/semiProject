<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
	
    <script>
	$(function(){
		$(".del-btn").click(function(e){
			e.preventDefault();
			
			var choice = confirm("삭제하시겠습니까?");

			if(choice == false) return;
			
			var pageNo = $(this).data("page");
			var memberId = $(this).data("memberid");
			
			$(".delete_memberId").val(memberId);
			$(".delete_page").val(pageNo);
			$(".delete_form").submit();
		});
	});
</script>
		
		<div class="container-1200" style="margin-left: 200px;">
		<!-- 삭제 form -->
       <form action="delete" method="post" class="delete_form">
          <input type="hidden" name="memberId" class="delete_memberId">
          <input type="hidden" name="page" class="delete_page">
       </form>  
       
       <!-- 정렬  -->
	   	<div class="row ms-10">
			<a class="link" href="${pageContext.request.contextPath}/list?">최신 가입일순</a>
			<a class="link" href="${pageContext.request.contextPath}/list?sort=member_regdate asc">오래된순</a>
		</div>
       
    	<!-- 상품 목록 테이블 -->
        <div class="row">
            <table class="table table-slit">
            	<colgroup>
            		<col style="width: 7%;">
            		<col style="width: 7%;">
            		<col style="width: 7%;">
            		<col style="width: 5%;">
            		<col style="width: 7%;">
            	</colgroup>
            	
                <thead>
                    <tr>
                        <th scope="col">아이디</th>
                        <th scope="col">이름</th>
                        <th scope="col">가입일</th>
                        <th scope="col">등급</th>
                        <th scope="col">관리</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${memberList}" var="list">
	                    <tr class="center">
	                        <td>${list.memberId}</td>
	                        <td>${list.memberName}</td>
	                        <td>${list.memberRegdate}</td>
	                       	<td>
	                       		<c:if test="${list.adminCk == 1 }"> 관리자 </c:if>
                  				<c:if test="${list.adminCk == 0 }"> 일반회원 </c:if>
	                       	</td>
	                        <td>
	                        	<a class="link" href="${pageContext.request.contextPath}/detail?memberId=${list.memberId}">상세</a>
	                        	<a class="link" href="${pageContext.request.contextPath}/edit?memberId=${list.memberId}">수정</a>
	                        	<a class="link del-btn" data-memberid="${list.memberId}" data-page="${vo.page}">탈퇴</a>
	                        </td>
	                    </tr>
                		
                	</c:forEach>
                </tbody>
            </table>
        </div>
        
        <!-- 검색창  -->
        <div class="row right">
			<form action="list" method="get" class="search-form">
				<select name="column" class="form-input">
					<option value="member_id">아이디</option>
					<option value="member_name">이름</option>
					<option value="adminCk">회원등급</option>
				</select>
				<input type="search" name="keyword" placeholder="검색어" value="${keyword}" class="form-input">
				<button class="form-btn neutral">검색</button>
			</form>        
        </div>
        
        <!-- 페이징 영역 -->
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="${pageContext.request.contextPath}/list?page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="${pageContext.request.contextPath}/list?page=${i}&sort=${sort}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="${pageContext.request.contextPath}/list?page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
    </div>
    <jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>