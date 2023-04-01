<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<link rel="stylesheet" type="text/css" href="/static/css/orderFinish.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
     <script type="text/javascript">
     </script>
<div id="pay-step" class="order">
        <div class="wrap">
            <h1 id="logo">
                <a href="#">펫팔</a>
                <sub style="top: 33px; left: auto; right: 0; color: #9091E6; font-weight: 500;">강아지용폼 전문몰 펫팔</sub>
            </h1>
            <div class="step-location">
                <ul style="margin-left: 70px;">
                    <li class="step01" style="padding-left: 60px;">
                        <sup>01</sup>
                        장바구니
                    </li>
                    <li class="step02">
                        <sup>02</sup>
                        주문/결제
                    </li>
                    <li class="step03">
                        <sup>03</sup>
                        결제완료
                    </li>
                </ul>
            </div>
            <form name="frmSettle">
                <div id="contents">
                    <div class="sec">
                        <h2>주문이 정상적으로 완료되었습니다!</h2>
            
                    <!-- 결제완료div -->
                    <div class="sec">
                        <h2 class="tit type02">
                            <b>배송정보 내역</b>
                        </h2>
                        <div class="sec type03">

                            <div class="inp-wrap val type03">
                                <strong>주문번호</strong>
                            <input type="text" class="val" id="orderNo" name="orderNo">
                            <c:set var="orderNo" value="${dto.orderNo}"/>
                            </div>

                            <div class="inp-wrap val type03">
                                <strong>구매자이름</strong>
                                <span class="val" id="order-email">cloud@gmail.com</span>
                            </div>

                            <div class="inp-wrap val type03">
                                <strong>수취인이름</strong>
                                <span class="val" id="order-email">cloud@gmail.com</span>
                            </div>

                            <div class="inp-wrap val type03">
                                <strong>배송지주소</strong>
                                <span class="val" id="order-email">cloud@gmail.com</span>
                            </div>

                            <div class="inp-wrap val type03">
                                <strong>수취인연락처</strong>
                                <span class="val" id="order-email">cloud@gmail.com</span>
                            </div>

                            <div class="inp-wrap val type03">
                                <strong>총구매금액</strong>
                                <span class="val" id="order-email"></span>
                            </div>

                        </div>
                    </div>
                    <form>
                   
                    
                    <div class="btn-area">
                        <button class="btn-type size04 size05 ico-ok" id="submitSettleBtn" style="border-radius: 3px;">
                            <b>홈으로가기</b>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>