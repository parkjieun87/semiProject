<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javascript</title>

    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <style>
        .goods-list {
            position: relative;
            margin-top:25px;
        }

        .wrap {
            position: relative;
            margin: 0 auto;
            width: 1200px;
        }

        

        #middle>.wrap {
            padding: 0 0 40px 0;
        }

        body {
            position: relative;
            min-width: 1200px;
            width: 100%;
            height: 100%;
            letter-spacing: -0.2px;
            font: 14px Pretendard, -apple-system, BlinkMacSystemFont, 'Noto Sans KR', 'Apple SD Gothic Neo', '맑은 고딕', 'Malgun Gothic', '돋움', 'dotum', 'Verdana', sans-serif;
            color: #000;
            /*word-break: break-all; word-wrap: break-word; word-break: keep-all;*/
            overflow: auto;
            overflow-y: scroll;
        }

        .goods-list #contents-wrap {
            padding-top: 20px;
        }

        #lnb {
            padding: 0 30px 0 10px;
            width: 240px;
            float: left;
        }

        #lnb+#contents {
            width: 960px;
            float: right;
        }

        .list-container {
            width: 100%;
            padding: 0 10px;
            margin-top: 30px;
        }

        .list-container .list-m-container {
            display: flex;
            flex-wrap: wrap;
            box-sizing: border-box;
        }

        .list-img-source {
            width: 178.5px;
            height: 178.5px;
        }

        .flex-item {
            width: 240px;
            height: 398.08px;
        }

        .list-container .list-m-container .flex-item .flex-root {
            width: 237px;
            color: rbga(0, 0, 0, 1);
            background-color: #fff;
        }

        html,
        body,
        div,
        span,
        applet,
        object,
        iframe,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        blockquote,
        pre,
        a,
        abbr,
        acronym,
        address,
        big,
        cite,
        code,
        del,
        dfn,
        em,
        img,
        ins,
        kbd,
        q,
        s,
        samp,
        small,
        strike,
        strong,
        sub,
        sup,
        tt,
        var,
        b,
        u,
        i,
        center,
        dl,
        dt,
        dd,
        ol,
        ul,
        li,
        fieldset,
        form,
        label,
        legend,
        table,
        caption,
        tbody,
        tfoot,
        thead,
        tr,
        th,
        td,
        article,
        aside,
        canvas,
        details,
        embed,
        figure,
        figcaption,
        footer,
        header,
        hgroup,
        menu,
        nav,
        output,
        ruby,
        section,
        summary,
        time,
        mark,
        audio,
        video {
            margin: 0;
            padding: 0;
            border: 0;
            font-family: inherit;
            vertical-align: baseline;
        }
        h1, h2, h3, h4, h5, h6 {
    font: 14px Pretendard, -apple-system, BlinkMacSystemFont, 'Noto Sans KR', 'Apple SD Gothic Neo', "맑은 고딕", "Malgun Gothic", '돋움', 'dotum', 'Verdana', sans-serif;
}
#lnb .ctg-area ul > li > ul > li > a.active {
    color: #c34;
    background: #f5f5f5;
}
#lnb .ctg-area ul > li > a.active {
    font-weight: 500;
}
a {
    text-decoration-line: none;
}
#lnb .ctg-area h2 {
    position: relative;
    margin-bottom: 15px;
    left: 4px;
    width: 240px;
    height: 40px;
    line-height: 48px;
    color: #9d9d9d;
    font-size: 12px;
    font-weight: 500;
    font-family: 'Noto Sans KR','Apple SD Gothic Neo', 'dotum', '돋움', '맑은 고딕', 'Malgun Gothic', 'Verdana', sans-serif;
    border-bottom: 1px solid #f0f0f0;
    white-space: nowrap;
}
#lnb .ctg-area ul > li > h2 a {
    color: #767676;
    text-decoration: none;
}
#lnb .ctg-area ul > li > a {
    display: block;
    position: relative;
    line-height: 30px;
    font-size: 13px;
    font-family: 'Noto Sans KR','Apple SD Gothic Neo', 'dotum', '돋움', '맑은 고딕', 'Malgun Gothic', 'Verdana', sans-serif;
    color: #464646;
}
        .thumb_gray:before {
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

        .list-container .list-m-container .flex-item .flex-root .flex-link .flex-img {
            flex: none;
            width: 210px;
            overflow: hidden;
            position: relative;
            border-radius: 16px;
            margin-bottom: auto;
            flex-direction: column;
        }

        .list-img-source {
            top: 50%;
            left: 50%;
            width: 85%;
            height: auto;
            position: absolute;
            transform: translate(-50%, -50%);
        }

        .list-container .list-m-container .flex-item {
            flex-grow: 0;
            flex-basis: 50%;
            padding: 0 6px 40px;
            flex-grow: 0;
            max-width: 235px;
            flex-basis: 50%;
            margin-bottom: 20px;
        }

        .list-container .list-m-container .flex-item .flex-root .flex-link {
            display: inline;
            text-decoration: none;
            color: rgba(0, 0, 0, 1);
        }

        .list-container .list-m-container .flex-item del {
            display: block;
            margin-top: 2px;
            font-size: 13px;
            /* padding-left: 2px; */
            line-height: 1.8;
            color: #bbb;
        }

        .view-price-new {
            margin-top: 3px;
        }
        ul {
    list-style: none;
}
em{
    font-style: normal;
}
um {
    color: #686868;
    font-size: 11px;
    margin-left: 2px;
    font-weight: normal;
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, 'Noto Sans KR', "Arial", "sans-serif";
    vertical-align: 1px;
}

button, input, select, textarea {
    color: #5b5b5b;
    font: 14px 'Noto Sans KR', 'Apple SD Gothic Neo', '맑은 고딕', 'Malgun Gothic', '돋움', 'dotum', 'applegothic', sans-serif;
    vertical-align: middle;
}




    </style>
    <!--jquery cdn-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
        	
        
        });
    </script>
</head>

<body>
  
    <div id="middle" class="goods-list">
        <div class="wrap">
            <div id="contents-wrap">
                <div id="lnb" class="item-option">
                    <div class="ctg-area">
                        <ul>
                            <li>
                                <h2 style="width:200px;">
                                    <a href="?category=1001" data="1001">사료</a>
                                </h2>

                                <ul>
                                    <li style="line-height:24px;">
                                        <a href="/shop/goods/goods_list?category=1001" class="cate-link active"
                                            data="1001">
                                            전체
                                            <span class="ic-num">(783)</span>
                                        </a>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <a href="/shop/goods/goods_list?category=1001" class="cate-link" data="1001">
                                            ${cateList}
                                            <em class="ic-num">(401)</em>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/shop/goods/goods_list?category=1001" class="cate-link" data="1001">
                                            자묘용
                                            <em class="ic-num">(401)</em>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/shop/goods/goods_list?category=1001" class="cate-link" data="1001">
                                            성묘용
                                            <em class="ic-num">(401)</em>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/shop/goods/goods_list?category=1001" class="cate-link" data="1001">
                                            노묘용
                                            <em class="ic-num">(401)</em>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/shop/goods/goods_list?category=1001" class="cate-link" data="1001">
                                            분유
                                            <em class="ic-num">(401)</em>
                                        </a>
                                    </li>
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
                            <a href="#">
                                <img src="/static/image/cat_productimg_banner.jpg" style="border-radius: 10px;">
                            </a>
                        </div>
                    </div>
                    <!-- 신규상품 리스트 start -->
                    <div class="list-container">
                        <div class="list-m-container" style="width:105%">
                        	<c:forEach var="productDto" items="${list}" varStatus="status">
                            <div class="flex-item" style="max-width:240px;">
                                <div class="flex-root">
                                    <a href="#" class="flex-link">
                                        <div class="flex-img">
                                            <span style="display: block;height: 0px;padding-top: 100%;"></span>
                                            <div class="thumb_gray">
                                                <img class="list-img-source"
                                                    src="${productDto.imageURL}">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="flex-contents">
                                        <a href="#" class="flex-link">
                                            <span>${productDto.productName}</span>
                                            <div style="margin-top:0px">
                                                <span id="discount"
                                                    style="float: left;padding-right: 4px;font-size: 13px;line-height: 24px;font-weight:500;color: #f43142;">${productDto.productDiscount}%</span>
                                                <del id="oriPrice">${productDto.productPrice}</del>
                                            </div>
                                            <div class="view-price-new">
                                                <strong class="price">
                                              ${DisPrice[status.index]}
                                                    <span
                                                        style="color:#b12603;font-weight: 700;font-size:14px;">원</span>
                                                </strong>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        	</c:forEach>
                          


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>

</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

