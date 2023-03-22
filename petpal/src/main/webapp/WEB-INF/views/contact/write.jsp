<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/commons.css">
</head>
<body>
		<div class="container-600">
		<form action="/upload" method="post" enctype="multipart/form-data">
			<div class="row">
				<input type="text" name="boardTitle" class="form-input w-100">
			</div>
			<div class="row">
				<input type="text" name="boardContent" class="form-input w-100">
			</div>
			<div class="row">
				<button class="form-btn positive w-100">글쓰기</button>
			</div>
		</form>
		</div>
</body>
</html>