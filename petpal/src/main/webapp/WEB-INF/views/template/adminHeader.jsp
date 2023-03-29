<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPal 관리자 페이지</title>
    <link rel="stylesheet" type="text/css" href="/static/css/load.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
    <link rel="stylesheet" type="text/css" href="/static/css/contact/notice.css">

   
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- header css -->
    <link rel="stylesheet" type="text/css" href="/static/css/header.css">
    
    <style>
	.footMent
   {
   	font-size : 15px;
    font-weight: lighter;  	
   }
   .tel
   {
   	font-size : 20px;
    font-weight: bold;  
    color: #9c88ff;	
   }
   a
   {
   	text-decoration: none;
   	color: #2d3436;
   }
   .table.table-slit {
            border-collapse: collapse;
            border-top: none;
            border-bottom: none;
   }

   .table.table-slit>thead {
       border-bottom: 2px #b2bec3 solid;
   }

   .table.table-slit>tbody>tr:not(:last-child) {
       border-bottom: 1px #b2bec3 solid;
   }
   .flex-vertical > div {
   		width: 200px;
   }
</style>
	<!-- jQuery Cdn -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
	
<body>
<main style="margin-left:100px;">
        <header>
            <div class="row">
            </div>
        </header>
        <section>
            <aside style="border-right:1px solid gray;" class="mt-10">
                <!-- 관리 메뉴는 수직으로 배치(List-Group 형태) -->
                <div class="flex-box flex-vertical">
                    <div class="p-10">
                        <h2>관리자 메뉴</h2>
                    </div>
                    <div class="p-10"><a href="/admin/member/list" class="link">회원 관리</a></div>
                    <div class="p-10"><a href="/admin/product/list" class="link">상품 관리</a></div>
                    <div class="p-10"><a href="/admin/" class="link">매출 관리</a></div>
                    <div class="p-10"><a href="/admin/" class="link">주문 관리</a></div>
                </div>
            </aside>
            <article>
      