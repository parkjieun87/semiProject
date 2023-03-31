<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<div class="container-1200 ms-10">
    	<!-- 주문 목록 테이블 -->
        <div class="row">
        	<!-- 정렬  -->
    	<div class="row" style="margin:auto;">
			<a class="link" href="list">최신순</a>
			<a class="link" href="list?sort=order_date asc">오래된순</a>
			<a class="link" href="list?sort=total desc">주문액 높은순</a>
			<a class="link" href="list?sort=total asc">주문액 낮은순</a>
		</div>
       		<table class="table table-slit">
               <thead>
                    <tr>
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
	                        <td>	
                       <a class="link" href="#">삭제</a>
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
       
    </div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>