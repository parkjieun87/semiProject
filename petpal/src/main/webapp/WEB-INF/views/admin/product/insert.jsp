<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
        $(function(){
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
        });
    </script>
</head>
<body>
	<h1>상품 입력 페이지</h1>
	<form action="insertProcess" method="post" enctype="multipart/form-data">
		<div>
		<label>카테고리코드</label>
		<input type="text" name="categoryCode">
		</div>
		<div>
		<label>상품명</label>
		<input type="text" name="productName">
		</div>
		<div>
		<label>상품가격</label>
		<input type="text" name="productPrice">
		</div>
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
		<input type="text" name="productDiscount">
		</div>
		<label>이미지</label>
		<input type="file" name="attach">
		<button type="submit">입력</button>
	</form>
</body>
</html>