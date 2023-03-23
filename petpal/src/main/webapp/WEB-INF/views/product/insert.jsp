<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 입력 페이지</h1>
	<form action="insertProcess" method="post">
		<div>
		<label>카테고리코드</label>
		<input type="text" name="categoryCode">
		</div>
		<div>
		<label>상품명</label>
		<input type="text" name="productName">
		</div>
		<div>
		<label>상품가격</label>
		<input type="text" name="productPrice">
		</div>
		<div>
		<label>상품재고</label>
		<input type="text" name="productStock">
		</div>
		<div>
		<label>상품상세</label>
		<input type="text" name="productDesc">
		</div>
		<div>
		<label>상품할인율</label>
		<input type="text" name="productDiscount">
		</div>
		<button type="submit">입력</button>
	</form>
</body>
</html>