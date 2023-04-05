<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPal 관리자 페이지</title>
	<link rel="stylesheet" type="text/css" href="/static/css/commons.css">
	<link rel="stylesheet" type="text/css" href="/static/css/admin.css">
	
    <!-- jQuery Cdn -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    


</head>
	
<body>
	<main class="container">
		<nav class="sidebar">
			<h2>관리자 페이지</h2>
			<ul>
				<li><a href="/admin/member/list" class="sidebar-link">회원 관리</a></li>
				<li><a href="/admin/product/list" class="sidebar-link">상품 관리</a></li>
				<li><a href="/admin/product/insert" class="sidebar-link">상품 등록</a></li>
				<li><a href="/admin/sales/list" class="sidebar-link">매출 관리</a></li>
				<li><a href="/admin/order/list" class="sidebar-link">주문 관리</a></li>
			</ul>
		</nav>
		<article class="main-content">
      