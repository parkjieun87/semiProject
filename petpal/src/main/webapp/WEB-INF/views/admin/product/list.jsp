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
			
			let productNo = $(this).data("productno");
			$(".delete_productNo").val(productNo);
			$(".delete_form").submit();
			
		});
	});
	</script>
	<!-- 삭제 form -->
       <form action="delete" method="post" class="delete_form">
          <input type="hidden" name="productNo" class="delete_productNo">
       </form>

    <div class="container-1500 ms-10">
    	<!-- 상품 목록 테이블 -->
        <div class="row">
            <table class="table table-slit">
                <thead>
                    <tr>
                        <th width="80px">상품 번호</th>
                        <th width="110px">카테고리 번호</th>
                        <th>상품 이름</th>
                        <th width="90px">상품 가격</th>
                        <th width="80px">상품 재고</th>
                        <th>상품 설명</th>
                        <th width="100px">상품 등록일</th>
                        <th>상품 할인률</th>
                        <th>상품 조회수</th>
                        <th width="70px">관리</th>
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
	                        	<a class="link del-btn" data-productno="${list.productNo }">삭제</a>
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