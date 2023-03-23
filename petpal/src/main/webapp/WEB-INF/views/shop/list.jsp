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
	<h1>상품 목록</h1>
	<div>
		<table>
			<thead>
				<tr>
					<th>상품명</th>
					<th>할인율</th>
					<th>상품가격</th>
				</tr>
			</thead>
			<tbody>
				 <c:forEach var="productDto" items="${list}">
				 	<tr>
					<td>${productDto.productName}</td>
					<td>${productDto.productDiscount}</td>
					<td>${productDto.productPrice}</td>
					</tr>
				</c:forEach> 
			</tbody>
		</table>
	</div>
</body>
</html>