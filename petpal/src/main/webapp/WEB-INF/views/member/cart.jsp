<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="/static/css/load.css">
    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <style>
       input:read-only {
        pointer-events: none;
        }
    </style>
    
     <style>
		   #colss{
		   color:white;
		   }
    </style>

	<style>
		  #spans {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		  }
	</style>
	
	<style>
	
	</style>
    <!--Jquery Cdn-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/static/js/cart.js"></script>
</head>
<body>

<div class="container-1400 mt-50">
 		<div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <div class="row">
           <table>
           	<colsgroup>
           		<col style="width: 40%; color:white;">
           		<col style="width: 20%;">
           		<col style="width: 10%;">
           		<col style="width: 20%;">
           		
           	</colsgroup>
           	
           	<thead>
           						<tr style="background:#b1b2ff ;" id="colss">
                                    <th scope="col" >상품</th>
                                    <th scope="col">가격 & 수량</th>
                                    <th scope="col">총 품목 금액</th>
                                 	 <th scope="col">총 결제 금액</th>
                                </tr>
           	</thead>
           	
           	<tbody>
           	<tr class="" cart-idx="" cart-quantity="1" goods-mixsno="" goods-viewcode="">
                  <th scope="row">
                    <div class="item-info" >
                        <input type="hidden" name="" value="">
                          <a href=" " class="photo">
                          <img src="https://cdnimg.dogpang.com/catpang/data/goods/10/9232_web_list_L1_1664878617838762.jpg" 
                          alt="시저 딸기 바나나와 우유 슬라이스 280g - 유통기한 2023.07" onerror="this.src='https://cdnimg.dogpang.com/catpang/data/skin/standard/img/common/noimg_300.gif'">
                   		</a>
                 <span id="spans"> <a href="/product/P000010819">[덴탈껌 증정] 시저 딸기 바나나와 우유 슬라이스 280g - 유통기한 2023.07</span> (묶음1개)                                                       </a>
                      </div>
                     </th>
                     
                     
           <td>
   			 <div class="row" style="width:100%; display:flex; align-items:center;">
                               <p>가격: <span class="row price spans">10,000</span>원</p>
                               <p>수량: <input type="number" name="quantity" value="1" min="1" max="10" onchange="updatePrice(1)" autocomplete="off"> </p>               
		 	</div>
          </td>
          
          <td>
                                    <span class="couponApplyText" style="text-align:center;display:block;color:#ff7777;font-size:10px;"></span>
                    <p>품목 가격: <span class="total spans">10,000</span>원</p>
           </td>
            </tr>
                           
           	</tbody>
           	
			<tbody>
           	<tr class="" cart-idx="" cart-quantity="1" goods-mixsno="" goods-viewcode="">
                  <th scope="row">
                    <div class="item-info" >
                        <input type="hidden" name="" value="">
                          <a href=" " class="photo">
                          <img src="https://cdnimg.dogpang.com/catpang/data/goods/10/9232_web_list_L1_1664878617838762.jpg" 
                          alt="시저 딸기 바나나와 우유 슬라이스 280g - 유통기한 2023.07" onerror="this.src='https://cdnimg.dogpang.com/catpang/data/skin/standard/img/common/noimg_300.gif'">
                   		</a>
                 <span id="spans"> <a href="/product/P000010819">[덴탈껌 증정] 시저 딸기 바나나와 우유 슬라이스 280g - 유통기한 2023.07</span> (묶음1개)                                                       </a>
                      </div>
                     </th>
                     
                     
           <td>
   			 <div class="row" style="width:100%; display:flex; align-items:center;">
                               <p>가격: <span class="row price spans">10,000</span>원</p>
                               <p>수량: <input type="number" name="quantity" value="1" min="1" max="10" onchange="updatePrice(2)" autocomplete="off"> </p>               
		 	</div>
          </td>
          
          <td>
                    <p>품목 가격: <span class="total spans" onchange="updatePrice(2)" autocomplete="off">10,000</span>원</p>
           </td>
            <td>
                    <div class="row" style="width:100%; display:flex; align-items:center;">
                               <p>총 가격: <span class="total spans" name="quantity1">10,000</span>원</p>      
		 			</div>
		 			<button class="form-btn positive w-100" >구매하기</button>
           </td>
            </tr>
                           
           	</tbody>   
           	        	
           </table>
  
   
        </div>
   </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
