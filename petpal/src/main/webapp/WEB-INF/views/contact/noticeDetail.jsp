<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/commons.css">
<link rel="stylesheet" href="/static/css/contact/notice.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.inner{
	display:flex;
	justify-content:space-between;
	width:100%;
	background-color: #90A4AE;
}

ul{
	list-style:none;
}

.inner-text{
	max-width:300px;
	margin-left:250px;
}


</style>
</head>

<body>
	<div class="container-900">
		  <div class="row-menu">
            <div class="row-menu-title">
                <h3>공지사항</h3>
            </div>         
       </div>
        <div class="inner">
            <div class="tit-cell">
                <h4 class="tit">${pageInfo.boardTitle}</h4>
            </div>
            <div class="date-cell">
                <ul class="sep-list type2">
                    <li>${pageInfo.boardDate}</li>
                </ul>
            </div>
        </div>
        <br>
        <div class="row inner-text">
        	<div class="row center">
        		${pageInfo.boardContent}
        	</div>
        </div>
	</div>
</body>
</html>