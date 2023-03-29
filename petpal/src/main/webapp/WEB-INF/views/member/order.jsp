<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/order.css">

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
        $(function(){

            //주소 
            $(".btn-post").click(function(){
                       
                new daum.Postcode({ //new는 객체를 만드는 함수
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.querySelector("[name=receiveZipcode]").value = data.zonecode;
                        document.querySelector("[name=receiveAddress]").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.querySelector("[name=receiveAddressSub]").focus();
                    }
                    }).open();
            
        });
         


            //휴대폰 번호 인증
            var code2 = "";
            $("#phoneChk").click(function(){
            alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
            var phone = $("#phone").val();   
            
            
            $.ajax({   
                    type:"GET",
                    url:"/member/phoneCheck?phone=" + phone,
                    cache : false,
                    success:function(data){
                    
                    console.log(data);
                    
                    $("#phone2").on("propertychange change keyup paste input",function(){
                        var phone2 = $("#phone2").val();
                        console.log(phone2);
                        
                        if(data == phone2){
                            $(".successPhoneChk").text("올바른 번호입니다.");
                            $(".successPhoneChk").css("color","green");
            
                        }else{
                            $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                            $(".successPhoneChk").css("color","red")
                        }
                    });
                    
                
                    
                    }
                });
            });
        
            //내용 삭제
            $(".btn-clear1").click(function(){
                $("#phone").val("");
            })           
            $(".btn-clear2").click(function(){
                $("#phone2").val("");
            })           
            $(".btn-clear3").click(function(){
                $("#receive-name").val("");
            })           
            $(".btn-clear4").click(function(){
                $("#receive-tel").val("");
            })           
            $(".btn-clear5").click(function(){
                $("#receive-address-detail").val("");
            })    
            
            //수령인 미 입력시 문구 나오게 하기
            $("[name=receiveName]").blur(function(){
                var isValid = $(this).val().length>0;
                if(!isValid){
                    $("[name=txt-p1]").show().css("display");
                }else{
                    $("[name=txt-p1]").hide().css("display");
                }
            });
            //휴대폰 번호 미 입력시 문구 나오게 하기
                $("[name=receiveMobile]").blur(function(){
                    var isValid = $(this).val().length>0;
                    if(!isValid){
                        $("[name=txt-p2]").show().css("display");
                    }else{
                        $("[name=txt-p2]").hide().css("display");
                    }
                });
            //상세주소 미 입력시 문구 나오게 하기
            $("[name=receiveAddressSub]").blur(function(){
                var isValid = $(this).val().length>0;
                if(!isValid){
                    $("[name=txt-p3]").show().css("display");
                }else{
                    $("[name=txt-p3]").hide().css("display");
                }
            });
            //

    });  
        </script>
        <!-- 우편cdn -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

        
<div class="container-1000">
    <div id="pay-step" class="order">
            <h1 id="logo">
                <a href="#">펫팔</a>
               
                <sub style="top: 33px; left: auto; right: 0; color: #9091E6; font-weight: 500; margin-left:10px;">강아지용폼 전문몰 펫팔</sub>
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
                        <h2>주문내역</h2>
                        <div class="bundle__retail" data-componet="bundleInfo-retail">
                            <div class="bundle-info__pdd-group-box">
                                <div class="bundle-info__expected-delivery-date-box">
                                   <span class="bundle-info__expected-delivery-info">
                                    도그팡 배송
                                   </span> 
                                </div>
                            <div class="bunle-info__item-list">
                            <c:forEach items="${cartDto}" var="list">
                                <div class="bundle-info__vendor-tiem-box">
                                    <div style="position: absolute;">
                                        <img src="./img/9012_web_original_1673006075211726.jpg"
                                         height="20px">
                                    </div>
                                    <div class="bundle-info__vendor-item" style="padding-left: 50px;width: 100%;">
                                        <p>
                                            <span class="bundle-info__vendor-item__offer-condition">${list.productName}</span>
                                            <span>: ${list.productCount}개</span>
                                        </p>
                                    </div>
                                    <div class="bundel-info__delivery-service" style="padding-left: 50px;width: 100%;"></div>
                                    <div class="bundle-info__item-description" style="padding-left: 50px; width: 100%;"></div>
                                </div>
                             </c:forEach>       
                            </div>
                            </div>
                            <div class="bunle-info__item-list"></div>
                        </div>
                        <div class="bundle-info__bdd-group-title"></div>
                        <div></div>
                        <div></div>
                    </div>
                    <!-- 구매자 정보 div -->
                    <div class="sec">
                        <h2 class="tit type02">
                            <b>구매자 정보</b>
                        </h2>
                        <div class="sec type03">
                            <div class="inp-wrap val type03">
                                <strong>이름</strong>
                            <span class="val" id="order-name">박구름</span>
                            </div>
                            <div class="inp-wrap val type03">
                                <strong>이메일</strong>
                                <span class="val" id="order-email">cloud@gmail.com</span>
                            </div>

                            <div class="inp-wrap type03 btn-add wide">
                                <strong>휴대폰</strong>
                                <span class="val">
                                    <span class="num" id="member_tel">휴대폰 번호를 입력해주세요</span>
                                </span>
                                <div class="row" id="rowbtn1">
                                    <input type="tel" name="memberTel" class="form-input w-60" id="phone" placeholder="대시(-)를 제외하고 작성">
                                    <button id="btnC1" type="button" class="btn-clear1"></button>
                                    <div class="invalid-message">올바른 휴대전화번호가 아닙니다</div>
                                    <button type="button" class="form-btn positive w-30 ms-50" id="phoneChk">번호인증</button>
                                 </div>
                                 <div class="row" id="rowbtn2">
                                 <input id="phone2" type="text"  class="form-input w-100"  name="phone2" placeholder="인증번호 입력"  required/>
                                 <button id="btnC2" type="button" class="btn-clear2"></button>  
                                    <span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
                                 </div>
                            </div>

                        </div>
                    </div>
                    <form>
                    <div class="sec">
                        <h2 class="tit type02">
                            <b>받는사람 정보</b>
                        </h2>
                        <div class="sec type03" id="rowbtn3">
                            <input type="checkbox" id="order_copy" name="order_copy" style="margin-left: 127px; margin-bottom: 2px;">
                            구매자 정보 동일
                            <button type="button" id="delivery-page" class="val-type type10" style="margin-left: 10px;margin-bottom: 2px;"></button>
                            
                            <div class="inp-wrap type03" id="row-btnC3">
                                <label for="receive-name">수령인</label>
                                <input type="text" name="receiveName" id="receive-name" style="margin-bottom: 10px;">
                                <button id="btnC3" type="button" class="btn-clear3" style="left: 480px;"></button>
                            </div>
                            <p id="receive-name-txt" class="warning-txt" name="txt-p1" style="margin-top: -2px;">수령인을 입력해주세요.</p>


                            <div class="inp-wrap type03" id="row-btnC4">
                                <label for="receive-tel">휴대폰</label>
                                <input type="tel" name="receiveMobile" id="receive-tel" value="" style="margin-bottom: 10px;">
                                <button id="btnC4" type="button" class="btn-clear4" style="left: 480px;"></button>
                            </div>
                            <p id="receive-tel-txt" class="warning-txt" name="txt-p2">휴대폰 번호를 입력해주세요.</p>
                            
                            <div class="inp-wrap type03 btn-add" id="row-btn6">
                                <label for="receive-address-num">우편번호</label>
                                <input type="text" name="receiveZipcode" id="receive-address-num" value="" readonly="readonly" style="margin-bottom: 10px; background: rgb(246, 246, 246);" onclick="javascript:zipcode_click_search();">
                                <button type="button" class="btn-post" id="zipcode_search">우편번호 찾기</button>
                            </div>
                    
                            <div class="inp-wrap type03">
                                <label for="receive-address">주소</label>
                                <input type="text" name="receiveAddress" id="receive-address" value="" readonly="readonly" style="margin-bottom: 10px; background: rgb(246, 246, 246);" onclick="javascript:zipcode_click_search();">
                            </div>
                    
                            <div class="inp-wrap type03" id="row-btnC5">
                                <label for="receive-address-detail">상세주소</label>
                                <input type="text" name="receiveAddressSub" id="receive-address-detail" value="">
                                <button  id="btnC5" type="button" class="btn-clear5" style="left: 480px;"></button>
                            </div>
                            <p id="receive-address-detail-txt" class="warning-txt" name="txt-p3">상세주소를 입력해주세요.</p>

                        </div>
                    </div>
                    </form>
                    <div class="sec">
                        <h2 class="tit type02">
                            <b>결제금액</b>
                        </h2>
                        <div class="sec type03">
                            <div class="inp-wrap type03">
                                <strong>총 상품가격</strong>
                                <span class="val">215,700원</span>
                            </div>
                            <div class="inp-wrap type03">
                                <strong>할인금액</strong>
                                <span class="val" id="discountval">-12,200원</span>
                            </div>
                            <div class="inp-wrap type03">
                                <strong>배송비</strong>
                                <span class="val">무료</span>
                            </div>
                            <div class="inp-wrap type03" style="margin-top: 20px;">
                                <strong>
                                    <b>총 결제금액</b>
                                </strong>
                                <strong class="val malgun">203,500원</strong>
                            </div>
                        </div>
                        <div class="sec">
                            <h2 class="tit type02">
                                <b>결제 수단</b>
                            </h2>
                            <div class="sec type03">
                                <div class="inp-wrap type03" style="width: 100%;">
                                    <label>결제</label>
                                    <div class="chk-wrap" style="margin-top: 3px; margin-left: 10px; font-size: 13px;">
                                        <input type="radio" id="payment-naver" name="order-payment" value="NAVER" style="display:none";>
                                        <label for="payment-naver">네이버페이</label>
                                    </div>
                                    <div class="chk-wrap" style="margin-top: 3px; margin-left: 10px; font-size: 13px;">
                                        <input type="radio" id="payment-kakao" name="order-payment" value="KAKAO" style="display:none";>
                                        <label for="payment-kakao">카카오페이</label>
                                    </div>
                                    <div class="chk-wrap" style="margin-top: 3px; margin-left: 10px; font-size: 13px;">
                                        <input type="radio" id="payment-payco" name="order-payment" value="PAYCO" style="display:none";>
                                        <label for="payment-payco">페이코</label>
                                    </div>
                                    <div class="chk-wrap" style="margin-top: 3px; margin-left: 10px; font-size: 13px;">
                                        <input type="radio" id="payment-toss" name="order-payment" value="TOSS" style="display:none";>
                                        <label for="payment-toss">토스</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="term-pay-wrap" style="margin-top: 30px;">
                            <h2 class="tit type02" style="margin-left: 5px;">
                                <b>개인정보 제3자 제공 동의</b>
                            </h2>
                            <div class="sec type03 scroll-wrap" style="margin-top: 8px;">
                                <ol>
                                    <li>
                                        <strong>
                                            회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다.
                                        </strong>
                                        <ul>
                                            <li>(주)펫팔은 이용자들의 개인정보를 "개인정보 취급방침의 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 
                                                이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
                                            </li>
                                            <li>
                                                (주)펫팔이 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인 및 해피콜 등 
                                                거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 업체에게 제공합니다.
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <strong>
                                            * 동의 거부권 등에 대한 고지
                                        </strong>
                                        <p>개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나,
                                            이 경우 서비스 이용이 제한될 수 있습니다.
                                        </p>
                                    </li>
                                </ol>
                            </div>
                            <div class="chk-wrap">
                                <input type="checkbox" id="puchase-ok" style="display:none";>
                                <label for="puchase-ok">
                                    본인은 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.
                                </label>
                            </div>
                        </div>
                        <span></span>
                    </div>
                    <div class="btn-area">
                        <button class="btn-type size04 size05 ico-ok" id="submitSettleBtn" style="border-radius: 3px;">
                            <b>결제하기</b>
                        </button>
                    </div>
                </div>
            </form>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>