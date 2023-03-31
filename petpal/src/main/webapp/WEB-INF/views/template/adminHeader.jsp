<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPal 관리자 페이지</title>
    <link rel="stylesheet" type="text/css" href="/static/css/load.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css">

   
        <!-- header css -->
    <link rel="stylesheet" type="text/css" href="/static/css/header.css">
    
    <style>
   a
   {
   	text-decoration: none;
   	color: #2d3436;
   	font-size:14px;
	font-weight:900;
	
   }
   .table.table-slit {
            border-collapse: collapse;
            border-top: none;
            border-bottom: none;
   }

   .table.table-slit>thead {
       border-bottom: 2px #b2bec3 solid;
   }

   .table.table-slit>tbody>tr:not(:last-child) {
       border-bottom: 1px #b2bec3 solid;
   }
   .flex-vertical > div {
   		width: 200px;
   }
   .page_wrap {
	text-align:center;
	font-size:0;
	 }
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .pprev {
		background:#f8f8f8 url('/static/image/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('/static/image/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('/static/image/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('/static/image/page_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	.flex-box {
		display: flex;
	}
	.flex-box.flex-vertical {
		flex-direction: column;
	}
	main {
		width: 1700px;
		margin: auto;
	}
	section {
		display: flex;
		margin-top:100px; margin-bottom:100px;
	}
	
</style>
	<!-- jQuery Cdn -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
        $(function () {
            var hasImage = $('td').has('img').length > 0;

        });
    </script>

</head>
	
<body>
<main>
        <section>
            <aside style="border-right:1px solid gray;">
                <!-- 관리 메뉴는 수직으로 배치(List-Group 형태) -->
                <div class="flex-box flex-vertical center">
                    <div class="p-10">
                        <h2>관리자 메뉴</h2>
                    </div>
                    <div class="p-10"><a href="/admin/member/list" class="link">회원 관리</a></div>
                    <div class="p-10"><a href="/admin/product/list" class="link">상품 관리</a></div>
                    <div class="p-10"><a href="/admin/sales/list" class="link">매출 관리</a></div>
                    <div class="p-10"><a href="/admin/order/list" class="link">주문 관리</a></div>
                </div>
            </aside>
            <article>
      