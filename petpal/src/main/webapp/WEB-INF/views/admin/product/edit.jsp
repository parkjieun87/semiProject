<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<div class="container-400">
<div class="row center">
	<h1>상품 정보 변경</h1>
</div>
<div class="row">
	<form action="edit" method="post">
		<input type="hidden" name="productNo" value="${productDto.productNo }">
			<table class="table center ms-20">
			<colgroup>
				<col style="width: 50%;">
           		<col style="width: 50%;">
			</colgroup>
			
			<tbody>
				<tr>
					<th scope="col">카테고리 번호</th>
					<td scope="col">
						<input type="text" name="categoryCode" value="${productDto.categoryCode}">
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>
						<input type="text" name="productName" value="${productDto.productName}">
					</td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td>
						<input type="text" name="productPrice" value="${productDto.productPrice }">
					</td>
				</tr>
				<tr>
					<th>상품재고</th>
					<td>
						<input type="text" name="productStock" value="${productDto.productStock }">
					</td>
				</tr>
				<tr>
					<th>상품할인률</th>
					<td>
						<input type="text" name="productDiscount" value="${productDto.productDiscount }">
					</td>
				</tr>
			</tbody>
		</table>
		<div class="row right">
		<button class="edit-btn">수정</button>
		<a class="link" href="list">목록</a>
		</div>
	</form>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>