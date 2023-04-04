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


<!--jquery cdn-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    	$(function () {
    			console.log('${list}');
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
					</div>
					<!-- <button id="filter-layer" class="ico-filter hide">검색옵션</button>
                    <button id="view-type" class="ico-list hide">리스트 형태</button> -->

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
							<c:choose>
							<c:when test="${mode == true}">	
							<li><a href="?categoryCode=${list[0].categoryCode}&sort=regdate">신상품</a></li>
							<li><a href="?categoryCode=${list[0].categoryCode}&sort=viewName">상품명</a></li>
							<li><a href="?categoryCode=${list[0].categoryCode}&sort=price_low">낮은가격</a></li>
							<li><a href="?categoryCode=${list[0].categoryCode}&sort=price_high">높은가격</a></li>
							</c:when>
							<c:otherwise>
							<li><a href="?parentCode=${parent}&sort=regdate">신상품</a></li>
							<li><a href="?parentCode=${parent}&sort=viewName">상품명</a></li>
							<li><a href="?parentCode=${parent}&sort=price_low">낮은가격</a></li>
							<li><a href="?parentCode=${parent}&sort=price_high">높은가격</a></li>
							</c:otherwise>
							</c:choose>
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
		<c:choose>
		<c:when test="${mode == true}">					 
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="?categoryCode=${list[0].categoryCode}&sort=${sort}&page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="?categoryCode=${list[0].categoryCode}&sort=${sort}&page=${i}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="?categoryCode=${list[0].categoryCode}&sort=${sort}&page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
		</c:when>
		<c:otherwise>
			<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="?parentCode=${parent}&sort=${sort}&page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="?parentCode=${parent}&sort=${sort}&page=${i}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="?parentCode=${parent}&sort=${sort}&page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
				</div>
			</div>
		</div>

	</div>

</body>

</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

