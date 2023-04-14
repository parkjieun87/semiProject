<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPal 관리자 페이지</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/commons.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/admin.css">
	
	<!-- favicon 설정 -->
	<link rel="icon" type="image/x-icon" sizes="16x16" href="${pageContext.request.contextPath}/static/favicon-16x16.png">
	
	 <!-- favicon 설정 -->
    <link rel="icon" type="image/x-icon" href="/static/favicon.ico">
    <!-- jQuery Cdn -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	
	<!-- Javascript에서 절대경로를 사용하기 위한 꼼수
		- JS는 절대경로란 개념이 없으므로 JSP의 EL의 도움을 받아야 함
		- <script>는 분할해서 작성해도 결국 이어지는특징을 화용
		- 모든 <script>의 가장 위에 다음과 같이 변수를 하나 선언
		- const로 변수를 선언하면 자바의 final과 같이 불변처리가 됨
	 -->
	 <script>
	 	const contextPath = "${pageContext.request.contextPath}";
	 </script>
    


</head>
	
<body>
	<main class="container">
		<nav class="sidebar">
			<h2>관리자 페이지</h2>
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/member/list" class="sidebar-link">회원 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/product/list" class="sidebar-link">상품 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/product/insert" class="sidebar-link">상품 등록</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/sales/list" class="sidebar-link">매출 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/order/list" class="sidebar-link">주문 관리</a></li>
			</ul>
		</nav>
		<article class="main-content">
      