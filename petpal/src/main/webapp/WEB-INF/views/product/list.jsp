<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<link rel="stylesheet" href="/static/css/product/list.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<style>


	a:visited {
		color: ;
	}
	
</style>

<!--jquery cdn-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    	$(function () {
    			$('.linkplus').click(function(e){
    				e.preventDefault();
    				// 새로 추가할 파라미터 이름과 값
    				this.classList.add('visited');
    				var paramName = this.dataset.name;
    				var paramValue = this.dataset.value;
    				
    				console.log(paramName);

    				// 현재 URL을 가져옵니다.
    				var url = window.location.href;

    				// URL에서 "?" 이후의 파라미터 부분을 가져옵니다.
    				var params = url.split("?")[1];

    				// 파라미터를 "&" 기준으로 나눕니다.
    				var paramsArray = params ? params.split("&") : [];

    				// 중복된 파라미터를 제거합니다.
    				for (var i = 0; i < paramsArray.length; i++) {
    				  var param = paramsArray[i].split("=");
    				  if (param[0] === paramName) {
    				    paramsArray.splice(i, 1);
    				    i--;
    				  }
    				}

    				// 새로운 파라미터를 추가합니다.
    				paramsArray.push(paramName + "=" + paramValue);

    				// URL에 파라미터를 다시 붙여서 새로운 URL을 생성합니다.
    				var newUrl = url.split("?")[0] + "?" + paramsArray.join("&");

    				// 새로운 URL로 이동합니다.
    				window.location.href = newUrl;

    			})
    			


    			let categoryList = JSON.parse('${cateList2}');				   			
        		var params = new URLSearchParams(window.location.search);
        		if(params.has("categoryCode")){
        			var paramv = params.get("categoryCode");
        			for(var i=0;i<categoryList.length;i++){
    					if(categoryList[i].categoryCode == paramv){
    						$("#tag").append(">" + categoryList[i].categoryName);
    					}
    					
    				} 			
        		}
        		
        	
        });
    	
  
    </script>


</head>

<body>

	<div id="middle" class="goods-list">
		<div class="wrap container-1200 ms-60">
			<div id="contents-wrap">
				<div id="lnb" class="item-option">
					<div class="ctg-area">
						<c:choose>
						<c:when test="${search == true}">
						<ul>
							<li>
								<h2 id="tag" style="width: 200px;">
									${parentName} 검색결과
								</h2>

								<ul>
									<li style="line-height: 24px;"><a
										href="?search_word=${parentName}" class="cate-link"> 전체 <span
											class="ic-num">(${sum})</span>
									</a></li>
								</ul>
								<ul>
									<c:forEach var="cateList" items="${cateList}">
										<li><a href="?search_word=${parentName}&categoryCode=${cateList.categoryCode}&sort=${sort}"
											data="${cateList.categoryCode}" class="cate-link">
												${cateList.categoryName} <em class="ic-num">(${cateList.categoryCount})</em>
										</a></li>
									</c:forEach>
								</ul>
							</li>
						</ul>
						</c:when>
						<c:otherwise>
							<ul>
							<li>
								<h2 id="tag" style="width: 200px;">
									<a href="?parentCode=${parent}">${parentName}</a>
								</h2>

								<ul>
									<li style="line-height: 24px;"><a
										href="?parentCode=${parent}" class="cate-link"> 전체 <span
											class="ic-num">(${sum})</span>
									</a></li>
								</ul>
								<ul>
									<c:forEach var="cateList" items="${cateList}">
										<li><a href="?categoryCode=${cateList.categoryCode}"
											data="${cateList.categoryCode}" class="cate-link">
												${cateList.categoryName} <em class="ic-num">(${cateList.categoryCount})</em>
										</a></li>
									</c:forEach>
								</ul>
							</li>
						</ul>
						</c:otherwise>
						</c:choose>
					</div>

				</div>
				<div id="contents" class="goods-wrap">
					<div class="banner-area" style="border-radius: 10px;">
						<div>
							<a href="#"> <img
								src="/static/image/cat_productimg_banner.jpg"
								style="border-radius: 10px;">
							</a>
						</div>
					</div>
					<div class="option-sort">
						<ul>
							<li><a href="#" data-name="sort" data-value="regdate" class="linkplus">신상품</a></li>
							<li><a href="#" data-name="sort" data-value="viewName" class="linkplus">상품명</a></li>
							<li><a href="#" data-name="sort" data-value="price_low" class="linkplus">낮은가격</a></li>
							<li><a href="#" data-name="sort" data-value="price_high" class="linkplus">높은가격</a></li>
						</ul>
					</div>
					<!-- 신규상품 리스트 start -->
					<div class="list-container">
						<div class="list-m-container" style="width: 105%">
							<c:forEach var="productDto" items="${list}" varStatus="status">
								<div class="flex-item" style="max-width: 240px;">
									<div class="flex-root">

										<a href="detail?productNo=${productDto.productNo}" class="flex-link">
										<div class="flex-img">
												<span
													style="display: block; height: 0px; padding-top: 100%;"></span>
												<div class="thumb_gray">
													<img class="list-img-source" src="${productDto.imageURL}">
												</div>
											</div>
										</a>
										<div class="flex-contents">
											<a href="detail?productNo=${productDto.productNo}" class="flex-link"> <span>${productDto.productName}</span>
												<div style="margin-top: 0px">
													<span id="discount"
														style="float: left; padding-right: 4px; font-size: 13px; line-height: 24px; font-weight: 500; color: #f43142;">${productDto.productDiscount}%</span>
													<del id="oriPrice">${productDto.productPrice}</del>
												</div>
												<div class="view-price-new">
													<strong class="price"> ${DisPrice[status.index]} <span
														style="color: #b12603; font-weight: 700; font-size: 14px;">원</span>
													</strong>
												</div>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>



						</div>
					</div>
					
					 <!-- 페이징 영역 -->
				 
		<div class="page_wrap">
			<div class="page_nation">

					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="#"  data-name="page" data-value="${i}" class="linkplus">${i}</a>
					</c:forEach>
				
			</div>
		</div>

	

				</div>
			</div>
		</div>

	</div>

</body>

</html>


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
    

    
        
<footer class="row container-1300 ms-100">

	<p class="row">
        <a href='https://www.petbabo.com/' target='_blank'>회사소개   |</a>
        <a href='https://www.dogpang.com/shop/service/term.php' target='_blank'>이용약관   |</a>  
        <a href='https://www.dogpang.com/shop/service/private.php' target='_blank'>개인정보 처리방침   |</a>  
        <a href='http://localhost:8080/contact/notice' target='_blank'>공지사항   |</a>     
		<a href='http://localhost:8080/contact/notice/faqAll' target='_blank'>자주묻는 질문   |</a>       
          
    </p>
     <hr>
	<nav style="display:flex" class="footMent">
		<img src = "/static/image/petpal.png" width ="150px" height ="150px" padding="5em" class="">
		 <p class="ms-40 mt-10">
        <span>(주) 펫팔</span><span> | 대표이사 : C조 전원</span><br/>
        <span>주소 : 서울 영등포구 선유동2로 57 이레빌딩 19층 C강의실</span><br/>
        <span>사업자 등록번호 : 123-45-67890</span><br/>
        <span>통신판매업신고 : 제2023-서울 영등포-0000호</span><br/>
        <span>이메일 : kots524@naver.com</span><br/>
     	<span>ⓒPetpal Inc. All Rights Reserved.</span>
    </p>
    <p class="ms-30 mt-10">
        <span>친절 고객센터</span><span></span><br/>
        <span class="tel">010-5053-1973</span><br/>
        <span>평일</span><span> : 10:00 ~ 18:00 </span><br/>
        <span>점심시간</span><span> : 11:30 ~ 12:30 </span><br/>
        <span>고객센터</span><span> : 토,일 / 공휴일 휴무</span><br/>
     	<span>택배출고</span><span> : 평일 오후 5시까지, 토요일 12시까지</span>
    </p>
    
    <ul class="ms-70 mt-40">
    
      <a href="https://play.google.com/store/games?hl=ko">
      		<img class="me-10" src = "/static/image/googleplay.png" width ="170px" height = "50px" padding="10em" >
      </a>
      
      <a class="footer-button" href="https://www.apple.com/kr/app-store/">
         <img class="me-10"  src = "/static/image/appstore.png" width ="170px" height = "50px" padding="10em">
      </a>
      
      <a class="footer-button" href="https://www.instagram.com/newjeans_official/">
            <img class="me-10"  src = "/static/image/instagram.png" width ="170px" height = "50px" padding="10em">
      </a>
     </ul>
     
	</nav>
	
	
	
</footer>
