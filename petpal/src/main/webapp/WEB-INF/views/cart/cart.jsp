<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="/static/css/load.css">

    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <style>

        
#colss{
	color:white;
}
 #colss{
 	color:white;
}
  
#spans {
	 display: flex;
	align-items: center;
justfy-content: center;
}
td{
	vertical-align: none;
}
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
     margin: 0 auto;
  }
  .jss821 {
      display: flex;
      overflow: hidden;
      border-radius: 4px;
    
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
 
 	.input_size_20{
			width:20px;
			height:20px;
		}
		.all_check_input{
			margin: 18px 0 18px 18px;
		}
		.all_chcek_span{
			padding-left: 8px;
	    	font-size: 20px;
	    	font-weight: bold;		
		}
 
 
	</style>
	


    <script src="/static/js/cart.js"></script>
    
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script type="text/javascript">
        $(function(){
        	
        	 	
        	
        	/* 장바구니 종합 정보 삽입 */
        	setTotalInfo();
        	
        	/* 체크여부에따른 종합 정보 변화 */
        	$(".individual_cart_checkbox").on("change", function(){
        		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
        		setTotalInfo($(".cart_info_td"));
        	});
        	
        	
        	/* 체크박스 전체 선택 */
        	$(".all_check_input").on("click", function(){
        		/* 체크박스 체크/해제 */
        		if($(".all_check_input").prop("checked")){
        			$(".individual_cart_checkbox").prop("checked", true);
        		} else{
        			$(".individual_cart_checkbox").prop("checked", false);
        			$(".totalPrice_span").text(0);
            		$(".totalCount_span").text(0);
            		$(".totalKind_span").text(0);
        		}
        		
        		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
        		setTotalInfo($(".cart_info_td"));	
        		
        	});
        	
        	/* 수량 수정 버튼 */
        	$(".quantity_modify_btn").click(function(){
        		let cartNo = $(this).data("cartno");
        		let productCount = $(this).parent("div").find("input").val();
        		$(".update_cartNo").val(cartNo);
        		$(".update_productCount").val(productCount);
        		$(".quantity_update_form").submit();
        		
        	});
        	
        	/* 장바구니 삭제 버튼 */
        	$(".delete_btn").click(function(e){
        		e.preventDefault();
        		
        		let cartNo = $(this).data("cartno");
        		$(".delete_cartNo").val(cartNo);
        		$(".delete_form").submit();
        	});
        	
        	
        	
        	
        	function setTotalInfo(){
        		
        	let totalPrice = 0; // 총 가격
        	let totalCount = 0; // 총 개수
        	let totalKind = 0; // 총 종류
     
        	
        	$(".cart_info_td").each(function(index,element){
        		
        		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
        			
        		// 총 가격
        		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
        		// 총 개수
        		totalCount += parseInt($(element).find(".individual_productCount_input").val());
        		
        		// 총 종류
        		totalKind +=1;
        		
        		// 값 삽입
        		$(".totalPrice_span").text(totalPrice.toLocaleString());
        		$(".totalCount_span").text(totalCount);
        		$(".totalKind_span").text(totalKind);
        	}
        		
        	});
        	
        	
        	}
        	
 	
        	//마이너스 버튼
            $(".btn-minus").click(function(){
            	
            	// 수량 버튼 조작
            	let quantity = $(this).parent("div").find("input").val();
            	
            	if(quantity > 1){
 				$("#quantity").val(--quantity);
            	}
            });
            //플러스 버튼
            $(".btn-plus").click(function(){
            	
            	// 수량 버튼 조작
            	let quantity = $(this).parent("div").find("input").val();
            	
            	
            	if(quantity < 5){
   				$("#quantity").val(++quantity);
   			
            	}
  	                  
            });      
        });
    </script>
    
</head>
<body>

<div class="container-1500 mt-50">
		 	<!-- 체크박스 전체 여부 -->
		<div class="all_check_input_div">
			<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
		</div>
 	
        <div class="row">
           <table style="width: 60%; margin-left:200px;">
           	<colgroup>
           		<col style="width: 40%; color:white;">
           		<col style="width: 20%;">
           		<col style="width: 10%;">
           		<col style="width: 20%;">
           		
           	</colgroup>
           	
         
           	
           	<thead>
           						<tr style="background:#b1b2ff;" id="colss">
                                    <th scope="col">상품</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">금액</th> 
                                    <th scope="col"></th>         	
                                </tr>
           	</thead>
           	
           
           	<tbody>
           	<c:forEach items="${cartInfo}" var="list">
           	<tr>
                  <td scope="row" class="cart_info_td">
                  <input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
                  <input type="hidden" class="individual_productPrice_input" value="${list.productPrice}">
                  <input type="hidden" class="individual_productCount_input" value="${list.productCount}">
                  <input type="hidden" class="individual_totalPrice_input" value="${list.productPrice * list.productCount}">
                  
                  
                  
                  
                    <div class="item-info" style="display:flex;">                     
                          <a href=" " class="photo">
                          <img src="https://cdnimg.dogpang.com/catpang/data/goods/10/9232_web_list_L1_1664878617838762.jpg" width="120" height="120">
                   		</a>
                 <span id="spans"> <a href="/product/P000010819">${list.productName}</a></span>                             
                      </div>
                 </td>
                     
                     
           <td>
   			 <div class="row" style="width:100%; display:flex; align-items:center;">
                            <div class="jss821">
                                        
                                            <div class="quantity-wrap" style="top:0">
                                                <button class="btn-minus" style="background-color: #fff;">"빼기"</button>
                                                <input type="text" id="quantity" style="border-left: 1px solid #dfdfdf; border-right: 1px solid #dfdf;" value="${list.productCount}">
                                                <button class="btn-plus" style="background-color: #fff;">"더하기"</button>
                                            </div>
                                            <a class="quantity_modify_btn" data-cartno="${list.cartNo}">변경</a>
                
                                    </div>  
                                    <!-- 수량 조정 form -->
                                    <form action="/cart/update" method="post" class="quantity_update_form">
                                    	<input type="hidden" name="cartNo" class="update_cartNo">
                                    	<input type="hidden" name="productCount" class="update_productCount">
                                    	<input type="hidden" name="memberId" value="${memberId}">
                                    </form>   
                                    
                                    <!-- 삭제 form -->
                                    <form action="/cart/delete" method="post" class="delete_form">
                                    	<input type="hidden" name="cartNo" class="delete_cartNo">
                                    	<input type="hidden" name="memberId" value="${memberId}">
                                    </form>        
                              
		 	</div>
          </td>
          <td>
          	<span class="row price spans">${list.productPrice}</span>원
          </td>
         <td style="text-align: center;">
         <button class="delete_btn" data-cartno="${list.cartNo}">삭제</button>
         </td>
           
            </tr>
                           
           	</c:forEach>
           	</tbody>   
           	
			
           	        	
           </table>
  
   		총 상품 가격 :<span class="totalPrice_span"></span>원 <br>
   		총 주문 상품 개수 : <span class="totalCount_span"></span>개 <br>
   		총 종류 : <span class="totalKind_span"></span>개
   		
  
        </div>
   </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
