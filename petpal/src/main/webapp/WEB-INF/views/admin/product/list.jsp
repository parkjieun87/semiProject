<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

	<script>
	$(function(){
		$(".del-btn").click(function(e){
			
			e.preventDefault();
			
			var choice = confirm("삭제하시겠습니까?");

			if(choice == false) return;
			
			let pageNo = $(this).data("page");
			let productNo = $(this).data("productno");
			$(".delete_productNo").val(productNo);
			$(".delete_pageNo").val(pageNo);
			$(".delete_form").submit();
			
			
			
		});
	});
	</script>
	<!-- 삭제 form -->
       <form action="delete" method="post" class="delete_form">
          <input type="hidden" name="productNo" class="delete_productNo">
          <input type="hidden" name="page" class="delete_pageNo">
       </form>
	
	<!-- 정렬  -->
   	<div class="row ms-10">
		<a class="link" href="list?">최신 등록일순</a>
		<a class="link" href="list?sort=product_regdate asc">오래된순</a>
		<a class="link" href="list?sort=product_price desc">높은 가격순</a>
		<a class="link" href="list?sort=product_price asc">낮은 가격순</a>
	</div>
		
    <div class="container-1500 ms-10">
		
    	<!-- 상품 목록 테이블 -->
        <div class="row">
            <table class="table table-slit">
            	
            	<colgroup>
            		<col style="width: 7%;">
            		<col style="width: 7%;">
            		<col style="width: 15%;">
            		<col style="width: 5%;">
            		<col style="width: 5%;">
            		<col style="width: 15%;">
            		<col style="width: 7%;">
            		<col style="width: 7%;">
            		<col style="width: 7%;">
            		<col style="width: 7%;">
            	</colgroup>
                <thead>
                    <tr>
                        <th scope="col">상품 번호</th>
                        <th scope="col">카테고리 번호</th>
                        <th scope="col">상품명</th>
                        <th scope="col">상품 가격</th>
                        <th scope="col">상품 재고</th>
                        <th scope="col">상품 설명</th>
                        <th scope="col">상품 등록일</th>
                        <th scope="col">상품 할인률</th>
                        <th scope="col">상품 조회수</th>
                        <th scope="col">관리</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${productList}" var="list">
	                    <tr class="center">
	                        <td >${list.productNo}</td>
	                        <td>${list.categoryCode}</td>
	                        <td>${list.productName}</td>
	                        <td>${list.productPrice}원</td>
	                        <td>${list.productStock}개</td>
	                        <td>
	                        	<a class="link" href="detail?productNo=${list.productNo}">
	                        		${list.productName} 자세히보기
	                        	</a>
	                        </td>
	                        <td>${list.productRegdate}</td>
	                        <td>${list.productDiscount}%</td>
	                        <td>${list.productViews}</td>
	                        <td>
	                        	<a class="link" href="edit?productNo=${list.productNo}">수정</a>
	                        	<a class="link del-btn" data-productno="${list.productNo }" data-page="${vo.page }">삭제</a>
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
					<option value="category_code">카테고리 번호</option>
					<option value="product_name">상품명</option>
					<option value="product_regdate">상품등록일</option>
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
						<a href="list?page=${i}&sort=${sort}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="list?page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
       
    </div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>