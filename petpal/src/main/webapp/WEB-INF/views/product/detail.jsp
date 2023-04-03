<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 
 <style>
       
        body{
            font-family: '카페24 써라운드 에어';
        }

        /* 상세페이지 사진 css */
        .photo-sell-wrap .photo-wrap .photo-view img{
            width: 478px;
            height: 478px;
            position: relative;
        }

        .photo-sell-wrap {
        position: relative;
        padding: 0 50px 0 560px;
        min-height: 580px;
        width: 100%;
        vertical-align: top;
        padding-right: 0;
        }

        .photo-sell-wrap .photo-wrap {
            position: absolute;
            top: 0;
            left: 40px;
            width: 500px;
        }

        .photo-indicate li button {
            position: relative;
            border: 1px solid #dfdfdf;
        }
        .photo-view:before{
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            content: '';
            background-color: rgba(0, 0, 0, .025);
            border: 1px solid rgba(0, 0, 0, .03);
            -webkit-border-radius: 14px;
            border-radius: 14px;
            z-index: 1;
        }
        .sell-wrap>h2 {
            margin-bottom: 15px;
            padding: 0 70px 20px 8px;
            line-height: 30px;
            height: 75px;
            color: #373737;
            font-size: 20px;
            font-weight: 500;
            border-bottom: 1px solid #9091E6;
            word-wrap: break-word;
            word-break: keep-all;
        }
        .sell-wrap .price-info{
            margin-bottom: 0px;
            padding: 0 0 0 8px;
            border-bottom: 1px solid #9091E6;
            padding-bottom: 10px;
        }
        .sell-wrap .price-info d1
        .price-sell{
            display: flex;
        }
        .sell-wrap .basic-info{
            margin-bottom: 0px;
            padding: 0 0 0 8px;
        }
        .sell-wrap .basic-info dl{
            position: relative;
            margin-top: 10px;
            width: 100%;
        }

        /* 수량 버튼 css */

                                   .jss811 {
                                       width: 100%;
                                       padding: 12px 25px 50px 25px;
                                       justify-content: space-between;
                                       background-color: #f4f4f5;
                                       border-radius: 6px;
                                   }
                                   .jss812{
                                    float: left;
                                   }
                                   .jss813 {
                                       color: rgba(60, 60, 67, 0.6);
                                       margin-bottom: 8px;
                                   }                      
                                   .jss821 {
                                       width: 200px;
                                   }
                                   .jss821 {
                                       display: flex;
                                       overflow: hidden;
                                       border-radius: 4px;
                                       background-color: #f4f4f5;
                                   }
                                   .jss816 {
                                       color: rgba(60, 60, 67, 0.6);
                                       text-align: right;
                                       margin-bottom: 0px;
                                
                                   }
       
                                   .jss817 {
                                       height: 40px;
                                       display: flex;
                                       font-size: 22px;
                                       align-items: center;
                                       font-weight: 500;
                                       justify-content: flex-end;
                                   }
                                   .jss817 > strong {
                                       font-size: 22px;
                                    }

        .quantity-wrap{
            display: inline-block;
            position: relative;
            top: -2px;
            padding: 0 28px;
            width: 115px;
            height: 30px;
            border: 1px solid #dfdfdf;
            vertical-align: middle;
        } 
        .quantity-wrap input{
            width: 100%;
            font-size: 12px;
            height: 27px;
            border: 0 none;
            text-align: center;
            vertical-align: top;
            color: #333;
        }  
         /*수량 버튼 마이너스,플러스  */
        .quantity-wrap button{
            position: absolute;
            top: 0;
            width: 28px;
            height: 28px;
            font-size: 0;
        }   
        /* 마이너스버튼 */
        .quantity-wrap .btn-minus{
            left: 0;
            background-color: #f1f1f1;
            border: 0 none;
        }
        .quantity-wrap button::after{
            content: "";
            display: block;
            position: absolute;
            top: 13px;
            left: 9px;
            width: 10px;
            height: 2px;
            background: #909090;
        }  
        /* 플러스버튼 */
        .btn-plus{
            border: 0 none;
        }
        .quantity-wrap .btn-plus::before{
            content: "";
            display: block;
            position: absolute;
            top: 9px;
            left: 13px;
            width: 2px;
            height: 10px;
            background: #909090;
            
        }
        .quantity-wrap .button::after{
            content: "";
            display: block;
            position: absolute;
            top: 13px;
            left: 9px;
            width: 10px;
            height: 2px;
            background: #909090;
        }
        .pss_quantitys{
            margin-left:-1px;
            text-align:left;
            display:block;
            margin-top:8px;
            font-weight:bold;
            color:#4f9900;
            font-family:'Noto Sans KR','dotum', sans-serif;
            letter-spacing: -.58px;
            text-align: center;
        }
        /* 장바구니 버튼 */
        .sell-wrap .btn-area {
        /* position: absolute; */
        bottom: 0;
        right: 0;
        padding-top: 10px;
        width: 100%;
        border-top: 1px solid #dfdfdf;
        z-index: 1;
        }
        .sell-wrap .btn-area .btn-type {
            margin-right: 0;
            width: 50%;
            max-width: 230px;
            height: 50px;
            line-height: 46px;
            font-size: 16px;
            font-family: inherit;
            float: left;
        }
        .sell-wrap .btn-area .btn-type.type03::before{
            width: 24px;
            background-position: 0 -25px;
        }
        .sell-wrap .btn-area .btn-type~.btn-type {
    float: right;
        }
        .sell-wrap .btn-area:after {
            content: "";
            display: block;
            clear: both;
            background-color: #fff;
        }
        .sell-wrap .cart-layer .cart-wrap {
            /* display: none; */
            width: 240px;
            height: 0;
            border: 1px solid #c8c8c8;
            box-shadow: 0 2px 2px rgba(0, 0, 0, 0.13);
            background: #fff;
            /* overflow: hidden; */
        }
        .sell-wrap .cart-layer {
            position: absolute;
            bottom: 60px;
            left: 0;
            margin-top: 4px;
            width: 250px;
            z-index: 100;
        }
        
input[type='number']::-webkit-outer-spin-button,
input[type='number']::-webkit-inner-spin-button {
     -webkit-appearance: none;
     margin: 0;
}

.tab-title{
display:flex;
border-top : 1px solid #ccc;
border-bottom : 1px solid #ccc;
border-left : 1px solid #ccc;
border-right: 1px solid #ccc;
text-align:center;

}

.tab-title > li{
padding : 15px 20px 14px;
width:25%;
background-color: #f7f7f7;
border-right: 1px solid #ccc;
}

.tab-title > li a{
color : black;
font-weight:700;
}

.benefit-wrap{
   display:flex;
   font-size : 24px;
}


/* 상품 정보, 상품 후기, 상품 문의, 구매 확인사항*/

    /* 사용자 주소 정보 */
    .addressInfo_div{
        margin-top: 30px;  
        
    }
    .addressInfo_input_div_wrap{
        border-bottom: 1px solid #f3f3f3;
        height: 225px;
        
        
    }
    .address_btn {
        background-color: #555;
        color: white;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        font-size: 17px;
        width: 25%;
    }

    .address_btn:hover{
        background-color: #777;
    }
    .addressInfo_button_div::after{
        content:'';
        display:block;
        clear:both;
    }
     .addressInfo_input_div{
                padding:12px;
                text-align: left;
                display: none;
                line-height: 40px;                
        }
           
	footer {
  position: fixed;
  bottom: 50px;
  width: 100%;
  height:  150px;
}
   


    </style>   
    
    
<!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script type="text/javascript">
        $(function(){
           
           
           var sell_price = $("[name=sell_price]").val();
           
           var inputCount = 1;
           var originalPrice = parseInt($(".disPrice").text());
           
           
           
           
            //마이너스 버튼
            $(".btn-minus").click(function(){
               
                 if(inputCount==1){
                    $("[name=productStock]").val(inputCount);
                  }else{
                     
                $("[name=productStock]").val(inputCount-1);
                inputCount = parseInt($("#quantity").val());
             
                  }
            
                
            var sum = $("#cart_total_price_pc").val();
         

               sum = parseInt(inputCount) * sell_price;
            
               
               $(".disPrice").text(sum);
               
                
              
            })
            //플러스 버튼
            $(".btn-plus").click(function(){
      
     
                var sum = $("#cart_total_price_pc").val();
               
              
                 inputCount = parseInt($("#quantity").val());
                 $("#quantity").val(inputCount);
               
        
               sum = inputCount * sell_price;
               $(".disPrice").text(sum);
                
               
                
               
               
                if(inputCount == ${productDto.productStock}){
                   $("[name=productStock]").val(inputCount);
                }else if(inputCount < ${productDto.productStock}){
          
                    $("[name=productStock]").val(inputCount+1);
                }
            });
            
            // 서버로 전송할 데이터
            const form = {
                  memberId : "${memberId}",
                  productNo : "${productDto.productNo}",
                  productCount : ''
            }
            
            $("#insert_cart").click(function(){
               form.productCount = inputCount;
               $.ajax({
                  url : "/cart/add",
                  type : "POST",
                  data : form,
                  success : function(result){
                     cartAlert(result);
                  }
               });
            });
            
            function cartAlert(result){
               if(result == '0'){
                alert("장바구니에 추가를 하지 못하였습니다.");
             }else if(result == '1'){
                alert("장바구니에 추가되었습니다.");
             }else if(result == '2'){
                alert("장바구니에 이미 추가되어져 있습니다.");
             }else if(result == '5'){
                alert("로그인이 필요합니다.");
             }
            }
           
                   
        });
    </script>
    
     <script type="text/javascript">
            /* 주소입력란 버튼 동작(숨김, 등장) */
        function showAdress(className){
            /* 컨텐츠 동작 */
                /* 모두 숨기기 */
                $(".addressInfo_input_div").css('display', 'none');
                /* 컨텐츠 보이기 */
                $(".addressInfo_input_div_" + className).css('display', 'block');		
            
            /* 버튼 색상 변경 */
                /* 모든 색상 동일 */
                    $(".address_btn").css('backgroundColor', '#a29bfe');
                /* 지정 색상 변경 */
                    $(".address_btn_"+className).css('backgroundColor', '#6c5ce7');	
        }
            
      </script>
<head>
 
</head>
<%@ include file="../template/header.jsp" %>

        <div class="row center">
            <h1></h1>
        </div>
        <div class="row"  id="contents" style="width: 900px; margin-bottom: 10px; margin-left: 125px; margin-top:50px; text-align:center;">
            <a href="#" style="text-decoration: none;">산책/이동장</a> &gt; <a href="#" style="text-decoration: none;">이동가방</a></div>
        <div id="contents-wrap" style="width:1000px; margin:0 auto;"> 
            <div id="contents">
                <div class="photo-sell-wrap">
                    <div class="photo-wrap">
                        <div class="photo-view" data="#" style="cursor: pointer;">
                        <img src="${productDto.imageURL}" alt="이동장가방사진" id="photo_detail">
                        <!-- <img src="https://cdnimg.dogpang.com/catpang/data/goods/4/3473_web_original_1536742300169762.jpg"  alt="이동장가방사진" id="photo_detail">
  -->                       </div>
                        <div class="photo-indicate">
                            <ul id="photo_dumy">
                                <li class="smallImg">               
                                    <button class="active thumb-detail-list">
                                        <img id="btn_img" src="${productDto.imageURL}" style="height: 60px; width: 60px;" alt="이동장가방사진">
<!--                                         <img id="btn_img" src="https://cdnimg.dogpang.com/catpang/data/goods/4/3473_web_original_1536742300169762.jpg" style="height: 60px; width: 60px;" alt="이동장가방사진">
  -->                                  
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="sell-wrap" style="padding-top: 0px;">
                        <div style="margin-bottom: 3px;">
                            <a href="#" style="margin-left: 8px; letter-spacing: 0px; text-decoration: none;">힐링타임</a>
                        </div>
                        <h2 style="margin-bottom: 0px;">
                            <span id="viewName">${productDto.productName}</span>
                            <div class="star">
                                <div class="view-info-new">
                                    <div class="grade">
                                        <strong style="width: 0%;">0.0점</strong>
                                    </div>
                                </div>
                            </div>
                        </h2>
                        <div class="price-info view_price_first">
                            <dl class="price-sell" style="padding-top: 10px;">
                                <dt>판매가</dt>
                                <dd>
                                    <del class="num" style="color: gray;">
                                        ${productDto.productPrice}원
                                    </del>
                                </dd>
                            </dl>
                            <dl class="price-sell">
                                <dt>할인가</dt>
                                <dd>
                                    <strong class="num" style="color: red;">${disPrice}원</strong>
                                </dd>
                            </dl>
                        </div>
                        <div class="basic-info">
                            <dl class="price-basic">
                                <dt style="float: left; padding-right: 50px;">배송</dt>
                                <dd>
                                    <span>30,000원 이상 구매 시 무료배송</span>
                                </dd>
                            </dl>
                            <dl class="price-basic" style="margin-bottom: 10px;">
                                <dt id="remain_subject" style="float: left; padding-right: 50px;">출고</dt>
                                <dd id="remian_text">
                                    <div>업체별 배송기간 1~3일 추가 소요</div>
                                </dd>
                            </dl>
                        </div>
                        <!-- 수량 -->
                        <div class="jss811">
                            <div>
                                <div class="jss812">
                                    <div class="jss813">수량</div>
                                    <div class="jss821">
                                        <dd class="alarm yes-stock" style="background-color: #f4f4f5;">
                                            <div class="quantity-wrap" style="top:0">
                                                <button class="btn-minus dim" style="background-color: #fff;">"빼기"</button>
                                                <input type="number" name="productStock" id="quantity" value="1" autocapitalize="off" style="border-left: 1px solid #dfdfdf; border-right: 1px solid #dfdf;" max="${productDto.productStock}" readonly>
                                                <button class="btn-plus" style="background-color: #fff;">"더하기"</button>
                                            </div>
                                            <span id="pass_quantity" class="pss_quantitys">(재고 ${productDto.productStock}개 남음)</span>
                                        </dd>
                                    </div>
                                </div>
                                <div>
                                    <div class="jss816" style="margin-top: 10px;"> 
                                        총 상품 금액
                                    </div>
                                    <div class="jss817">
                                        <strong id="cart_total_price_pc">
                                       
                                           <input type="hidden" name="sell_price" value="${disPrice}">
                                        
                                             <span class="disPrice">${disPrice}</span>
                                           
                                        </strong>
                                        원
                                    </div>
                                </div>
                                <div></div>
                            </div>
                        </div>
                        <div class="basic-info">
                            <div class="btn-area" style="border-top: 1px solid #fff;">
                                <div class="cart-layer">
                                    <!-- <div class="cart-wrap" style="height: 0px;">
                                        <p class="cart-txt tit">상품이 장바구니에 담겼습니다.</p>
                                        <div class="cart-body">
                                            <div class="btn-area">
                                                <a href="#" class="btn-type" style="width: 48%; font-size: 13px;">장바구니 보기</a>
                                                <a href="#" class="btn-close" onclick="javascript:cart_layerclose();">닫기</a>
                                            </div>
                                            <a href="#" class="btn-close" onclick="javascript:cart_layerclose">
                                                <b>닫기</b>
                                            </a>
                                        </div>
                                    </div> -->
                                </div>
                                <button type="button" class="btn-type type03" id="insert_cart" style="border-color: #9091E6; background-color: #9091E6; border-bottom: #9091E6;">
                                    <b>장바구니 담기</b>
                                </button>
                                <button type="button" class="btn-type type04" id="insert_direct">
                                    <b>바로구매</b>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
                                     
            
    <div class="addressInfo_div">
        <div class="addressInfo_button_div">
            <button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #a29bfe;">상품 정보</button>
            <button class="address_btn address_btn_2" onclick="showAdress('2')" style="background-color: #a29bfe;">상품 후기</button>
             <button class="address_btn address_btn_3" onclick="showAdress('3')" style="background-color: #a29bfe;">상품 문의</button>
             <button class="address_btn address_btn_4" onclick="showAdress('4')" style="background-color: #a29bfe;">구매 확인사항</button>
            
        </div>
        <div class="addressInfo_input_div_wrap">
            <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
            			       
            			        ${productDto.productDesc}                                             
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_2">
                테스트2
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_3" >
                테스트3
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_4">
                테스트4
            </div>
        </div>
    </div>
 
       
    </div>
   

    

<%@include file="../template/footer.jsp" %>