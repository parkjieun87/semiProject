<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
        $(function(){
        	
        	
        	/* 카테고리 */
        	let categoryList = JSON.parse('${cateList}');
        	
        	let cate1Array = new Array();
        	let cate2Array = new Array();
        	
        	let cate1Obj = new Object();
        	let cate2Obj = new Object();
        	
        	let cateSelect1 = $(".cate1");
        	let cateSelect2 = $(".cate2");
        	
        	
        	/* 카테고리 배열 초기화 메서드 */
        	function makeCateArray(obj,array,categoryList,tier){
        		
        		for(let i = 0; i< categoryList.length; i++){
            		if(categoryList[i].tier === tier){
            			obj = new Object();
            			
            			obj.categoryName = categoryList[i].categoryName;
            			obj.categoryCode = categoryList[i].categoryCode;
            			obj.categoryParent = categoryList[i].categoryParent;
            			
            			array.push(obj);
            		}
            	}
        	}
        	
        	/* 배열 초기화 */
        	makeCateArray(cate1Obj,cate1Array,categoryList,1);
        	makeCateArray(cate2Obj,cate2Array,categoryList,2);
        	
        	/* 대분류 <option> 태그 */
        	for(let i = 0; i<cate1Array.length; i++){
        		cateSelect1.append("<option value='"+cate1Array[i].categoryCode+"'>" + cate1Array[i].categoryName + "</option>");
        	}
        	
        	/* 중분류 <option> 태그 */
        	$(cateSelect1).change(function(){
        		let selectVal1 = $(this).find("option:selected").val();
        		cateSelect2.children().remove();
        		cateSelect2.append("<option value='none'>선택</option>");
        		
        		for(let i = 0; i<cate2Array.length; i++){
        			if(selectVal1 === cate2Array[i].categoryParent){
        				cateSelect2.append("<option value='"+cate2Array[i].categoryCode+"'>"+cate2Array[i].categoryName+"</option>");
        			}
        		}
        		
        	});
        	
        	
        	
        	
        	
            $('[name=productDesc]').summernote({
        placeholder: '내용을 작성하세요.',
        tabsize: 4, // 탭키를 누르면 띄어쓰기 몇 번 할지
        height: 250, // 최초 표시될 높이(px)
        toolbar: [ // 메뉴 설정
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture']],
          
        ]
      });  
         
            // 할인가격 설정
           
          
       	$("#discount").on("propertychange change keyup paste input",function(){
       	 var productPrice = $("#productPrice").val();
       	 var discount = $(this).val();
         var discountPrice = productPrice * (1 - discount/100);
         
       	 var discountPriceText = $("#discountPrice").text(discountPrice);
       	 
       	
       	});
            
        
         
            
            
            
            
            
            
        });
        
        
        
       
        
    </script>
</head>
<body>
	<form action="insertProcess" method="post" enctype="multipart/form-data">
		<div>
		<div class="category_wrap">
		<span>대분류</span>
		<select class="cate1">
			<option selected value="none">선택</option>
		</select>
		</div>
		<div class="category_wrap">
		<span>중분류</span>
		<select class="cate2" name="categoryCode">
			<option selected value="none">선택</option>
		</select>
		</div>
		</div>
		<div>
		<label>상품명</label>
		<input type="text" name="productName">
		</div>
		<div class="price">
		<label>상품가격</label>
		<input type="text" name="productPrice" id="productPrice">
		할인가격 : <span id="discountPrice"></span> 
		</div> <br>
		<div>
		<label>상품재고</label>
		<input type="text" name="productStock">
		</div>
		<div>
		<label>상품상세</label>
		<textarea name="productDesc"></textarea>
		</div>
		<div>
		<label>상품할인율</label>
		<input type="text" name="productDiscount" id="discount">
		</div>
		<label>이미지</label>
		<input type="file" name="attach">
		<div class="row right">
			<button type="submit" class="insert-btn">등록</button>
			<a class="link" href="list">목록</a>
		</div>
	</form>
	
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>