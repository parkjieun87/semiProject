<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 <link rel="stylesheet" type="text/css" href="/static/css/load.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
    
<style>
   
	.logo 
	{
	  display: block;
	  margin: auto;
	}

   
</style>

<div class="container-600">
   <div class="row center mt-50">
		<img src = "/static/image/joinFinish.png" width = "400px" height = "400px" padding="10em" class="logo">
   </div>
  
	<div class="row center">	
	<a href="login"><button class="form-btn positive w-70">로그인하기</button></a>
	</div>
  </div>
	  
	 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
