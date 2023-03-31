<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>



    	<!-- 상품 목록 테이블 -->
	    <div class="row" style="margin:auto;">
			<a href="sales">날짜순↑</a>
			<a href="sales">날짜순↓</a>
			<a href="sales?sort=">낮은 매출 순</a>
			<a href="sales?sort=">높은 매출 순</a>
		</div>
		<div class="container-1000 ms-20">
			
			<table class="table table-slit center" > 
			<thead>
				<tr>
					<th>주문 일자</th>
					<th>상품 가격</th>
					<th>주문 수량</th>
					<th>총 주문액</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="salesDto">
				<tr>
					<td>
						${salesDto.orderDate}
					</td>
					<td>
						${salesDto.productPrice }원
					</td>
					<td>
						${salesDto.productCount}개
					</td>
					<td>
						${salesDto.totalSale}원
					</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
		<!-- 페이징 영역 -->
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="list?page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="list?page=${i}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="list?page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
       
        
        
        
       

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>