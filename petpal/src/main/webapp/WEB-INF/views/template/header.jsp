<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈페이지 레이아웃</title>
    <link rel="stylesheet" type="text/css" href="/static/css/load.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
    <style>
        
    </style>
    <!-- 링크 확인창 출력을 위한 cdn -->
     <script src="https://cdn.jsdelivr.net/gh/HSYOON27/confirm-link@latest/confirm-link.js"></script>
        
<!-- 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!-- 	<script src="/static/js/find-address.js"></script> -->
	
	<!-- jQuery Cdn -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</head>
<body>
<!--
        홈페이지를 만들 때 시맨틱 태그(semantic tag)를 사용하여 의미있게 구현
    -->
    <main>
        <header>
            <div class="flex-box">
                <div class="w-25">
                    <img src="https://via.placeholder.com/150x60?text=LOGO" alt="로고">
                </div>
                <div class="w-75">
                    <h1>내가 만든 첫 번째 홈페이지</h1>
                </div>
            </div>
        </header>
        <nav>
        	<!-- 메뉴를 상태에 따라 다르게 나오도록 처리 -->

            <ul class="menu">
                <li><a href="/">홈</a></li>
                <li>
                	<a>데이터</a>
                	<ul>
						  <li>
		                	<a>포켓몬관리</a>
		                	<ul>
		                		<li><a href="/pocketmon/list">목록보기</a></li>
		                		<li><a href="/pocketmon/insertInput">등록하기</a></li>
		                	</ul>
		                </li>
		                <li>
		                	<a>과목관리</a>
		                	<ul>
		                		<li><a href="/subject/list">목록보기</a></li>
		                		<li><a href="/subject/insert">등록하기</a></li>
		                	</ul>
		                </li>
		                <li>
		                	<a>학생관리</a>
		                	<ul>
		                		<li><a href="/student/list">목록보기</a></li>
		                		<li><a href="/student/insert">등록하기</a>
		                	</ul>
		                </li>
                	</ul>
                </li>
                <li><a href="/board/list">게시판</a></li>
                <li class="right-menu">
                    <a>회원메뉴</a>
                    <ul>
                    	<!-- 로그아웃 상태 -->
                    	<c:if test="${memberId == null}">
                        <li><a href="/member/login">로그인</a></li>
                        <li><a href="/member/join">회원가입</a></li>
                    	</c:if>
                    	<!-- 로그인 상태 -->
                    	<c:if test="${memberId != null}">
                        <li><a href="/member/mypage">내정보</a></li>
                        <li><a href="/member/logout">로그아웃</a></li>
                    	</c:if>
                    	<!-- 관리자 -->
                    	<c:if test="${memberLevel == '관리자'}">
                        <li><a href="/admin/home">관리메뉴</a></li>
                        </c:if>
                    </ul>
                </li>
            </ul>
        </nav>
        <section>
            <article>