<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

    <div class="container-600">
		<div class="row">
			<!--일별 매출-->
			<h3>일별 매출</h3>
			<c:forEach items="${daily}" var="dailyDto">
				
				<div>${dailyDto.day} 매출 : ${dailyDto.total}원</div>
					
			</c:forEach>
			
			<!-- 월별 매출 -->
			<h3>월별 매출</h3>
			<c:forEach items="${monthly}" var="monthlyDto">
				
					<div> ${monthlyDto.month} 매출 : ${monthlyDto.total}원</div>
			</c:forEach>
			
			<!-- 주문별 매출 -->
			<h3>주문별 매출</h3>
			<c:forEach items="${monthly}" var="monthlyDto">
				
					<div> ${monthlyDto.month} 매출 : ${monthlyDto.total}원</div>
			</c:forEach>
			
			
    	
		</div>
		<div class="container-1000 ms-20">
			<table class="table table-slit center" >
			<thead>
				<tr>
					<th>성명</th>
					<th>주문 날짜</th>
					<th>수취인 주소</th>
					<th>연락처</th>
					<th>주문상품(상품 * 수량)</th>
					<th>총 주문 금액</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
			
			<!-- 주문별 매출 -->
			<c:forEach items="${salesDto}" var="list">
				<tr>
					<td>
						${list.receiverName}
					</td>
					<td>
						${list.orderDate}
					</td>
					<td>
						${list.receiverPost}
						${list.receiverBasicAddr}
						${list.receiverDetailAddr}
					</td>
					<td>
						${list.orderDate}
					</td>
					<td>
						${list.productName} * ${list.productCount}개
					</td>
					<td>
						${list.total}원	
					</td>
					<td>
                       	<a class="link" href=""></a>
					</td>
				</tr>
			</c:forEach>
			
			</tbody>
			</table>
		</div>
		<!-- íì´ì§ ìì­ -->
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
        
        
    </div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>