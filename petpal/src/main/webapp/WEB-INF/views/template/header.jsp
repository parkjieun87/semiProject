<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Petpal</title>
    <title>홈페이지 레이아웃</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/load.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/test.css">

    
	<!--  favicon 설정 -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/favicon.ico">

        <!-- header css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
    
   <!-- jQuery Cdn -->
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <script>
   	const contextPath= "${pageContext.request.contextPath}";
   </script>
   </head>
   
<main class="container-1200">
<body>
  <header id="header">
    <div id="header-area1">
        <div class="wrap container-1200">
               <div class="img-search ms-140">
               <a href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/static/image/petpal.png" width="170" height="150" style="padding-left: 20px; margin-right: 20px; margin-top: -70px; ;">
                </a>
                
                <div id="search">
                    <div class="inp-wrap">
                <c:choose>    
				<c:when test="${mode2 == true}">
                  <form name="frm_search" id="frm_search" method="get" action="list">
                       <input class="inp2" name="search_word" type="text" placeholder="찾고싶은 상품을 검색해보세요!"> 

                       <div class="tag" style="float:left; margin-top: 0;">
                   </form>
                </c:when>
                <c:otherwise>
                	 <form name="frm_search" id="frm_search" method="get" action="product/list">
                       <input class="inp2" name="search_word" type="text" placeholder="찾고싶은 상품을 검색해보세요!"> 

                       <div class="tag" style="float:left; margin-top: 0;">
                   </form>
                </c:otherwise>
                </c:choose>         
                         <ul>
                         	<!-- 로그아웃 상태 -->
                           <c:if test="${memberId == null}">
                           <li><a href="${pageContext.request.contextPath}/member/join">Join</a></li>
                           <li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>
                           </c:if>
                            <!-- 로그인 상태 -->
                           <c:if test="${memberId != null}">
                           <li><a href="${pageContext.request.contextPath}/member/mypage">Mypage</a></li>
                           <li><a href="${pageContext.request.contextPath}/cart"><i class="fa-sharp fa-solid fa-cart-shopping fa-1x" style="font-size: 23px;"></i></a></li>
                           <li><a href="${pageContext.request.contextPath}/member/logout">Logout</a></li>
                           </c:if>
                            <!-- 로그인 상태 -->
                         </ul>
                       </div>                   
                    </div>
                </div>
               </div>
             </div>
    </div>

    <div id="header-area2">
      <div class="wrap2">
        <ul class="contents" >
          <li>
            <a href="${pageContext.request.contextPath}/product/list?parentCode=1000">사료</a>
            <ul class="depth_1">
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=1010">전연령용</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=1011">자견용</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=1012">성견용</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=1013">노견용</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=1014">분유</a>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/product/list?parentCode=2000">간식</a>
            <ul class="depth_1">
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=2010">육포/건조간식</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=2011">트릿/스틱</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=2012">껌/덴탈껌</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=2013">캔/파우치</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=2014">동결건조</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=2015">비스켓/스낵</a>              
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/product/list?parentCode=3000">장난감</a>
            <ul class="depth_1">
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=3010">봉제장난감</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=3011">공/원반</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=3012">라텍스장난감</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=3013">치실/로프</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=3014">터그놀이</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=3015">노즈워크</a>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/product/list?parentCode=4000">목욕용품</a>
            <ul class="depth_1">
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=4010">샴푸/린스</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=4011">타월/드라이</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=4012">목욕용품</a>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/product/list?parentCode=5000">미용용품</a>
            <ul class="depth_1">
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=5010">빗/브러쉬</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=5012">발/발톱관리</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=5013">미스트/향수</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=5014">털제거용품</a>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/product/list?parentCode=6000">산책용품</a>
            <ul class="depth_1">
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=6010">목줄</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=6011">하네스줄/가슴줄</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=6012">리드줄</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=6013">산책용품</a>
              <a href="${pageContext.request.contextPath}/product/list?categoryCode=6014">이동가방</a>
            </ul>
          </li>
      </div>
    </div>
        </header>
        </body>
  </main>
      