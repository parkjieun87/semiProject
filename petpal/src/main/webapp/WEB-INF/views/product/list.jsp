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
<title>Javascript</title>

<link rel="stylesheet" href="/static/css/product/list.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<style>
	a:visited {
		color: red;
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

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

