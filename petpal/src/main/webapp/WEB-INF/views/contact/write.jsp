<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/commons.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
        $(function(){
            $('[name=boardContent]').summernote({
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
		<div class="container-600">
		<form action="/contact/notice/write" method="post">
			<div class="row">
				<input type="text" name="boardTitle" class="form-input w-100" placeholder="제목">
			</div>
			<div class="row">
				<textarea class="form-input w-100" name="boardContent"></textarea>
			</div>
			<div class="row">
				<button class="form-btn positive w-100">글쓰기</button>
			</div>
		</form>
		</div>
</body>
</html>