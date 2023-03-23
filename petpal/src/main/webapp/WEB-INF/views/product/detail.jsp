<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>제품 상세</h1>
	<div>
		<table>
			<thead>
				<tr>
					<th>상품명</th>
					<th>판매가</th>
					<th>할인가</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${productDto.productName}</td>
					<td>${productDto.productPrice}</td>
					<td>-${productDto.productDiscount}% ${disPrice} </td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>