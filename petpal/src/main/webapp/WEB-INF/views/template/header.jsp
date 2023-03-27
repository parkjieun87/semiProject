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


   
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- header css -->
    <link rel="stylesheet" type="text/css" href="/static/css/header.css">
    
    <style>
       
    </style>
   <!-- jQuery Cdn -->
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   </head>
   
<main class="container-1500">
<body>
  <header id="header">
    <div id="header-area1">
        <div class="wrap">
               <div class="img-search">
               <a href="http://localhost:8080/">
                <img src="/static/image/petpal.png" width="170" height="150" style="padding-left: 20px; margin-right: 20px; margin-top: -70px; ;">
                </a>
                <div id="search">
                  <form name="frm_search" id="frm_search" method="#" action="#">
                    <div class="inp-wrap">
                       <input class="inp2" type="text" placeholder="검색어를 입력하세요" > 
                       <div class="tag" style="float:left; margin-top: 0;">
                         <ul>
                           <li><a href="http://localhost:8080/member/edit">Mypage</a></li>
                           <li><a href="#"><i class="fa-sharp fa-solid fa-cart-shopping fa-1x" style="font-size: 23px;"></i></a></li>
                           <li><a href="http://localhost:8080/member/login">Login</a></li>
                           <li><a href="http://localhost:8080/member/join">Join</a></li>
                         </ul>
                       </div>                   
                    </div>
                </div>
                  </form>
               </div>
             </div>
    </div>

    <div id="header-area2">
      <div class="wrap2">
        <ul class="contents" >
          <li>
            <a href="#">사료</a>
            <ul class="depth_1">
              <a href="#">전연령용</a>
              <a href="#">자견용</a>
              <a href="#">성견용</a>
              <a href="#">노견용</a>
              <a href="#">분유</a>
            </ul>
          </li>
          <li>
            <a href="#">간식</a>
            <ul class="depth_1">
              <a href="#">육포/건조간식</a>
              <a href="#">트릿/스틱</a>
              <a href="#">껌/덴탈껌</a>
              <a href="#">캔/파우치</a>
              <a href="#">수제간식</a>
              <a href="#">파우더</a>
            </ul>
          </li>
          <li>
            <a href="#">장난감</a>
            <ul class="depth_1">
              <a href="#">봉제장난감</a>
              <a href="#">공/원반</a>
              <a href="#">라텍스장난감</a>
              <a href="#">치실/로프</a>
              <a href="#">터그놀이</a>
              <a href="#">노즈워크</a>
            </ul>
          </li>
          <li>
            <a href="#">목욕용품</a>
            <ul class="depth_1">
              <a href="#">샴푸/린스</a>
              <a href="#">타월/드라이</a>
              <a href="#">목욕용품</a>
            </ul>
          </li>
          <li>
            <a href="#">미용용품</a>
            <ul class="depth_1">
              <a href="#">빗/브러쉬</a>
              <a href="#">클리퍼/미용가위</a>
              <a href="#">발/발톱관리</a>
              <a href="#">미스트/향수</a>
              <a href="#">털제거용품</a>
            </ul>
          </li>
          <li>
            <a href="#">산책용품</a>
            <ul class="depth_1">
              <a href="#">목줄</a>
              <a href="#">하네스줄/가슴줄</a>
              <a href="#">리드줄</a>
              <a href="#">산책용품</a>
              <a href="#">이동가방</a>
            </ul>
          </li>
      </div>
    </div>
  </main>
        </header>
      