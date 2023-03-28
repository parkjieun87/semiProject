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
     .logo 
   {
     margin: auto;
   }
    </style>
    
    <style>
   #colss{
   color:white;
   }
    </style>

    <!--Jquery Cdn-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/static/js/cart.js"></script>
</head>
<body>
<div class="container-1300">
        <div class="row">
           <table>
           	<colsgroup>
           		<col style="width: 47%; color:white;">
           		<col style="width: 9%;">
           		<col style="width: 9%;">
           		<col style="width: 7%;">
           	</colsgroup>
           	
           	<thead>
           						<tr style="background:#b1b2ff ;" id="colss">
                                    <th scope="col" >상품</th>
                                    <th scope="col">가격 & 수량</th>
                                    <th scope="col">총 금액</th>
                                    <th scope="col"></th>
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
                 <span> <a href="/product/P000010819">[덴탈껌 증정] 시저 딸기 바나나와 우유 슬라이스 280g - 유통기한 2023.07</span> (묶음1개)                                                       </a>
                      </div>
                     </th>
                     
                     
           <td>
   			 <div class="row" style="width:100%; display:flex; align-items:center;">
                               <p>가격: <span class="row price">10,000</span>원</p>
                               <p>수량: <input type="number" name="quantity" value="1" min="1" max="10" onchange="updatePrice(1)" autocomplete="off"> </p>               
		 	</div>
          </td>
          
          <td>
                                    <span class="couponApplyText" style="text-align:center;display:block;color:#ff7777;font-size:10px;"></span>
                    <p>총 가격: <span class="total">10,000</span>원</p>
           </td>
            </tr>
                           
           	</tbody>
           </table>
        </div>
        <hr>
   </div>
   
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
