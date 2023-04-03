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
 
 .finalTotalPrice_span{
            color: #854A72;
            font-size: 17px;
            font-weight: bold;
         }
         .totalPoint_span{
            font-size: 17px;
            font-weight: bold;      
         }
         .boundary_div{
            font-size: 0;
             border: 1px dotted #d1c7c7;
             margin: 5px 0 5px 0;      
         }
  .content_totalCount_section{
       margin-bottom: 12px;
    }
.content_total_section{
   background-color: rgb(227, 237, 247);
}

	 
	 .total_wrap{
			width: 80%;
		    margin: auto;
		    padding: 10px 0 10px 0;	
		}
			
			.finalTotalPrice_span{
				color: #854A72;
				font-size: 17px;
				font-weight: bold;
			}
			.totalPoint_span{
				font-size: 17px;
				font-weight: bold;		
			}
			
			
			
	.delete_btn{
		border-radius:3px;
		width:72px;
		padding-bottom:5px;
		color:#fff;
		background: #aaa;
		border: 1px solid #aaa;
		margin-bottom : 2px;
		
	}	
	
	.total_section{
		width:20%;
		border: 1px solid #ccc;
		height: 230px;
		margin-left: 15px;
		background: #fafafa;
	
	}
	
	.total_section > *{
		margin-left: 10px;
		margin-top : 10px;
	}
	
	.no-spin::-webkit-inner-spin-button,
	.no-spin::-webkit-outer-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	
		
	
	

    
    .total_wrap{
         width: 80%;
          margin: auto;
          padding: 10px 0 10px 0;   
      }
         
         .finalTotalPrice_span{
            color: #854A72;
            font-size: 17px;
            font-weight: bold;
         }
         .totalPoint_span{
            font-size: 17px;
            font-weight: bold;      
         }
         
         
         
   .delete_btn{
      border-radius:3px;
      width:72px;
      padding-bottom:5px;
      color:#fff;
      background: #aaa;
      border: 1px solid #aaa;
      margin-bottom : 2px;
      
   }   
   
   .total_section{
      width:17%;
      border: 1px solid #ccc;
      height: 230px;
      margin-left: 15px;
      background: #fafafa;
   
   }
   
   .total_section > *{
      margin-left: 10px;
      margin-top : 10px;
   }
   .order_btn{
      min-width:230px;
     
      height: 60px;
      font-size:15px;
      border-radius:3px;
      color: white;
      border-color: #9091E6;
       background-color: #9091E6;
       border-bottom: #9091E6;
       border-right: #9091E6;
   }
   
 
   </style>
   


    <script src="/static/js/cart.js"></script>
    
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script type="text/javascript">
        $(function(){
           
           /* 장바구니 종합 정보 삽입 */
           setTotalInfo();
          if($(".individual_totalPrice_input").val() == undefined){
        	  $(".totalPrice_span").text(0);   
        	  $(".totalCount_span").text(0);
              $(".totalKind_span").text(0);
          }
 		
           
           function setTotalInfo(){
           
              
           let totalPrice = 0; // 총 가격
           let totalCount = 0; // 총 개수
           let totalKind = 0; // 총 종류
     
           
           $(".cart_info_td").each(function(index,element){
              
           //체크여부
              
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
           });
           }
           
               var totalPrice = 0;
               $(".quantity-wrap").each(function(){
            	   var salePrice = parseInt($(this).parent("div").find("#salePrice").val());
            	   var quan = parseInt($(this).parent("div").find("#quantity").val());
            	   var itemTotalPrice = salePrice * quan;
            	  
            	   $(this).find("#totalPrice").text(itemTotalPrice);
            	   totalPrice += itemTotalPrice;
               });
              	$(".totalPrice_span").text(totalPrice.toLocaleString());
            	 
		
            
       
            // 리뷰 쓰기 
        
            $(".order_btn").click(function(){
           
           	 
           	 const memberId = '${memberId}';
           	 const productNo = $(this).parent("td").find("#orderNo").val();
           	 
           	 $.ajax({
           		data : {
           			productNo : productNo,
           			memberId : memberId
           		},
           		url : "/reply/check",
           		type : "POST",
           		success : function(result){
           			if(result === '1'){
       					alert("이미 등록된 리뷰가 존재 합니다.")
       				} else{
       					let popUrl = "/product/replyEnroll/" + memberId + "?productNo=" + productNo;
       					console.log(popUrl);
       					let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
       					
       					window.open(popUrl,"리뷰 쓰기",popOption);							
       				}
           		}
           	 });
         
   	 
            });
          
            });
  
    </script>
    
</head>
<body>


<div class="container-1500 mt-50">
         
            <div class="row" style="display:flex;">
           <table style="width: 80%; margin-left:200px;">
             
              <colgroup>
                 <col style="width: 40%; color:white;">
                 <col style="width: 20%;">
                 <col style="width: 20%;">
            	<col style="width: 20%;">       
              </colgroup>
             
         
              
              <thead>
			     <tr>
			     <th colspan="4"><h1>${memberId}님의 주문목록</h1> </th> 
			    </tr>
                             <tr style="background:#b1b2ff;" id="colss">
                                    <th scope="col">상품</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">금액</th> 
                                    <th scope="col">Review</th>
                                </tr>
                                
              </thead>
              
           
              <tbody>
              <c:if test="${empty orderList}">
              		<tr>
              			<td colspan="6" style="text-align: center;">
              				<h2>주문한 제품이 없습니다.</h2>
              				<br>
              				<a href="/" class="form-btn" style="border: 2px solid #b1b2ff;">계속 쇼핑하기</a>
              			</td>
              		</tr>
              		
              		
              </c:if>
              <c:forEach items="${orderList}" var="list">
              <tr>
                  <td scope="row" class="cart_info_td">
                  
                                 
                  <input type="hidden" class="individual_productName_input" value="${list.productName}">
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
<span class="row count spans" style="color:#b12603; font-weight:800; display: flex; justify-content: center; align-items: center;">${list.productCount}개</span>
          </td>
          
          <td style="text-align:center;">
             <span class="row price spans" style="text-decoration: line-through; color:#ccc;">${list.productPrice}원</span> <br>
             <span class="row price spans" style="color:#b12603; font-weight:800;">${list.productPrice}원</span>
             <span class="aa"></span>
          </td>
          
          <td>
          			<input type="hidden" id="orderNo" value="${list.orderNo}">
           			<button class="order_btn">리뷰남기기</button> <br> 
          </td>
        
       
            </tr>
                           
              </c:forEach>
              </tbody>                   
           
         </table>
         
      
           
         </div>  
           
     
   </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>