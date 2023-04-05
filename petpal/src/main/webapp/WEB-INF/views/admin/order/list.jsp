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
			
			let detailNo = $(this).data("detailno");
			let pageNo = $(this).data("page");
			$(".delete_detailNo").val(detailNo);
			$(".delete_pageNo").val(pageNo);
			$(".delete_form").submit();
			
			
		});
	});
</script>

<div class="container-1200" style="margin-left: 200px;">
		<!-- 삭제 form -->
       <form action="delete" method="post" class="delete_form">
          <input type="hidden" name="orderDetailNo" class="delete_detailNo">
          <input type="hidden" name="page" class="delete_pageNo">
       </form>   
       
        	<!-- 정렬  -->
    	<div class="row" style="margin:auto;">
			<a class="link" href="list">최신순</a>
			<a class="link" href="list?sort=order_date asc">오래된순</a>
			<a class="link" href="list?sort=total desc">높은 주문액순</a>
			<a class="link" href="list?sort=total asc">낮은 주문액순</a>
		</div>
		
    	<!-- 주문 목록 테이블 -->
        <div class="row">
       		<table class="table table-slit">
               <thead>
                    <tr>
                        <th>주문번호</th>
                        <th>성명</th>
                        <th>주문 날짜</th>
                        <th>수령인 주소</th>
                        <th>연락처</th>
                        <th>상품 이름(수량 * 가격)</th>
                        <th>총 주문 금액</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${orderDto}" var="list">
	                    <tr class="center">
	                        <td>${list.orderDetailNo}</td>
	                        <td>${list.receiverName}</td>
	                        <td>${list.orderDate}</td>
	                        <td>
	                        	${list.receiverPost}
	                        	${list.receiverBasicAddr}
	                        	${list.receiverDetailAddr}
	                        </td>
	                        <td>${list.receiverTel}</td>
	                        <td>
	                        ${list.productName}*${list.productCount}개
	                        </td>
	                        <td>${list.total}</td>
	                        <td class="target">
                       			<a class="link del-btn" data-detailno="${list.orderDetailNo}" data-page="${vo.page }">삭제</a>
	                        </td>
	                    </tr>
                		
                	</c:forEach>
                </tbody>
            </table>
        </div>
        
        <!-- 검색창  -->
        <div class="row right">
			<form action="list" method="get">
				<select name="column" class="form-input">
					<option value="receiver_name">성명</option>
					<option value="order_detail_no">주문번호</option>
					<option value="product_name">상품이름</option>
				</select>
				<input type="search" name="keyword" placeholder="검색어" value="${keyword}" class="form-input">
				<button type="submit" class="form-btn neutral">검색</button>
			</form>
        </div>
        
        <!-- 페이징 영역 -->
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="list?page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="list?page=${i}&keyword=${keyword}&sort=${sort}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="list?page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
    </div>
    
    
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>