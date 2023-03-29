<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 리스트</title>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">


<style>
body {
	position: relative;
	min-width: 1200px;
	width: 100%;
	height: 100%;
	letter-spacing: -0.2px;
	font: 14px Pretendard, -apple-system, BlinkMacSystemFont, 'Noto Sans KR',
		'Apple SD Gothic Neo', '맑은 고딕', 'Malgun Gothic', '돋움', 'dotum',
		'Verdana', sans-serif;
	color: #000;
	/*word-break: break-all; word-wrap: break-word; word-break: keep-all;*/
	overflow: auto;
	overflow-y: scroll;
}

h1, h2, h3, h4, h5, h6 {
	font: 14px Pretendard, -apple-system, BlinkMacSystemFont, 'Noto Sans KR',
		'Apple SD Gothic Neo', "맑은 고딕", "Malgun Gothic", '돋움', 'dotum',
		'Verdana', sans-serif;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form,
	fieldset, input, textarea, blockquote, th, td, p, button, span {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	-webkit-text-size-adjust: none;
	-webkit-tap-highlight-color: transparent;
}

img {
	vertical-align: top;
}

ol, ul {
	list-style: none;
}

a {
	box-sizing: border-box;
	color: #333;
	text-decoration: none;
	cursor: pointer;
	-webkit-tap-highlight-color: transparent;
}

a:focus {
	transition: outline 0.2s;
	-webkit-transition: outline 0.2s;
}

a:focus, a:hover {
	color: #c34;
	text-decoration: none;
}

button {
	position: relative;
	border: 0 none;
	background: none;
}

input[type="checkbox"], input[type="radio"] {
	width: 13px;
	height: 13px;
	box-sizing: border-box;
	-webkit-border-radius: 0;
	cursor: pointer;
}

label {
	cursor: pointer;
	-webkit-tap-highlight-color: transparent;
}

label:focus {
	outline: none;
}

.goods-list {
	position: relative;
}

#middle>.wrap {
	padding: 0 0 40px 0;
}

.wrap {
	position: relative;
	margin: 0 auto;
	width: 1200px;
}

#lnb {
	padding: 0 30px 0 10px;
	width: 240px;
	float: left;
}

.goods-list #contents-wrap {
	padding-top: 20px;
}

.chk-wrap {
	position: relative;
	padding-bottom: 1px;
	height: 18px;
}

.chk-wrap label:after {
	content: "";
	display: block;
	position: absolute;
	top: 1px;
	left: 0;
	width: 12px;
	height: 12px;
}

#lnb+#contents {
	width: 960px;
	float: right;
}

.list-container {
	width: 100%,
}

.list-container .list-m-container {
	display: flex;
	flex-wrap: wrap;
	box-sizing: border-box;
}

.list-container .list-m-container .flex-item {
	padding: 0 6px 49px;
	flex-grow: 0;
	flex-basis: 50%;
	margin-bottom: 20px;
}
</style>

<!--jquery cdn-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	
</script>
<script type="text/template" id="qq">
        <h2 style="width:200px">
            <a href="?category=001001" data="001001">사료</a>
        </h2>
    </script>
</head>

<body>
	<div id="middle" class="goods-list">
		<div class="wrap">
			<div id="contents-wrap">
				<div id="lnb" class="item-option">
					<div class="ctg-area">
						<ul>
							<li id="li1">
								<h2 style="width: 200px">
									<a href="?category="+=param1 data="001001">사료</a>
								</h2>
								<ul>
									<li style="line-height: 24px"><a
										href="/shop/goods/goods_list?category=001001"
										class="cate-link active" data="001001" id="a1"> "전체" <span
											class="ic-num">(783)</span>
									</a></li>
								</ul>
								<ul>
									<li><a href="/shop/goods/goods_list?category=001001001"
										class="cate-link" data="001001001" id="a2"> "전연령용" <em
											class="ic-num">(401)</em>
									</a></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="filter-scroll">
						<div class="option-area">
							<h2>
								<b>종류</b>
							</h2>
							<ul>
								<li>
									<div class="chk-wrap">
										<input type="checkbox" name="searchOption[]" id="option_7"
											value="7"> <label for="option_7"> 건식사료 </label>
									</div>
								</li>
								<li>
									<div class="chk-wrap">
										<input type="checkbox" name="searchOption[]" id="option_8"
											value="8"> <label for="option_8"> 건조생식 </label>
									</div>
								</li>
								<li>
									<div class="chk-wrap">
										<input type="checkbox" name="searchOption[]" id="option_244"
											value="244"> <label for="option_7"> 습식사료 </label>
									</div>
								</li>
							</ul>

						</div>
					</div>
				</div>
				<div id="contents" class="goods-wrap">
					<div class="banner-area" style="border-radius: 10px">
						<a href="#"><img src="image/cat_productimg_banner.jpg"></a>
					</div>
					<div>
						<h1>신규 상품 리스트</h1>
					</div>
					<div class="list-container">
						<div class="list-m-container" style="width: 105%">
							<div class="flex-item" style="max-width: 240px;">
								<span class="label-gift-new"
									style="background-color: rgba(220, 1, 1, 0.95);"> <span
									class="label-gift-text">선착순세일</span>
								</span>
								<div class="flex-root"></div>
								<a href="/product/#" class="flex-link">
									<div class="flex-media">
										<div class="flex-img">
											<span style="display: block; height: 0px; padding-top: 100%;"></span>
											<div class="thumb_gray">
												<img class="list-img-source" src="image/123.jpg">
											</div>
										</div>
									</div>
								</a>
							</div>
							<input type="checkbox" id="b1">췤
							</button>
							<table>
								<thead>
									<tr>
										<th>상품명</th>
										<th>할인율</th>
										<th>상품가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="productDto" items="${list}">
										<tr>
											<td><a
												href="/product/detail?productNo=${productDto.productNo}">${productDto.productName}</td>
											<td>${productDto.productDiscount}</td>
											<td>${productDto.productPrice}</td>
											<td><img src="${productDto.imageURL}"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</body>

</html>