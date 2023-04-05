<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <link rel="stylesheet" href="/static/css/contact/reply.css">
 <link rel="stylesheet" href="/static/css/product/detail.css">
<jsp:include page="/WEB-INF/views/template/detail_header.jsp"></jsp:include>

 <style>
       
        body{
            font-family: '카페24 써라운드 에어';
            /* body의 마진을 설정하여 footer와 겹치지 않게 함 */
			  margin-bottom: 50px; /* footer 높이와 같게 설정 */

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
        
            border: 1px solid #c8c8c8;
            box-shadow: 0 2px 2px rgba(0, 0, 0, 0.13);
            background: #fff;
            /* overflow: hidden; */
        }
        .sell-wrap .cart-layer {
            position: absolute;
            bottom: 150px;
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
.cart-txt{
	padding: 20px 0 0 0;
    line-height: 40px;
    color: #373737;
    font-size: 13px;
    font-weight: normal;
    text-align: center;
}
.btn-close1{
	width: 48%;
    font-size: 13px;
    display: block;
    margin: 0 auto;
    max-width: 100%;
    height: 30px;
    line-height: 28px;
    float : right;
}

.btn-type_cart{
	width: 48%;
    font-size: 13px;
        display: block;
    margin: 0 auto;
    padding: 0;
    width: 100%;
    max-width: 100%;
    height: 30px;
    line-height: 28px;
    font-size: 14px;
}
.btn-area{
	position: static;
    margin: 0 0 0 0;
    padding-top: 0;
    width: auto;
    border: 0 none;
    text-align: center;
    clear: both;
    display:flex;
    justify-content: space-between;
    margin-left : 10px;
}
.cart-body{
	padding: 0px 15px 15px 15px;
}
.cart-wrap{
	margin-bottom : 30px;
}

.cartView_btn{
	width : 50%;
	height: 30px;
	margin-right : 8px;
	background-color: #9091E6;
	border : 1px solid #9091E6;
	opacity : 0.7;
	color: white;
}
.exit_btn{
	width : 50%;
	height: 30px;
	margin-right : 8px;
}

.cart-layer{
	display:none;
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
           
  



    </style>   
    
    
<!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script type="text/javascript">
        $(function(){
           
           
           
           var inputCount = 1;
           var memberId = "${memberId}";
           
        
            //마이너스 버튼
            $(".btn-minus").click(function(){
               
            	 // 수량 버튼 조작
                let quantity = $(this).parent("div").find("input").val();
                let quantityInput = $(this).parent("div").find("#quantity");
       
                if(quantity > 1){
                   
                   $(quantityInput).val(--quantity);
                   
                   
                }
            
                
                 var sum = 0;
                 
                 sum += $("#disprice").val() * quantity;
              
                 
                 $(".disPrice").text(sum.toLocaleString());
         
            })
           
           //플러스 버튼
            $(".btn-plus").click(function(){
              
               // 수량 버튼 조작
               let quantity = $(this).parent("div").find("input").val();
               let quantityInput = $(this).parent("div").find("#quantity");
      
               if(quantity < '${productDto.productStock}'){
                  
                  $(quantityInput).val(++quantity);
                  
                  
               }
               
               var sum = 0;
 
               sum += $("#disprice").val() * quantity;
            
               
               $(".disPrice").text(sum.toLocaleString());
            });
           
            // 서버로 전송할 데이터
            const form = {
                  memberId : "${memberId}",
                  productNo : "${productDto.productNo}",
                  productCount : ''
            }
            
            $("#insert_cart").click(function(){
            	// 상품 상세 페이지에서 상품 수량 -> 장바구니 에서 상품 수량
               var productCnt = $(this).parent().parent().parent().parent().find("input").val();
               form.productCount = productCnt;
               $.ajax({
                  url : "/cart/add",
                  type : "POST",
                  data : form,
                  success : function(result){
                
   
                		
                      $(".cart-layer").css("display","block");
                
        
                  },
                  error : function(result){
                	 

                	  
                	  $(".cart-layer").css("display","none");
                	  
                	  alert("장바구니에 이미 추가되어져 있습니다.");
                	 
                  }
               });
            });
            
            $("#insert_direct").click(function(){
            	// 상품 상세 페이지에서 상품 수량 -> 장바구니 에서 상품 수량
               var productCnt = $(this).parent().parent().parent().parent().find("input").val();      
               form.productCount = productCnt;
               $.ajax({
                  url : "/cart/add",
                  type : "POST",
                  data : form,
                  success : function(result){
                	 console.log("result", result);
                	
                     //cartAlert(result);
                	 location.href="/cart";
                  },
                  error : function(result){
                	  alert("장바구니에 이미 추가되어져 있습니다.");
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

            
          
            
         // 장바구니 등록 창 닫기 버튼   
       	$(".exit_btn").click(function(){
       		$(".cart-layer").css("display","none"); 
       	});
       	
         // 장바구니로 가기 버튼
       	$(".cartView_btn").click(function(){
       		location.href = "/cart";
       	});
         
        // 바로구매 버튼
        //$("#insert_direct").click(function(){
        //	location.href="/cart";
        //});
         
         
   
         
    
         
        
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

<body>
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
                            
                        </h2>
                        <div class="price-info view_price_first">
                            <dl class="price-sell" style="padding-top: 10px;">
                                <dt>판매가</dt>
                                <dd>
                                    <del class="num" style="color: gray;">
                                    <fmt:formatNumber value="${productDto.productPrice}" pattern="#,###"/>원  
                                    </del>
                                </dd>
                            </dl>
                            <dl class="price-sell">
                                <dt>할인가</dt>
                                <dd>
                                 <strong class="num" style="color: red;" >
                                     <fmt:formatNumber value="${disPrice}" pattern="#,###"/>원
                                  </strong>
                                     
                                      
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
                                                <c:if test="${productDto.productStock == 0 }">
                                                <input type="number" name="productStock" id="quantity" value="0" autocapitalize="off" style="border-left: 1px solid #dfdfdf; border-right: 1px solid #dfdf;" max="${productDto.productStock}" readonly>
                                                </c:if>
                                                <c:if test="${productDto.productStock != 0 }">
                                                <input type="number" name="productStock" id="quantity" value="1" autocapitalize="off" style="border-left: 1px solid #dfdfdf; border-right: 1px solid #dfdf;" max="${productDto.productStock}" readonly>
                                                </c:if>
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
                                       
                                           <input type="hidden" name="sell_price" value="${disPrice}" id="disprice">
                                        
                                             <span class="disPrice">
                                                 <fmt:formatNumber value="${disPrice}" pattern="#,###"/>
                                             </span>
                                           
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
                                     <div class="cart-wrap">
                                        <p class="cart-txt tit">상품이 장바구니에 담겼습니다.</p>
                                        <div class="cart-body">
                                            <div class="btn-area">
                                                <button class="cartView_btn">장바구니 보기</button>
                                                <button class="exit_btn">닫기</button>
                                            </div>
                                            <!-- 
                                            <a href="#" class="btn-close" onclick="javascript:cart_layerclose">
                                                <b>닫기</b>
                                            </a>
                                             -->
                                        </div>
                                    </div> 
                                </div>
                                <button type="button" class="btn-type type03" id="insert_cart" style="color: white; border-color: #9091E6; background-color: #9091E6; border-bottom: #9091E6;">
                                    <b>장바구니 담기</b>
                                </button>
                                <button type="button" class="btn-type type04 " id="insert_direct">
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
            <button class="address_btn address_btn_2" onclick="showAdress('2')" style="background-color: #a29bfe;">상품 후기${replyCount}</button>
             <button class="address_btn address_btn_3" onclick="showAdress('3')" style="background-color: #a29bfe;">상품 문의</button>
             <button class="address_btn address_btn_4" onclick="showAdress('4')" style="background-color: #a29bfe;">구매 확인사항</button>
            
        </div>
        <div class="addressInfo_input_div_wrap">
            <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
                            
                             ${productDto.productDesc}                                             
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_2">
                <div class="reply_subject">
					<h2>리뷰</h2>
				</div>
				<div>
					<ul class="review_list">
						<c:forEach items="${replyList}" var="list">
						
						<li>
							<div class="review-item">
								<div class="review-info">
									<dl class="grade">
										<dt>평점</dt>
										<div class="view-info-new">
											<div class="grade">
												<strong id="grade" style="width:100%;">★★★★★</strong>
											</div>
										</div>
										<dd>${list.regDate}</dd>
										<dd class="writer">${list.memberId}</dd>
									</dl>
								</div>
								<div class="riview-content">
									<div class="review-span">
										<div class="sec">
											<p>
											${list.content}
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				
				
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_3" >
               
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_4">
                <div class="add-content">
                                      
                                                        <div class="sec span2" style="padding: 0px 50px;">

                                <div class="sec type03" style="border-radius:5px;">
                                    <h2 class="tit type02 cs-intro" style="font-size:14px;font-weight: 500;">배송정보</h2>
                                    <ul class="list-type type02 cs-intro" style="font-size:13px">
                                        <li>3만원 이상 구매 시 무료배송됩니다. (부피, 무게 무관)</li>
                                        <li>제주, 도서산간 지역은 3,000원 택배비 추가됩니다.</li>
                                        <li>펫팔 출고상품 경우 [평일 오후 5시 까지, 토요일 낮 12시 결제건] 까지 당일출고 됩니다.</li>
                                        <li>택배 업체 상황에 따라 [CJ대한통운, 롯태택배] 로 출고될수 있습니다.</li>
                                        <li>업체 배송에 경우 1~3일가량 추가로 소요될 수 있습니다.</li>
                                        <li>천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 지연될 수 있는 점 양해 부탁드립니다.</li>
                                    </ul>
                                </div>
                                <div class="sec type03" style="border-radius:5px;margin-top:20px;">
                                    <h2 class="tit type02 cs-intro" style="font-size:14px;font-weight: 500;">교환, 반품 안내</h2>
                                    <ul class="list-type type02 cs-intro" style="font-size:13px">
                                        <li>단순변심에 의한 환불은 제품 수령후 7일이내에 신청 가능합니다. (왕복배송비 고객부담)</li>
                                        <li>단순변심에 의한 반품시 배송박스 수량에 따라 반품 택배비가 추가됩니다. </li>
                                        <li>포장개봉, 조립, 사용 등으로 인해 재판매가 불가능할 경우 반품이 불가능 할 수 있습니다.</li>
                                        <li>제품 하자의 경우 물품 수령 후 30일이내 반품 가능합니다.</li>
                                    </ul>
                                </div>
                                <div class="sec type03" style="border-radius:5px;margin-top:20px;">
                                    <h2 class="tit type02 cs-intro" style="font-size:14px;font-weight: 500;">네이버페이 결제시 교환/반품 주의사항</h2>
                                    <ul class="list-type type02 cs-intro" style="font-size:13px">
                                        <li>펫팔에서는 자체 물류 운영으로 물류센터의 상품 출고지와 교환 및 반품지 주소가 서로 다릅니다.</li>
                                        <li>네이버페이 결제시 반품/교환시 택배 자동수거설정이 불가한점 양해부탁드립니다.</li>
                                        <li>네이버페이로 주문하신 고객님은  상품 반품 및 교환 요청시 카톡상담 또는 1:1 게시판을 통해 요청해주시면 빠르게 접수 후 저희가 제품 회수 접수를 도와드리도록 하겠습니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div>
 
       
    
   
</div>

    <%-- -

<%@include file="../template/footer.jsp" %>
--%>




