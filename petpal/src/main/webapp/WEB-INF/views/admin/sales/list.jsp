<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
    <div class="container-600">
    		
				<!--일별 매출-->
					<c:forEach items="${daily}" var="dailyDto">
				${dailyDto.day} 매출 :
				<fmt:formatNumber pattern="##,#00">${dailyDto.total}</fmt:formatNumber>
					원
				</c:forEach>
			
			<!-- 월별 매출 -->
				<c:forEach items="${monthly}" var="monthlyDto">
						<div> 
						${monthlyDto.month} 매출 :
						<fmt:formatNumber pattern="##,#00">${monthlyDto.total}</fmt:formatNumber>
						원
						</div>
				</c:forEach>
			
				<!-- 주문별 매출 -->
				<c:forEach items="${sales}" var="salesDto">
						<div>
						${salesDto.orderDate} : 
						<fmt:formatNumber pattern="##,#00">${salesDto.total}</fmt:formatNumber>
						원
						</div>
				</c:forEach>
				
				<!-- 페이징 구현 -->
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